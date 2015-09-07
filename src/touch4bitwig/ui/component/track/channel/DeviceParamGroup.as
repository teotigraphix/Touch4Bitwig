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

package touch4bitwig.ui.component.track.channel
{

import com.teotigraphix.ui.component.UIKnob;
import com.teotigraphix.ui.theme.AssetMap;

import feathers.controls.Label;
import feathers.controls.LayoutGroup;
import feathers.layout.VerticalLayout;
import feathers.layout.VerticalLayoutData;

import starling.events.Event;

public class DeviceParamGroup extends LayoutGroup
{
    public static const EVENT_DEVICE_VALUE_CHANGE:String = "deviceValueChange";
    public static const EVENT_DEVICE_VALUE_RESET:String = "deviceValueReset";

    public static const EVENT_INTERACTION_CHANGE:String = "interactionChange";

    private var _nameLabel:Label;
    private var _valueLabel:Label;
    private var _valueKnob:DeviceKnob;

    private var _index:int = -1;
    private var _paramName:String;
    private var _paramValue:int = -1;
    private var _paramValueString:String;
    private var _mode:String = "up";

    public function get index():int
    {
        return _index;
    }

    public function set index(value:int):void
    {
        _index = value;
    }

    public function get paramName():String
    {
        return _paramName;
    }

    public function set paramName(value:String):void
    {
        _paramName = value;
        if (_paramName == "")
            _paramName = "--------";
        invalidate();
    }

    public function get paramValue():int
    {
        return _paramValue;
    }

    public function set paramValue(value:int):void
    {
        _paramValue = value;
        invalidate(EVENT_DEVICE_VALUE_CHANGE);
    }

    public function get paramValueString():String
    {
        return _paramValueString;
    }

    public function set paramValueString(value:String):void
    {
        _paramValueString = value;
        if (_paramValueString == "")
            _paramValueString = "--------";
        invalidate();
    }

    public function DeviceParamGroup()
    {
    }

    override protected function initialize():void
    {
        var l:VerticalLayout = new VerticalLayout();
        l.padding = AssetMap.getSize(4);
        l.gap = AssetMap.getSize(4);
        l.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_CENTER;
        layout = l;
        super.initialize();

        _nameLabel = new Label();
        _nameLabel.text = "Foo";
        _nameLabel.layoutData = new VerticalLayoutData(100);

        _valueLabel = new Label();
        _valueLabel.text = "Bar";
        _valueLabel.layoutData = new VerticalLayoutData(100);

        _valueKnob = new DeviceKnob();
        _valueKnob.index = _index;
        _valueKnob.styleNameList.add("track-channel-device-knob");
        _valueKnob.stepSize = 1;
        _valueKnob.minValue = 0;
        _valueKnob.maxValue = 127;
        _valueKnob.layoutData = new VerticalLayoutData(100);
        _valueKnob.addEventListener(Event.CHANGE, valueKnob_changeHandler);
        _valueKnob.addEventListener(UIKnob.EVENT_DOUBLE_TAP, valueKnob_doubleTapHandler);
        _valueKnob.addEventListener(UIKnob.EVENT_TOUCH_DOWN_CHANGE, valueKnob_touchDownChangeHandler);

        addChild(_nameLabel);
        addChild(_valueLabel);
        addChild(_valueKnob);
    }

    override protected function draw():void
    {
        super.draw();

        //_nameLabel.isEnabled = _isEnabled;
        //_valueLabel.isEnabled = _isEnabled;
        _valueKnob.isEnabled = _paramName != "--------";

        _nameLabel.text = _paramName;
        _valueLabel.text = _paramValueString;
        if (isInvalid(EVENT_DEVICE_VALUE_CHANGE) && _paramValue != -1)
        {
            _valueKnob.setValue(_paramValue, true);
            trace("set value " + _paramValue)
        }

    }

    private function valueKnob_touchDownChangeHandler(event:Event, isDown:Boolean):void
    {
        _mode = isDown ? "down" : "up";
        //var mode:String = isDown ? "down" : "up";
        dispatchEventWith(EVENT_INTERACTION_CHANGE, true, {index: _index, mode: _mode});
    }

    private function valueKnob_doubleTapHandler(event:Event):void
    {
        dispatchEventWith(EVENT_DEVICE_VALUE_RESET, true, _index);
    }

    private function valueKnob_changeHandler(event:Event):void
    {
        _paramValue = _valueKnob.value;
        dispatchEventWith(EVENT_DEVICE_VALUE_CHANGE, true, _index);
    }
}
}
