/**
 * Created by Teoti on 8/18/2015.
 */
package touch4bitwig.view.screen
{

import touch4bitwig.view.AbstractMediator;
import touch4bitwig.view.screen.MixerScreen;

public class MixerScreenMediator extends AbstractMediator
{
    [Inject]
    public var screen:MixerScreen;

    public function MixerScreenMediator()
    {
    }

    override public function onRegister():void
    {
        super.onRegister();
    }

    override public function onRemove():void
    {
        super.onRemove();
    }
}
}
