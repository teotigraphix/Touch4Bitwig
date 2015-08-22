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

import feathers.controls.Button;
import feathers.controls.LayoutGroup;
import feathers.controls.PickerList;
import feathers.data.ListCollection;
import feathers.layout.HorizontalLayout;
import feathers.layout.HorizontalLayoutData;

import starling.events.Event;

public class DeviceBankPager extends LayoutGroup
{
    public static const EVENT_DEVICE_BANK_PAGE:String = "deviceBankPage";
    public static const EVENT_DEVICE_BANK_SELECT:String = "deviceBankSelect";

    private static const INVALIDATE_FLAG_DATA_PROVIDER:String = "dataProvider";
    private static const INVALIDATE_FLAG_SELECTED_INDEX:String = "selectedIndex";

    private var _previousButton:Button;
    private var _nextButton:Button;
    private var _pickerList:PickerList;

    private var _dataProvider:ListCollection;
    private var _selectedIndex:int;

    public function get dataProvider():ListCollection
    {
        return _dataProvider;
    }

    public function set dataProvider(value:ListCollection):void
    {
        _dataProvider = value;
        invalidate(INVALIDATE_FLAG_DATA_PROVIDER);
    }

    public function get selectedIndex():int
    {
        return _selectedIndex;
    }

    public function set selectedIndex(value:int):void
    {
        if (_selectedIndex == value)
            return;
        _selectedIndex = value;
        invalidate(INVALIDATE_FLAG_SELECTED_INDEX);
    }

    public function DeviceBankPager()
    {
    }

    override protected function initialize():void
    {
        var l:HorizontalLayout = new HorizontalLayout();
        layout = l;
        super.initialize();

        _previousButton = new Button();
        _nextButton = new Button();
        _pickerList = new PickerList();

        _previousButton.layoutData = new HorizontalLayoutData(100);
        _nextButton.layoutData = new HorizontalLayoutData(100);
        _pickerList.layoutData = new HorizontalLayoutData(100);

        _previousButton.label = "<";
        _nextButton.label = ">";

        _nextButton.addEventListener(Event.TRIGGERED, next_triggeredHandler);
        _previousButton.addEventListener(Event.TRIGGERED, previous_triggeredHandler);
        _pickerList.addEventListener(Event.CHANGE, picker_changeHandler);

        addChild(_previousButton);
        addChild(_nextButton);
        addChild(_pickerList);
    }

    override protected function draw():void
    {
        super.draw();

        _previousButton.isEnabled = _isEnabled;
        _nextButton.isEnabled = _isEnabled;
        _pickerList.isEnabled = _isEnabled;

        if (isInvalid(INVALIDATE_FLAG_DATA_PROVIDER))
        {
            _pickerList.dataProvider = _dataProvider;
        }

        if (isInvalid(INVALIDATE_FLAG_SELECTED_INDEX))
        {
            _pickerList.selectedIndex = _selectedIndex;
        }
    }

    private function previous_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_DEVICE_BANK_PAGE, false, "-");
    }

    private function next_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_DEVICE_BANK_PAGE, false, "+");
    }

    private function picker_changeHandler(event:Event):void
    {
        dispatchEventWith(EVENT_DEVICE_BANK_SELECT, false, _pickerList.selectedIndex);
    }
}
}
