/**
 * Created by Teoti on 4/17/2015.
 */
package touch4bitwig.ui.component.device
{

import starling.events.Event;

import touch4bitwig.event.DeviceModelEventType;
import touch4bitwig.ui.AbstractUIMediator;

public class DeviceNavigationControlMediator extends AbstractUIMediator
{
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

        view.isEnabled = oscModel.device.exists;
        view.canSelectPrevious = oscModel.cursorDevice.canSelectPrevious;
        view.canSelectNext = oscModel.cursorDevice.canSelectNext;
        view.deviceName = oscModel.cursorDevice.name;
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
        oscModel.device.previous();
    }

    private function view_rightTriggered(event:Event):void
    {
        oscModel.device.next();
    }
}
}
