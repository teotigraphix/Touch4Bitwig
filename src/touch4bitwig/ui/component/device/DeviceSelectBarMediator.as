/**
 * Created by Teoti on 4/15/2015.
 */
package touch4bitwig.ui.component.device
{

import starling.events.Event;

import touch4bitwig.event.DeviceModelEventType;
import touch4bitwig.service.IOSCService;
import touch4bitwig.ui.AbstractUIMediator;

public class DeviceSelectBarMediator extends AbstractUIMediator
{
    [Inject]
    public var oscService:IOSCService;

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

        view.isEnabled = oscModel.cursorDevice.exists;
        view.isBypass = oscModel.cursorDevice.bypass;
        view.isWindowVisible = oscModel.cursorDevice.windowVisible;
        view.isMacroPageVisible = oscModel.cursorDevice.macroPageVisible;
        view.isParamPageVisible = oscModel.cursorDevice.paramPageVisible;
        view.isExpanded = oscModel.cursorDevice.expanded;
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
        view.isEnabled = oscModel.device.exists;
    }

    private function view_bypassChange(event:Event, selected:Boolean):void
    {
        oscModel.device.toggleBypass();
    }

    private function view_expandChange(event:Event, selected:Boolean):void
    {
        oscModel.device.toggleExpand();
    }

    private function view_windowChange(event:Event, selected:Boolean):void
    {
        oscModel.device.toggleWindow();
    }

    private function view_macroPageChange(event:Event, selected:Boolean):void
    {
        oscModel.device.toggleMacroVisible();
    }

    private function view_paramPageChange(event:Event, selected:Boolean):void
    {
        oscModel.device.toggleParamVisible();
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
