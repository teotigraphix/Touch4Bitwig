/**
 * Created by Teoti on 4/3/2015.
 */
package touch4bitwig.ui.mediator.main
{

import com.teotigraphix.bitwig.event.UIModelEventType;
import com.teotigraphix.bitwig.service.IOSCService;
import com.teotigraphix.bitwig.ui.component.screen.ClipsScreen;
import com.teotigraphix.bitwig.ui.component.screen.MixerScreen;
import com.teotigraphix.bitwig.ui.component.screen.PanelsScreen;
import com.teotigraphix.bitwig.ui.component.screen.DeviceScreen;
import com.teotigraphix.ui.mediator.app.AbstractApplicationDrawerMediator;

import feathers.controls.ScreenNavigator;
import feathers.controls.ScreenNavigatorItem;
import feathers.motion.Slide;

import starling.core.Starling;
import starling.events.Event;

public class ApplicationDrawerMediator extends AbstractApplicationDrawerMediator
{
    [Inject]
    public var oscService:IOSCService;

    public function ApplicationDrawerMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();

        addContextListener(UIModelEventType.MAIN_SCREEN_INDEX_CHANGE, context_mainScreenIndexChange);
    }

    override public function onRegister():void
    {
        super.onRegister();
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    override public function setViewComponent(viewComponent:Object):void
    {
        super.setViewComponent(viewComponent);
    }

    override public function preRemove():void
    {
        super.preRemove();
    }

    override protected function setupNavigator(navigator:ScreenNavigator):void
    {
        super.setupNavigator(navigator);

        var mainItem:ScreenNavigatorItem = new ScreenNavigatorItem(ClipsScreen);
        var mixerItem:ScreenNavigatorItem = new ScreenNavigatorItem(MixerScreen);
        var transportItem:ScreenNavigatorItem = new ScreenNavigatorItem(DeviceScreen);
        var panelsItem:ScreenNavigatorItem = new ScreenNavigatorItem(PanelsScreen);
        navigator.addScreen("main", mainItem);
        navigator.addScreen("mixer", mixerItem);
        navigator.addScreen("transport", transportItem);
        navigator.addScreen("panels", panelsItem);
    }

    override protected function createDrawers():void
    {
        super.createDrawers();
    }

    override protected function startApplication():void
    {
        super.startApplication();

        view.navigator.showScreen("main", Slide.createSlideRightTransition());

        Starling.juggler.delayCall(function ():void
                                   {
                                       oscService.flush();
                                   }, 0.2);

    }

    private function context_mainScreenIndexChange(event:Event, index:int):void
    {
        switch (index)
        {
            case 0:
                view.navigator.showScreen("main", Slide.createSlideRightTransition());
                break;

            case 1:
                view.navigator.showScreen("transport", Slide.createSlideRightTransition());
                break;

            case 2:
                view.navigator.showScreen("mixer", Slide.createSlideRightTransition());
                break;

            case 3:
                view.navigator.showScreen("panels", Slide.createSlideRightTransition());
                break;
        }
    }

    override protected function view_closeHandler(event:Event):void
    {
        super.view_closeHandler(event);
    }
}
}
