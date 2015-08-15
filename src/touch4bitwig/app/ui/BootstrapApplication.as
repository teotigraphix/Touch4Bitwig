
package touch4bitwig.app.ui
{

import feathers.core.DrawersApplication;
import feathers.events.FeathersEventType;

import flash.desktop.NativeApplication;
import flash.events.Event;

import starling.events.Event;

/*

*/

public class BootstrapApplication extends DrawersApplication implements IBootstrapApplication
{
    public function BootstrapApplication()
    {
        addEventListener(FeathersEventType.INITIALIZE, this_initializeHandler);
        addEventListener(FeathersEventType.CREATION_COMPLETE, this_creationCompleteHandler);
        addEventListener(starling.events.Event.ADDED_TO_STAGE, this_addedToStageHandler);
        addEventListener(starling.events.Event.REMOVED_FROM_STAGE, this_removedToStageHandler);

        var application:NativeApplication = NativeApplication.nativeApplication;
        application.addEventListener(flash.events.Event.EXITING, closingHandler);
    }

    private function this_initializeHandler(event:starling.events.Event):void
    {
        trace("BootstrapApplication.INITIALIZE()");
    }

    private function this_creationCompleteHandler(event:starling.events.Event):void
    {
        trace("BootstrapApplication.CREATION_COMPLETE()");
    }

    private function this_addedToStageHandler(event:starling.events.Event):void
    {
        trace("BootstrapApplication.ADDED_TO_STAGE()");
    }

    private function this_removedToStageHandler(event:starling.events.Event):void
    {
        trace("BootstrapApplication.REMOVED_FROM_STAGE()");
    }

    private function closingHandler(event:flash.events.Event):void
    {
    }
}
}
