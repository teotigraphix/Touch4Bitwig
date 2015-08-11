/**
 * Created by Teoti on 8/11/2015.
 */
package touch4bitwig.view.mediator
{

import org.robotlegs.starling.mvcs.Mediator;

import touch4bitwig.service.ILogger;

public class AbstractMediator extends Mediator
{
    [Inject]
    public var logger:ILogger;

    public function AbstractMediator()
    {
    }
}
}
