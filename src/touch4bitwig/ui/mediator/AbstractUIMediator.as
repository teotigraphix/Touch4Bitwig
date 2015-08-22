/**
 * Created by Teoti on 4/4/2015.
 */
package touch4bitwig.ui.mediator
{

import org.robotlegs.starling.mvcs.Mediator;

import touch4bitwig.model.IOSCModel;
import touch4bitwig.model.IUIModel;

public class AbstractUIMediator extends Mediator
{
    [Inject]
    public var uiModel:IUIModel;

    [Inject]
    public var oscModel:IOSCModel;

    public function AbstractUIMediator()
    {
    }
}
}
