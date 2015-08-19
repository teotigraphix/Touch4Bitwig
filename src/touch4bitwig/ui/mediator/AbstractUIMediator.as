/**
 * Created by Teoti on 4/4/2015.
 */
package touch4bitwig.ui.mediator
{

import org.robotlegs.starling.mvcs.Mediator;

import touch4bitwig.model.support.UIModel;

public class AbstractUIMediator extends Mediator
{
    [Inject]
    public var uiModel:UIModel;

    public function AbstractUIMediator()
    {
    }
}
}
