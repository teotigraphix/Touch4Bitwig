/**
 * Created by Teoti on 4/14/2015.
 */
package touch4bitwig.model.support
{

import touch4bitwig.model.state.Arranger;
import touch4bitwig.model.state.Mixer;
import touch4bitwig.model.state.Panes;
import touch4bitwig.service.IOSCService;

public class FrameModel extends AbstractModel
{
    [Inject]
    public var oscService:IOSCService;

    private var _panes:Panes;
    private var _arranger:Arranger;
    private var _mixer:Mixer;

    public function get panes():Panes
    {
        return _panes;
    }

    public function get arranger():Arranger
    {
        return _arranger;
    }

    public function get mixer():Mixer
    {
        return _mixer;
    }

    public function FrameModel()
    {
    }

    override protected function onRegister():void
    {
        super.onRegister();

        _panes = new Panes(oscService);
        _arranger = new Arranger(oscService);
        _mixer = new Mixer(oscService);
    }
}
}
