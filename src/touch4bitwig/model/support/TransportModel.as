/**
 * Created by Teoti on 4/5/2015.
 */
package touch4bitwig.model.support
{

import touch4bitwig.model.state.Transport;
import touch4bitwig.service.IOSCService;

public class TransportModel extends AbstractModel
{
    [Inject]
    public var oscService:IOSCService;

    private var _transport:Transport;
    private var _automationWriteModeMap:Object;

    public function get transport():Transport
    {
        return _transport;
    }

    public function TransportModel()
    {
        _automationWriteModeMap = {};
        _automationWriteModeMap[0] = "latch";
        _automationWriteModeMap[1] = "touch";
        _automationWriteModeMap[2] = "write";
    }

    override protected function onRegister():void
    {
        _transport = new Transport(oscService);
    }

    public function getAutomationWriteModeValue(index:int):String
    {
        return _automationWriteModeMap[index];
    }
}
}
