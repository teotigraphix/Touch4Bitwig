/**
 * Created by Teoti on 4/17/2015.
 */
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
