////////////////////////////////////////////////////////////////////////////////
// Copyright 2015 Michael Schmalle - Teoti Graphix, LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License
//
// Author: Michael Schmalle, Principal Architect
// mschmalle at teotigraphix dot com
////////////////////////////////////////////////////////////////////////////////

package touch4bitwig.controller {

import com.teotigraphix.controller.impl.AbstractController;
import com.teotigraphix.frameworks.osc.IOSCListener;
import com.teotigraphix.frameworks.osc.OSCMessage;

import touch4bitwig.model.IConfigurationModel;
import touch4bitwig.model.IOSCModel;
import touch4bitwig.service.IBitwigStateListener;
import touch4bitwig.service.IOSCService;
import touch4bitwig.service.support.osc.listeners.DeviceListener;
import touch4bitwig.service.support.osc.listeners.PanelListener;

public class OSCMessageController extends AbstractController implements IOSCListener {
    //--------------------------------------------------------------------------
    // Inject
    //--------------------------------------------------------------------------

    public function OSCMessageController() {
    }
    [Inject]
    public var oscModel:IOSCModel;
    [Inject]
    public var oscService:IOSCService;

    //--------------------------------------------------------------------------
    // Private :: Variables
    //--------------------------------------------------------------------------
    [Inject]
    public var configurationModel:IConfigurationModel;

    //--------------------------------------------------------------------------
    // Constructor
    //--------------------------------------------------------------------------
    private var _listeners:Vector.<IBitwigStateListener> = new <IBitwigStateListener>[];

    //--------------------------------------------------------------------------
    // Overridden :: Methods
    //--------------------------------------------------------------------------

    override protected function onRegister():void {
        super.onRegister();

        // TODO move these into higher abstraction

        addStateListener(oscModel.trackBank);
        addStateListener(oscModel.transport);
        // XXX cursorDevice This needs attention
        addStateListener(new DeviceListener(oscService, oscModel.cursorDevice));

        addStateListener(new PanelListener(oscService, oscModel.arranger, oscModel.mixer));
        addStateListener(oscModel.application);
        addStateListener(oscModel.browser);

        oscService.addOSCListener(this);
        // eventDispatcher.addEventListener(ApplicationEventType.APPLICATION_COMPLETE, applicationCompleteHandler);
    }

    //--------------------------------------------------------------------------
    // Public :: Methods
    //--------------------------------------------------------------------------

    /**
     * Adds a Bitwig state listener for OSCMessage notification.
     *
     * @param listener The state listener to be added.
     */
    public function addStateListener(listener:IBitwigStateListener):void {
        _listeners.push(listener);
        listener.configure();
    }

    /**
     * Removes a Bitwig state listener from OSCMessage notification.
     *
     * @param listener The state listener to be removed.
     */
    public function removeStateListener(listener:IBitwigStateListener):void {
        _listeners.splice(_listeners.indexOf(listener), 1);
        listener.dispose();
    }

    /**
     * Reconnects the DAW to Device OSC connection.
     *
     * @param dawIP Bitwig IP address.
     * @param dawPort Bitwig port.
     * @param deviceIP Device IP address.
     * @param devicePort Device port.
     * @return Returns if the OSC connection was able to bind to the IP and port of Bitwig and the device.
     */
    public function reconnectAndStartup(dawIP:String, dawPort:int, deviceIP:String, devicePort:int):Boolean {
        var bound:Boolean = oscService.connect(deviceIP, devicePort, dawIP, dawPort);
        if (!bound)
            return false;

        configurationModel.applicationPreferences.dawIP = dawIP;
        configurationModel.applicationPreferences.dawPort = dawPort;
        configurationModel.applicationPreferences.deviceIP = deviceIP;
        configurationModel.applicationPreferences.devicePort = devicePort;

        oscService.refresh();

        return true;
    }

    /**
     * @inheritDoc
     */
    public function acceptOSCMessage(message:OSCMessage):void {
        //trace(osc.address);

        if (message.address.indexOf("/vu") == -1) {
            if (message.arguments != null && message.arguments.length > 0) {
                trace(message.address + ",  " + message.argumentsToString());
            }
            else {
                trace(message.address);
            }
        }

        for each (var listener:IBitwigStateListener in _listeners) {
            if (listener.isHandled(message)) {
                listener.handle(message);
                break;
            }
        }
    }
}
}
