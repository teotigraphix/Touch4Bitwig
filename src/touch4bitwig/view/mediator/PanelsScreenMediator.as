/**
 * Created by Teoti on 8/22/2015.
 */
package touch4bitwig.view.mediator
{

import touch4bitwig.view.screen.PanelsScreen;

public class PanelsScreenMediator extends AbstractMediator
{
    [Inject]
    public var screen:PanelsScreen;

    public function PanelsScreenMediator()
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
