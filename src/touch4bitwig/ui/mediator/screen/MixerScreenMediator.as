/**
 * Created by Teoti on 4/4/2015.
 */
package touch4bitwig.ui.mediator.screen
{

import com.teotigraphix.bitwig.ui.component.screen.MixerScreen;
import com.teotigraphix.bitwig.ui.mediator.BitwigTouchMediator;

public class MixerScreenMediator extends BitwigTouchMediator
{
    private var view:MixerScreen;

    public function MixerScreenMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();
    }

    override public function onRegister():void
    {
        super.onRegister();
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    override public function setViewComponent(viewComponent:Object):void
    {
        super.setViewComponent(viewComponent);
        view = MixerScreen(viewComponent);
    }

    override public function preRemove():void
    {
        super.preRemove();
        view = null;
    }
}
}
