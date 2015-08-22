/**
 * Created by Teoti on 4/15/2015.
 */
package touch4bitwig.ui.mediator.transport
{

import starling.events.Event;

import touch4bitwig.service.IOSCService;
import touch4bitwig.ui.component.transport.TransportPopUp;
import touch4bitwig.ui.mediator.AbstractUIMediator;

public class TransportPopUpMediator extends AbstractUIMediator
{
    [Inject]
    public var oscService:IOSCService;

    [Inject]
    public var view:TransportPopUp;

    public function TransportPopUpMediator()
    {
    }

    override public function onRegister():void
    {
        super.onRegister();

        addViewListener(TransportPopUp.EVENT_AUTOMATION_WRITE_MODE_CHANGE, view_automationWriteModeChangeHandler);

        view.autowriteIndex = oscModel.transport.automationWriteModeIndex;
    }

    private function view_automationWriteModeChangeHandler(event:Event, index:int):void
    {
        if (index == -1)
            return;
        oscService.send("/automationWriteMode/" + oscModel.getAutomationWriteModeValue(index));
    }
}
}
