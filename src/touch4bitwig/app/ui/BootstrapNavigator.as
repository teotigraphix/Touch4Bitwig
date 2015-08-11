
package touch4bitwig.app.ui
{

import feathers.controls.StackScreenNavigator;
import feathers.events.FeathersEventType;

import starling.events.Event;

public class BootstrapNavigator extends StackScreenNavigator implements IBootstrapNavigator
{
    public function BootstrapNavigator()
    {
        addEventListener(FeathersEventType.INITIALIZE, this_initializeHandler);
        addEventListener(FeathersEventType.CREATION_COMPLETE, this_creationCompleteHandler);
        addEventListener(Event.ADDED_TO_STAGE, this_addedToStageHandler);
        addEventListener(Event.REMOVED_FROM_STAGE, this_removedToStageHandler);
    }

    private function this_initializeHandler(event:Event):void
    {
        trace("BootstrapNavigator.INITIALIZE()");
    }

    private function this_creationCompleteHandler(event:Event):void
    {
        trace("BootstrapNavigator.CREATION_COMPLETE()");
    }

    private function this_addedToStageHandler(event:Event):void
    {
        trace("BootstrapNavigator.ADDED_TO_STAGE()");
    }

    private function this_removedToStageHandler(event:Event):void
    {
        trace("BootstrapNavigator.REMOVED_FROM_STAGE()");
    }
}
}
