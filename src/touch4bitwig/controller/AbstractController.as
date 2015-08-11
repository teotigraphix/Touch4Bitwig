/**
 * Created by Teoti on 8/11/2015.
 */
package touch4bitwig.controller
{

import org.robotlegs.starling.mvcs.Actor;

import starling.events.EventDispatcher;

import touch4bitwig.service.ILogger;

public class AbstractController extends Actor
{
    [Inject]
    public var logger:ILogger;

    [Inject]
    override public function set eventDispatcher(value:EventDispatcher):void
    {
        super.eventDispatcher = value;
        onRegister();
    }

    public function AbstractController()
    {
    }

    protected function onRegister():void
    {
    }
}
}
