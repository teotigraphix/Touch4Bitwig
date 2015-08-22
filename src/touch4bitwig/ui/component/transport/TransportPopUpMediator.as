/**
 * Created by Teoti on 4/15/2015.
 */
package touch4bitwig.ui.component.transport
{

import starling.events.Event;

import touch4bitwig.ui.AbstractUIMediator;

public class TransportPopUpMediator extends AbstractUIMediator
{
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
