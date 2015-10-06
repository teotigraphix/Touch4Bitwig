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

import feathers.data.ListCollection;

import starling.events.Event;

import touch4bitwig.model.event.BitwigDeviceEventType;
import touch4bitwig.ui.AbstractUIMediator;

public class DeviceBankPagerMediator extends AbstractUIMediator
{
    private var view:DeviceBankPager;

    public function DeviceBankPagerMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();

        addContextListener(BitwigDeviceEventType.MODE_CHANGE, context_modeChangeHandler);

        addContextListener(BitwigDeviceEventType.PARAM_PAGE_NAMES_CHANGE, context_pageNamesChangeHandler);
        addContextListener(BitwigDeviceEventType.SELECTED_PAGE_NAME_CHANGE, context_paramPageChangeHandler);

        addViewListener(DeviceBankPager.EVENT_DEVICE_BANK_PAGE, view_deviceBankPageHandler);
        addViewListener(DeviceBankPager.EVENT_DEVICE_BANK_SELECT, view_deviceBankSelectHandler);

        view.dataProvider = new ListCollection(oscModel.device.pageNames);
        view.selectedIndex = getParamPageIndex(oscModel.device.selectedPageName);
    }

    override public function setViewComponent(viewComponent:Object):void
    {
        super.setViewComponent(viewComponent);
        view = DeviceBankPager(viewComponent);
    }

    override public function preRemove():void
    {
        super.preRemove();
    }

    private function context_modeChangeHandler(event:Event, mode:String):void
    {
        view.isEnabled = mode == "param";
    }

    private function context_pageNamesChangeHandler(event:Event, data:Object):void
    {
        view.dataProvider = new ListCollection(data.value);
    }

    private function context_paramPageChangeHandler(event:Event, data:Object):void
    {
        view.selectedIndex = getParamPageIndex(data.value);
    }

    private function getParamPageIndex(name:String):int
    {
        var list:Array = oscModel.device.pageNames;
        if (list == null)
            return -1;

        for (var i:int = 0; i < list.length; i++)
        {
            var item:String = list[i];
            if (item == name)
                return i;
        }
        return -1;
    }

    private function view_deviceBankPageHandler(event:Event, page:String):void
    {
        oscService.send("/device/param/" + page); // +/-
    }

    private function view_deviceBankSelectHandler(event:Event, index:int):void
    {
        oscService.send("/device/paramPage/" + index);
    }
}
}
