/**
 * Created by Teoti on 4/6/2015.
 */
package touch4bitwig.ui.mediator.screen
{

import com.teotigraphix.bitwig.service.IOSCService;
import com.teotigraphix.bitwig.ui.component.screen.ClipScreenFooter;
import com.teotigraphix.bitwig.ui.component.screen.ClipsScreen;
import com.teotigraphix.bitwig.ui.mediator.BitwigTouchMediator;

import starling.events.Event;

public class ClipsScreenMediator extends BitwigTouchMediator
{
    [Inject]
    public var oscService:IOSCService;

    private var view:ClipsScreen;

    public function ClipsScreenMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();
    }

    override public function onRegister():void
    {
        super.onRegister();

        addViewListener(ClipScreenFooter.EVENT_DOWN_TAP, view_bankNavigationTapHandler);
        addViewListener(ClipScreenFooter.EVENT_LEFT_TAP, view_bankNavigationTapHandler);
        addViewListener(ClipScreenFooter.EVENT_RIGHT_TAP, view_bankNavigationTapHandler);
        addViewListener(ClipScreenFooter.EVENT_UP_TAP, view_bankNavigationTapHandler);
    }

    private function view_bankNavigationTapHandler(event:Event, direction:String):void
    {
        switch (direction)
        {
            case ClipScreenFooter.DIRECTION_UP:
                oscService.send("/scene/-");
                break;

            case ClipScreenFooter.DIRECTION_DOWN:
                oscService.send("/scene/+");
                break;

            case ClipScreenFooter.DIRECTION_LEFT:
                oscService.send("/track/-");
                break;

            case ClipScreenFooter.DIRECTION_RIGHT:
                oscService.send("/track/+");
                break;
        }
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    override public function setViewComponent(viewComponent:Object):void
    {
        super.setViewComponent(viewComponent);
        view = ClipsScreen(viewComponent);
    }

    override public function preRemove():void
    {
        super.preRemove();
        view = null;
    }
}
}
