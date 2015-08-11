/**
 * Created by Teoti on 4/5/2015.
 */
package touch4bitwig.controller
{

import starling.events.Event;

import touch4bitwig.event.ApplicationEventType;
import touch4bitwig.model.support.ConnectionInstance;
import touch4bitwig.service.IOSCService;

public class ApplicationController extends AbstractController
{
    private static const TAG:String = "ApplicationController";

    [Inject]
    public var connection:ConnectionInstance;

    [Inject]
    public var oscService:IOSCService;

    public function ApplicationController()
    {
    }

    override protected function onRegister():void
    {
        eventDispatcher.addEventListener(ApplicationEventType.APPLICATION_COMPLETE, applicationCompleteHandler);
        eventDispatcher.addEventListener(ApplicationEventType.APPLICATION_ACTIVATE, applicationActivateHandler);
        eventDispatcher.addEventListener(ApplicationEventType.APPLICATION_DEACTIVATE, applicationDeactivateHandler);
        eventDispatcher.addEventListener(ApplicationEventType.APPLICATION_EXIT, applicationExitHandler);
    }

    private function applicationCompleteHandler(event:Event):void
    {
        logger.log(TAG, "applicationCompleteHandler()");
    }

    private function applicationActivateHandler(event:Event):void
    {

    }

    private function applicationDeactivateHandler(event:Event):void
    {

    }

    private function applicationExitHandler(event:Event):void
    {
        connection.close();
    }
}
}
