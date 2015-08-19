/**
 * Created by Teoti on 4/15/2015.
 */
package touch4bitwig.ui.mediator.transport
{

import com.teotigraphix.bitwig.model.TransportModel;
import com.teotigraphix.bitwig.service.IOSCService;
import com.teotigraphix.bitwig.ui.component.transport.TransportPopUp;
import com.teotigraphix.bitwig.ui.mediator.BitwigTouchMediator;

import starling.events.Event;

public class TransportPopUpMediator extends BitwigTouchMediator
{
    [Inject]
    public var oscService:IOSCService;

    [Inject]
    public var transportModel:TransportModel;

    private var view:TransportPopUp;

    public function TransportPopUpMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();

        addViewListener(TransportPopUp.EVENT_AUTOMATION_WRITE_MODE_CHANGE, view_automationWriteModeChangeHandler);

        view.autowriteIndex = transportModel.transport.automationWriteModeIndex;
    }

    override public function preRemove():void
    {
        super.preRemove();
    }

    override public function setViewComponent(viewComponent:Object):void
    {
        super.setViewComponent(viewComponent);
        view = TransportPopUp(viewComponent);
    }

    private function view_automationWriteModeChangeHandler(event:Event, index:int):void
    {
        if (index == -1)
            return;
        oscService.send("/automationWriteMode/" + transportModel.getAutomationWriteModeValue(index));
    }
}
}
