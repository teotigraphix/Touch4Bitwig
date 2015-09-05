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

import touch4bitwig.app.config.ApplicationPreferences;
import touch4bitwig.model.IConfigurationModel;
import touch4bitwig.service.IOSCService;

public class OSCService extends Actor implements IOSCService
{
    // XXX not right
    [Inject]
    public var configurationModel:IConfigurationModel;

    private var _oscManager:OSCManager;

    private var _inputIp:String;
    private var _inputPort:int;
    private var _outputIp:String;
    private var _outputPort:int;

    private var _udpConnectorIn:UDPConnector;
    private var _udpConnectorOut:UDPConnector;

    public function OSCService()
    {
    }

    public function addOSCListener(listener:IOSCListener):void
    {
        _oscManager.addOSCListener(listener);
    }


    public function setup(inputIp:String, inputPort:int, outputIp:String, outputPort:int):void
    {
        if (_oscManager != null)
        {
            close();
            _oscManager.stop();
            _oscManager = null;

        }
        _inputIp = inputIp;
        _inputPort = inputPort;
        _outputIp = outputIp;
        _outputPort = outputPort;

        _oscManager = new OSCManager();
    }

    public function connect():Boolean
    {
        var preferences:ApplicationPreferences = configurationModel.applicationPreferences;
        // calls _connection.close() if current connection exists
        // recreates the OSCManager
        setup(preferences.deviceIP, preferences.devicePort,
              preferences.dawIP, preferences.dawPort);

        var bound:Boolean = _connect();
        return bound;
    }

    public function _connect():Boolean
    {
        try
        {
            _udpConnectorIn = new UDPConnector(_inputIp, _inputPort, true);
        }
        catch (e:Error)
        {
            trace(e.getStackTrace());
            return false;
        }

        _udpConnectorOut = new UDPConnector(_outputIp, _outputPort, false);

        _oscManager.connectorIn = _udpConnectorIn;
        _oscManager.connectorOut = _udpConnectorOut;

        return true;
    }

    public function close():void
    {
        // TODO throw error
        if (_udpConnectorIn == null)
            return;

        _udpConnectorIn.close();
        _udpConnectorOut.close();

        _oscManager.connectorIn = null;
        _oscManager.connectorOut = null;
    }

    //

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

    public function dispatchEvent(event:Event):void
    {
        eventDispatcher.dispatchEvent(event);
    }
}
}

