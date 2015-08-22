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

import com.teotigraphix.frameworks.osc.IOSCListener;
import com.teotigraphix.frameworks.osc.OSCMessage;

import touch4bitwig.model.IConfigurationModel;
import touch4bitwig.model.IOSCModel;
import touch4bitwig.service.IOSCService;
import touch4bitwig.service.support.osc.listeners.ApplicationListener;
import touch4bitwig.service.support.osc.listeners.DeviceListener;
import touch4bitwig.service.support.osc.listeners.FrameListener;
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
    private var _frameListener:FrameListener;
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
        _frameListener = new FrameListener(oscService, oscModel.arranger, oscModel.mixer);
        _applicationListener = new ApplicationListener(oscService, oscModel.application);

        // eventDispatcher.addEventListener(ApplicationEventType.APPLICATION_COMPLETE, applicationCompleteHandler);
    }

    /**
     * Bitwig:
     * Android setup
     * Host:192.168.1.36:8000
     * Host:192.168.1.39/40:9000 <- Send to Android's IP address
     */
    public function start():void
    {
        configurationModel.connection.oscManager.addMsgListener(this);

        oscService.oscManager = configurationModel.connection.oscManager;
        oscService.refresh();
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
        else if (_frameListener.isHandled(osc))
            _frameListener.handle(osc);
        else if (_applicationListener.isHandled(osc))
            _applicationListener.handle(osc);
    }
}
}
