/**
 * Created by Teoti on 4/13/2015.
 */
package touch4bitwig.model.state
{

import touch4bitwig.service.IOSCService;

public class DeviceBank extends AbstractBitwigState
{
    private var _params:Vector.<DeviceParam> = new Vector.<DeviceParam>(8, true);

    public function get params():Vector.<DeviceParam>
    {
        return _params;
    }

    public function DeviceBank(service:IOSCService)
    {
        super(service);
        for (var i:int = 0; i < _params.length; i++)
        {
            _params[i] = new DeviceParam(service, i + 1);
        }
    }
}
}
