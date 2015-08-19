/**
 * Created by Teoti on 4/15/2015.
 */
package touch4bitwig.ui.mediator.device
{

import com.teotigraphix.bitwig.event.DeviceModelEventType;
import com.teotigraphix.bitwig.model.DeviceModel;
import com.teotigraphix.bitwig.service.IOSCService;
import com.teotigraphix.bitwig.ui.component.device.DeviceSelectBar;
import com.teotigraphix.bitwig.ui.mediator.BitwigTouchMediator;

import starling.events.Event;

public class DeviceSelectBarMediator extends BitwigTouchMediator
{
    [Inject]
    public var oscService:IOSCService;

    [Inject]
    public var deviceModel:DeviceModel;

    private var view:DeviceSelectBar;

    public function DeviceSelectBarMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();

        addContextListener(DeviceModelEventType.NAME_CHANGE, context_nameChangeHandler);

        addContextListener(DeviceModelEventType.BYPASS_CHANGE, context_bypassChange);
        addContextListener(DeviceModelEventType.EXPAND_CHANGE, context_expandChange);
        addContextListener(DeviceModelEventType.WINDOW_CHANGE, context_windowChange);
        addContextListener(DeviceModelEventType.MACRO_PAGE_CHANGE, context_macroPageChange);
        addContextListener(DeviceModelEventType.PARAM_PAGE_CHANGE, context_paramPageChange);

        addViewListener(DeviceSelectBar.EVENT_BYPASS_CHANGE, view_bypassChange);
        addViewListener(DeviceSelectBar.EVENT_EXPAND_CHANGE, view_expandChange);
        addViewListener(DeviceSelectBar.EVENT_WINDOW_CHANGE, view_windowChange);
        addViewListener(DeviceSelectBar.EVENT_MACRO_PAGE_CHANGE, view_macroPageChange);
        addViewListener(DeviceSelectBar.EVENT_PARAM_PAGE_CHANGE, view_paramPageChange);

        view.isEnabled = deviceModel.cursorDevice.exists;
        view.isBypass = deviceModel.cursorDevice.bypass;
        view.isWindowVisible = deviceModel.cursorDevice.windowVisible;
        view.isMacroPageVisible = deviceModel.cursorDevice.macroPageVisible;
        view.isParamPageVisible = deviceModel.cursorDevice.paramPageVisible;
        view.isExpanded = deviceModel.cursorDevice.expanded;
    }

    override public function setViewComponent(viewComponent:Object):void
    {
        super.setViewComponent(viewComponent);
        view = DeviceSelectBar(viewComponent);
    }

    override public function preRemove():void
    {
        super.preRemove();
    }

    private function context_nameChangeHandler(event:Event, data:Object):void
    {
        view.isEnabled = deviceModel.device.exists;
    }

    private function view_bypassChange(event:Event, selected:Boolean):void
    {
        deviceModel.device.toggleBypass();
    }

    private function view_expandChange(event:Event, selected:Boolean):void
    {
        deviceModel.device.toggleExpand();
    }

    private function view_windowChange(event:Event, selected:Boolean):void
    {
        deviceModel.device.toggleWindow();
    }

    private function view_macroPageChange(event:Event, selected:Boolean):void
    {
        deviceModel.device.toggleMacroVisible();
    }

    private function view_paramPageChange(event:Event, selected:Boolean):void
    {
        deviceModel.device.toggleParamVisible();
    }

    private function context_bypassChange(event:Event, data:Object):void
    {
        view.isBypass = data.value;
    }

    private function context_expandChange(event:Event, data:Object):void
    {
        view.isExpanded = data.value;
    }

    private function context_windowChange(event:Event, data:Object):void
    {
        view.isWindowVisible = data.value;
    }

    private function context_macroPageChange(event:Event, data:Object):void
    {
        view.isMacroPageVisible = data.value;
    }

    private function context_paramPageChange(event:Event, data:Object):void
    {
        view.isParamPageVisible = data.value;
    }

}
}
