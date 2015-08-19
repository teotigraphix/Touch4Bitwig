/**
 * Created by Teoti on 4/17/2015.
 */
package touch4bitwig.ui.mediator.device
{

import com.teotigraphix.bitwig.event.DeviceModelEventType;
import com.teotigraphix.bitwig.model.DeviceModel;
import com.teotigraphix.bitwig.ui.component.device.DeviceNavigationControl;
import com.teotigraphix.bitwig.ui.mediator.BitwigTouchMediator;

import starling.events.Event;

public class DeviceNavigationControlMediator extends BitwigTouchMediator
{
    [Inject]
    public var deviceModel:DeviceModel;

    private var view:DeviceNavigationControl;

    public function DeviceNavigationControlMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();

        addContextListener(DeviceModelEventType.CAN_SELECT_PREVIOUS, context_canSelectPreviousChange);
        addContextListener(DeviceModelEventType.CAN_SELECT_NEXT, context_canSelectNextChange);
        addContextListener(DeviceModelEventType.NAME_CHANGE, context_nameChange);

        addViewListener(DeviceNavigationControl.EVENT_LEFT_TRIGGERED, view_leftTriggered);
        addViewListener(DeviceNavigationControl.EVENT_RIGHT_TRIGGERED, view_rightTriggered);

        view.isEnabled = deviceModel.device.exists;
        view.canSelectPrevious = deviceModel.cursorDevice.canSelectPrevious;
        view.canSelectNext = deviceModel.cursorDevice.canSelectNext;
        view.deviceName = deviceModel.cursorDevice.name;
    }

    override public function setViewComponent(viewComponent:Object):void
    {
        super.setViewComponent(viewComponent);
        view = DeviceNavigationControl(viewComponent);
    }

    override public function preRemove():void
    {
        super.preRemove();
    }

    private function context_nameChange(event:Event, data:Object):void
    {
        view.deviceName = data.value;
    }

    private function context_canSelectPreviousChange(event:Event, data:Object):void
    {
        view.canSelectPrevious = data.value;
    }

    private function context_canSelectNextChange(event:Event, data:Object):void
    {
        view.canSelectNext = data.value;
    }

    private function view_leftTriggered(event:Event):void
    {
        deviceModel.device.previous();
    }

    private function view_rightTriggered(event:Event):void
    {
        deviceModel.device.next();
    }
}
}
