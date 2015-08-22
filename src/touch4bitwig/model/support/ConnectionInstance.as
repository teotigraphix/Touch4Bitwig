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

package touch4bitwig.model.support
{

import com.teotigraphix.frameworks.osc.OSCManager;
import com.teotigraphix.frameworks.osc.connectors.UDPConnector;

public class ConnectionInstance
{
    private var _inputIp:String;
    private var _inputPort:int;
    private var _outputIp:String;
    private var _outputPort:int;

    private var _udpConnectorIn:UDPConnector;
    private var _udpConnectorOut:UDPConnector;

    private var _oscManager:OSCManager;

    public function get oscManager():OSCManager
    {
        return _oscManager;
    }

    public function ConnectionInstance()
    {
    }

    public function setup(inputIp:String, inputPort:int, outputIp:String, outputPort:int):void
    {
        _inputIp = inputIp;
        _inputPort = inputPort;
        _outputIp = outputIp;
        _outputPort = outputPort;

        _oscManager = new OSCManager();
    }

    public function connect():Boolean
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
        _udpConnectorIn.close();
        _udpConnectorOut.close();
    }
}
}
