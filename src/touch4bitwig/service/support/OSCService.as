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

package touch4bitwig.service.support
{

import com.teotigraphix.frameworks.osc.IOSCListener;
import com.teotigraphix.frameworks.osc.OSCManager;
import com.teotigraphix.frameworks.osc.OSCMessage;

import org.robotlegs.starling.mvcs.Actor;

import starling.events.Event;

import touch4bitwig.model.IConfigurationModel;
import touch4bitwig.model.IOSCModel;
import touch4bitwig.service.IOSCService;
import touch4bitwig.service.support.osc.listeners.ApplicationListener;
import touch4bitwig.service.support.osc.listeners.DeviceListener;
import touch4bitwig.service.support.osc.listeners.FrameListener;
import touch4bitwig.service.support.osc.listeners.TrackListener;
import touch4bitwig.service.support.osc.listeners.TransportListener;

public class OSCService extends Actor implements IOSCService, IOSCListener
{
    [Inject]
    public var configurationModel:IConfigurationModel;

    private var _oscManager:OSCManager;

    private var _trackListener:TrackListener;
    private var _transportListener:TransportListener;
    private var _deviceListener:DeviceListener;
    private var _frameListener:FrameListener;
    private var _applicationListener:ApplicationListener;

    public function get oscManager():OSCManager
    {
        return _oscManager;
    }

    public function OSCService()
    {
    }

    /**
     * Bitwig:
     * Android setup
     * Host:192.168.1.36:8000
     * Host:192.168.1.39/40:9000 <- Send to Android's IP address
     */
    public function start(model:IOSCModel):void
    {
        _oscManager = configurationModel.connection.oscManager;
        _oscManager.addMsgListener(this);

        // XXX This is totally wrong, a service shouldn't have references to a Model
        // needs to be moved in a OSCMessageController class
        _trackListener = new TrackListener(this, model.trackBank);
        _transportListener = new TransportListener(this, model.transport);
        _deviceListener = new DeviceListener(this, model.cursorDevice); // XXX cursorDevice This needs attention
        _frameListener = new FrameListener(this, model.arranger, model.mixer);
        _applicationListener = new ApplicationListener(this, model.application);
    }

    public function send(message:String):void
    {
        var osc:OSCMessage = new OSCMessage();
        osc.address = message;
        _oscManager.sendOSCPacket(osc);
    }

    public function sendString(message:String, value:String):void
    {
        var osc:OSCMessage = new OSCMessage();
        osc.address = message;
        osc.addArgument("s", value);

        _oscManager.sendOSCPacket(osc);
    }

    public function sendInt(message:String, value:int):void
    {
        var osc:OSCMessage = new OSCMessage();
        osc.address = message;
        osc.addArgument("i", value);

        _oscManager.sendOSCPacket(osc);
    }

    public function sendBoolean(message:String, value:Boolean):void
    {
        var osc:OSCMessage = new OSCMessage();
        osc.address = message;
        osc.addArgument("i", value ? 1 : 0);
        _oscManager.sendOSCPacket(osc);
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

    public function refresh():void
    {
        var osc:OSCMessage = new OSCMessage();
        osc.address = "/refresh";
        // XXX TEMP
        if (_oscManager != null)
            _oscManager.sendOSCPacket(osc);
    }

    public function dispatchEventWith(type:String, bubbles:Boolean = false, data:Object = null):void
    {
        eventDispatcher.dispatchEventWith(type, bubbles, data);
    }

    public function dispatchEvent(event:Event):void
    {
        eventDispatcher.dispatchEvent(event);
    }
}
}

