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

import com.teotigraphix.frameworks.osc.OSCManager;
import com.teotigraphix.frameworks.osc.OSCMessage;

import org.robotlegs.starling.mvcs.Actor;

import starling.events.Event;

import touch4bitwig.service.IOSCService;

public class OSCService extends Actor implements IOSCService
{
    private var _oscManager:OSCManager;

    public function get oscManager():OSCManager
    {
        return _oscManager;
    }

    public function set oscManager(value:OSCManager):void
    {
        _oscManager = value;
    }

    public function OSCService()
    {
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

    public function refresh():void
    {
        var osc:OSCMessage = new OSCMessage();
        osc.address = "/refresh";

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

