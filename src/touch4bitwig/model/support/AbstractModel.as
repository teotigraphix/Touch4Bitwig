package touch4bitwig.model.support
{

import org.robotlegs.starling.mvcs.Actor;

import starling.events.EventDispatcher;

public class AbstractModel extends Actor
{
    [Inject]
    override public function set eventDispatcher(value:EventDispatcher):void
    {
        super.eventDispatcher = value;
        onRegister();
    }

    public function AbstractModel()
    {
    }

    protected function onRegister():void
    {
    }
}
}
