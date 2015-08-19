/**
 * Created by Teoti on 4/5/2015.
 */
package touch4bitwig.ui.mediator.main
{

import starling.events.Event;

import touch4bitwig.event.ApplicationModelEventType;
import touch4bitwig.model.support.ApplicationModel;
import touch4bitwig.service.IOSCService;
import touch4bitwig.ui.component.main.MainHeader_;
import touch4bitwig.ui.mediator.AbstractUIMediator;

public class MainHeaderMediator extends AbstractUIMediator
{
    [Inject]
    public var oscService:IOSCService;

    [Inject]
    public var applicationModel:ApplicationModel;

    private var view:MainHeader_;

    public function MainHeaderMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();

        addContextListener(ApplicationModelEventType.ACTIVE_CHANGE, context_activeEngineChange);

        addViewListener(MainHeader_.EVENT_ACTIVE_ENGINE_CHANGE, view_activeEngineChange);
        addViewListener(MainHeader_.EVENT_NAVIGATION_CHANGE, view_navigationChange);
    }

    override public function onRegister():void
    {
        super.onRegister();
        // TODO make property
        view.setActiveEngine(applicationModel.application.active);
    }

    override public function setViewComponent(viewComponent:Object):void
    {
        super.setViewComponent(viewComponent);
        view = MainHeader_(viewComponent);
    }

    override public function preRemove():void
    {
        super.preRemove();
    }

    private function context_activeEngineChange(event:Event, data:Object):void
    {
        view.setActiveEngine(data.value);
    }

    private function view_navigationChange(event:Event, index:int):void
    {
        uiModel.mainScreenIndex = index;
    }

    private function view_activeEngineChange(event:Event):void
    {
        oscService.send("/active");
    }
}
}
