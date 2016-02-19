////////////////////////////////////////////////////////////////////////////////
// Copyright 2016 Michael Schmalle - Teoti Graphix, LLC
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
package t4b.controller
{

import com.teotigraphix.controller.core.AbstractController;
import com.teotigraphix.frameworks.osc.IOSCListener;
import com.teotigraphix.frameworks.osc.OSCMessage;

import t4b.model.ConfigurationModel;
import t4b.model.OSCModel;
import t4b.model.osc.IBitwigStateListener;
import t4b.service.OSCService;

public class OSCMessageController extends AbstractController implements IOSCListener
{
    //--------------------------------------------------------------------------
    // Inject
    //--------------------------------------------------------------------------

    [Inject]
    public var oscModel:OSCModel;

    [Inject]
    public var oscService:OSCService;

    [Inject]
    public var configurationModel:ConfigurationModel;

    //--------------------------------------------------------------------------
    // Private :: Variables
    //--------------------------------------------------------------------------

    private var _listeners:Vector.<IBitwigStateListener> = new <IBitwigStateListener>[];

    //--------------------------------------------------------------------------
    // Constructor
    //--------------------------------------------------------------------------

    public function OSCMessageController()
    {
    }

    //--------------------------------------------------------------------------
    // Overridden :: Methods
    //--------------------------------------------------------------------------

    override protected function onRegister():void
    {
        super.onRegister();

        // TODO move these into higher abstraction

        //addStateListener(oscModel.trackBank);
        addStateListener(oscModel.transport);
        // XXX cursorDevice This needs attention
        //addStateListener(new DeviceListener(oscService, oscModel.cursorDevice));

        //addStateListener(new PanelListener(oscService, oscModel.arranger, oscModel.mixer));
        //addStateListener(oscModel.application);
        //addStateListener(oscModel.browser);

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
    public function addStateListener(listener:IBitwigStateListener):void
    {
        _listeners.push(listener);
        listener.configure();
    }

    /**
     * Removes a Bitwig state listener from OSCMessage notification.
     *
     * @param listener The state listener to be removed.
     */
    public function removeStateListener(listener:IBitwigStateListener):void
    {
        _listeners.splice(_listeners.indexOf(listener), 1);
        listener.dispose();
    }

    /**
     * @inheritDoc
     */
    public function acceptOSCMessage(message:OSCMessage):void
    {
        //trace(osc.address);

        if (message.address.indexOf("/vu") == -1)
        {
            if (message.arguments != null && message.arguments.length > 0)
            {
                trace(message.address + ",  " + message.argumentsToString());
            }
            else
            {
                trace(message.address);
            }
        }

        for each (var listener:IBitwigStateListener in _listeners)
        {
            if (listener.isHandled(message))
            {
                listener.handle(message);
                break;
            }
        }
    }
}
}
