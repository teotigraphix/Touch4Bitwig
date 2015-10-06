////////////////////////////////////////////////////////////////////////////////
// Copyright 2015 Michael Schmalle - Teoti Graphix, LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License
//
// Author: Michael Schmalle, Principal Architect
// mschmalle at teotigraphix dot com
////////////////////////////////////////////////////////////////////////////////

package touch4bitwig.ui.component.device
{

import starling.events.Event;

import touch4bitwig.model.event.BitwigDeviceEventType;
import touch4bitwig.ui.AbstractUIMediator;

public class DeviceSelectBarMediator extends AbstractUIMediator
{
    private var view:DeviceSelectBar;

    public function DeviceSelectBarMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();

        addContextListener(BitwigDeviceEventType.NAME_CHANGE, context_nameChangeHandler);

        addContextListener(BitwigDeviceEventType.BYPASS_CHANGE, context_bypassChange);
        addContextListener(BitwigDeviceEventType.EXPAND_CHANGE, context_expandChange);
        addContextListener(BitwigDeviceEventType.WINDOW_CHANGE, context_windowChange);
        addContextListener(BitwigDeviceEventType.MACRO_PAGE_CHANGE, context_macroPageChange);
        addContextListener(BitwigDeviceEventType.PARAM_PAGE_CHANGE, context_paramPageChange);

        addViewListener(DeviceSelectBar.EVENT_BYPASS_CHANGE, view_bypassChange);
        addViewListener(DeviceSelectBar.EVENT_EXPAND_CHANGE, view_expandChange);
        addViewListener(DeviceSelectBar.EVENT_WINDOW_CHANGE, view_windowChange);
        addViewListener(DeviceSelectBar.EVENT_MACRO_PAGE_CHANGE, view_macroPageChange);
        addViewListener(DeviceSelectBar.EVENT_BROWSER_CHANGE, view_browserChange);

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

    private function view_browserChange(event:Event, selected:Boolean):void
    {
        oscModel.device.toggleBrowser();
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
