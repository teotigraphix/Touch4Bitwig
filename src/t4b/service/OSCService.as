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
package t4b.service
{

import com.teotigraphix.frameworks.osc.IOSCListener;
import com.teotigraphix.frameworks.osc.OSCManager;
import com.teotigraphix.frameworks.osc.OSCMessage;
import com.teotigraphix.frameworks.osc.connectors.UDPConnector;
import com.teotigraphix.service.ILogger;

import org.robotlegs.starling.mvcs.Actor;

import starling.events.Event;

import t4b.model.state.ConfigurationState;

public class OSCService extends Actor
{
    public static const TAG:String = "OSCService";

    [Inject]
    public var logger:ILogger;

    private var _oscManager:OSCManager;

    private var _udpConnectorIn:UDPConnector;
    private var _udpConnectorOut:UDPConnector;

    private var _configurationState:ConfigurationState;

    public function get isBound():Boolean
    {
        return _udpConnectorIn != null && _udpConnectorOut != null &&
                _udpConnectorIn.bound && _udpConnectorOut.bound;
    }

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

    public function connect(configurationState:ConfigurationState):Boolean
    {
        _configurationState = configurationState;
        
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

        // TODO dispatchEventWith(ServiceCommandType.CLOSE_OSC_CONNECTION_COMPLETE);
    }

    public function send(message:String):void
    {
        logger.log(TAG, "send() {0}", message.toString());
        var osc:OSCMessage = new OSCMessage();
        osc.address = message;
        _oscManager.sendOSCPacket(osc);
    }

    //

    public function sendString(message:String, value:String):void
    {
        logger.log(TAG, "sendString() {0}", message.toString());
        var osc:OSCMessage = new OSCMessage();
        osc.address = message;
        osc.addArgument("s", value);

        _oscManager.sendOSCPacket(osc);
    }

    public function sendInt(message:String, value:int):void
    {
        logger.log(TAG, "sendInt() {0}", message.toString());
        var osc:OSCMessage = new OSCMessage();
        osc.address = message;
        osc.addArgument("i", value);

        _oscManager.sendOSCPacket(osc);
    }

    public function sendFloat(message:String, value:Number):void
    {
        logger.log(TAG, "sendFloat() {0}", message.toString());
        var osc:OSCMessage = new OSCMessage();
        osc.address = message;
        osc.addArgument("f", value);

        _oscManager.sendOSCPacket(osc);
    }

    public function sendBoolean(message:String, value:Boolean):void
    {
        logger.log(TAG, "sendBoolean() {0}", message.toString());
        var osc:OSCMessage = new OSCMessage();
        osc.address = message;
        osc.addArgument("i", value ? 1 : 0);
        _oscManager.sendOSCPacket(osc);
    }

    public function refresh():void
    {
        logger.log(TAG, "refresh()");

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
        logger.log(TAG, "createConnections()");

        _udpConnectorIn = new UDPConnector(_configurationState.deviceIP, _configurationState.devicePort, true);
        _udpConnectorOut = new UDPConnector(_configurationState.dawIP, _configurationState.dawPort, false);

        _oscManager.connectorIn = _udpConnectorIn;
        _oscManager.connectorOut = _udpConnectorOut;
    }

    public function dispatchEvent(event:Event):void
    {
        eventDispatcher.dispatchEvent(event);
    }
}
}

