/**
 * Created by Teoti on 4/5/2015.
 */
package touch4bitwig.ui.component.main
{

import starling.events.Event;

import touch4bitwig.event.ApplicationModelEventType;
import touch4bitwig.ui.AbstractUIMediator;

public class MainHeaderMediator extends AbstractUIMediator
{
    [Inject]
    public var view:MainHeader;

    public function MainHeaderMediator()
    {
    }

    override public function onRegister():void
    {
        super.onRegister();

        addContextListener(ApplicationModelEventType.ACTIVE_CHANGE, context_activeEngineChange);

        addViewListener(MainHeader.EVENT_ACTIVE_ENGINE_CHANGE, view_activeEngineChange);
        addViewListener(MainHeader.EVENT_SCREEN_CHANGE, view_screenChange);

        view.setActiveEngine(oscModel.application.active);
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    private function context_activeEngineChange(event:Event, data:Object):void
    {
        view.setActiveEngine(data.value);
    }

    private function view_screenChange(event:Event, id:String):void
    {
        uiModel.screenID = id;
    }

    private function view_activeEngineChange(event:Event):void
    {
        oscService.send("/active");
    }
}
}
