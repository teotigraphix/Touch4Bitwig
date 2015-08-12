/**
 * Created by Teoti on 8/11/2015.
 */
package touch4bitwig.view.mediator
{

import starling.events.Event;

import touch4bitwig.service.IOSCService;
import touch4bitwig.view.screen.TestScreen;

public class TestScreenMediator extends AbstractMediator
{
    [Inject]
    public var screen:TestScreen;

    [Inject]
    public var oscService:IOSCService;

    public function TestScreenMediator()
    {
    }

    override public function onRegister():void
    {
        super.onRegister();

        addViewListener("changed", view_changeHandler);
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    private function view_changeHandler(event:Event, selected:Boolean):void
    {
        //transportModel.transport.isPlaying = selected;

        if (selected)
            oscService.send("/play");
        else
            oscService.sendInt("/stop", 1);
    }
}
}
