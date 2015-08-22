/**
 * Created by Teoti on 4/4/2015.
 */
package touch4bitwig.ui
{

import org.robotlegs.starling.mvcs.Mediator;

import touch4bitwig.model.IOSCModel;
import touch4bitwig.model.IUIModel;
import touch4bitwig.service.IOSCService;

public class AbstractUIMediator extends Mediator
{
    [Inject]
    public var uiModel:IUIModel;

    [Inject]
    public var oscModel:IOSCModel;

    [Inject]
    public var oscService:IOSCService;

    public function AbstractUIMediator()
    {
    }
}
}
