/**
 * Created by Teoti on 4/5/2015.
 */
package touch4bitwig.model.support
{

import touch4bitwig.model.state.TrackBank;
import touch4bitwig.service.IOSCService;

public class TrackModel extends AbstractModel
{
    [Inject]
    public var oscService:IOSCService;

    private var _bank:TrackBank;

    public function get bank():TrackBank
    {
        return _bank;
    }

    public function TrackModel()
    {
    }

    override protected function onRegister():void
    {
        _bank = new TrackBank(oscService);
    }

}
}
