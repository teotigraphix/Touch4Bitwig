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

package touch4bitwig.controller
{

import com.teotigraphix.controller.AbstractController;
import com.teotigraphix.frameworks.osc.IOSCListener;
import com.teotigraphix.frameworks.osc.OSCMessage;

import touch4bitwig.model.IConfigurationModel;
import touch4bitwig.model.IOSCModel;
import touch4bitwig.service.IOSCService;
import touch4bitwig.service.support.osc.listeners.ApplicationListener;
import touch4bitwig.service.support.osc.listeners.DeviceListener;
import touch4bitwig.service.support.osc.listeners.PanelListener;
import touch4bitwig.service.support.osc.listeners.TrackListener;
import touch4bitwig.service.support.osc.listeners.TransportListener;

public class OSCMessageController extends AbstractController implements IOSCListener
{
    [Inject]
    public var oscModel:IOSCModel;

    [Inject]
    public var oscService:IOSCService;

    [Inject]
    public var configurationModel:IConfigurationModel;

    private var _trackListener:TrackListener;
    private var _transportListener:TransportListener;
    private var _deviceListener:DeviceListener;
    private var _panelListener:PanelListener;
    private var _applicationListener:ApplicationListener;

    public function OSCMessageController()
    {
    }

    override protected function onRegister():void
    {
        super.onRegister();

        _trackListener = new TrackListener(oscService, oscModel.trackBank);
        _transportListener = new TransportListener(oscService, oscModel.transport);
        _deviceListener = new DeviceListener(oscService, oscModel.cursorDevice); // XXX cursorDevice This needs
                                                                                 // attention
        _panelListener = new PanelListener(oscService, oscModel.arranger, oscModel.mixer);
        _applicationListener = new ApplicationListener(oscService, oscModel.application);

        oscService.addOSCListener(this);
        // eventDispatcher.addEventListener(ApplicationEventType.APPLICATION_COMPLETE, applicationCompleteHandler);
    }

    public function reconnectAndStartup(dawIP:String, dawPort:int, deviceIP:String, devicePort:int):Boolean
    {
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

    public function acceptOSCMessage(osc:OSCMessage):void
    {
        //trace(osc.address);

        if (osc.address.indexOf("/vu") == -1)
        {
            if (osc.arguments != null && osc.arguments.length > 0)
            {
                trace(osc.address + ",  " + osc.argumentsToString());
            }
            else
            {
                trace(osc.address);
            }
        }

        if (_deviceListener.isHandled(osc))
            _deviceListener.handle(osc);
        else if (_trackListener.isHandled(osc))
            _trackListener.handle(osc);
        else if (_transportListener.isHandled(osc))
            _transportListener.handle(osc);
        else if (_panelListener.isHandled(osc))
            _panelListener.handle(osc);
        else if (_applicationListener.isHandled(osc))
            _applicationListener.handle(osc);
    }

    public function close():void
    {
        oscService.close();
    }
}
}
