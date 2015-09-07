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
import com.teotigraphix.frameworks.osc.connectors.UDPConnector;

import org.robotlegs.starling.mvcs.Actor;

import starling.events.Event;

import touch4bitwig.service.IOSCService;

public class OSCService extends Actor implements IOSCService
{
    private var _oscManager:OSCManager;

    private var _inputIp:String;
    private var _inputPort:int;
    private var _outputIp:String;
    private var _outputPort:int;

    private var _udpConnectorIn:UDPConnector;
    private var _udpConnectorOut:UDPConnector;

    public function get isRunning():Boolean
    {
        return _oscManager.running;
    }

    public function OSCService()
    {
        _oscManager = new OSCManager();
    }

    public function addOSCListener(listener:IOSCListener):void
    {
        _oscManager.addOSCListener(listener);
    }

    public function removeOSCListener(listener:IOSCListener):void
    {
        _oscManager.removeOSCListener(listener);
    }

    public function connect(inputIp:String, inputPort:int, outputIp:String, outputPort:int):Boolean
    {
        _inputIp = inputIp; // device
        _inputPort = inputPort;
        _outputIp = outputIp; // daw
        _outputPort = outputPort;

        try
        {
            createConnections();

            _oscManager.start();
        }
        catch (e:Error)
        {
            trace(e.getStackTrace());
            return false;
        }

        return true;
    }

    public function close():void
    {
        if (_udpConnectorIn != null && _udpConnectorOut != null)
            trace("CLOSED 1", _udpConnectorIn.bound, _udpConnectorOut.bound);

        if (_udpConnectorIn != null)
            _udpConnectorIn.close();
        if (_udpConnectorOut != null)
            _udpConnectorOut.close();

        _oscManager.stop();

        if (_udpConnectorIn != null && _udpConnectorOut != null)
            trace("CLOSED 2", _udpConnectorIn.bound, _udpConnectorOut.bound);
        else
            trace("No CLOSE, not connected");

        _oscManager.connectorIn = null;
        _oscManager.connectorOut = null;

        trace("CLOSED 3");
    }

    public function send(message:String):void
    {
        var osc:OSCMessage = new OSCMessage();
        osc.address = message;
        _oscManager.sendOSCPacket(osc);
    }

    //

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

    public function sendFloat(message:String, value:Number):void
    {
        var osc:OSCMessage = new OSCMessage();
        osc.address = message;
        osc.addArgument("f", value);

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

    private function createConnections():void
    {
        _udpConnectorIn = new UDPConnector(_inputIp, _inputPort, true);
        _udpConnectorOut = new UDPConnector(_outputIp, _outputPort, false);

        _oscManager.connectorIn = _udpConnectorIn;
        _oscManager.connectorOut = _udpConnectorOut;
    }

    public function dispatchEvent(event:Event):void
    {
        eventDispatcher.dispatchEvent(event);
    }
}
}

