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

package touch4bitwig.ui.component.main
{

import com.teotigraphix.ui.component.UIBorder;
import com.teotigraphix.ui.theme.AssetMap;

import feathers.controls.Label;
import feathers.controls.LayoutGroup;
import feathers.layout.VerticalLayout;
import feathers.layout.VerticalLayoutData;

import starling.display.DisplayObject;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class TrackNameHeaderItem extends LayoutGroup
{
    public static const EVENT_HEADER_TAP:String = "headerTap";

    private static const INVALIDATE_FLAG_SELECTED:String = "selected";
    private static const INVALIDATE_FLAG_TRACK_NAME:String = "trackName";
    private static const INVALIDATE_FLAG_TRACK_COLOR:String = "trackColor";

    public var backgroundNormalSkin:DisplayObject;
    public var backgroundSelectedSkin:DisplayObject;

    private var _trackNameLabel:Label;
    private var _trackColorBorder:UIBorder;

    private var _index:int = -1;

    private var _selected:Boolean;
    private var _trackName:String = " ";
    private var _trackColor:Number;

    public function get index():int
    {
        return _index;
    }

    public function set index(value:int):void
    {
        _index = value;
    }

    public function get selected():Boolean
    {
        return _selected;
    }

    public function set selected(value:Boolean):void
    {
        if (_selected == value)
            return;
        _selected = value;
        invalidate(INVALIDATE_FLAG_SELECTED);
    }

    public function get trackName():String
    {
        return _trackName;
    }

    public function set trackName(value:String):void
    {
        if (_trackName == value)
            return;
        _trackName = value;
        invalidate(INVALIDATE_FLAG_TRACK_NAME);
    }

    public function get trackColor():Number
    {
        return _trackColor;
    }

    public function set trackColor(value:Number):void
    {
        if (_trackColor == value)
            return;
        _trackColor = value;
        invalidate(INVALIDATE_FLAG_TRACK_COLOR);
    }

    public function TrackNameHeaderItem()
    {
    }

    override protected function initialize():void
    {
        backgroundNormalSkin = AssetMap.create9ScaleImage("mixer-item-background-skin", 5, 5, 22, 22);
        backgroundSelectedSkin = AssetMap.create9ScaleImage("mixer-item-background-selected-skin", 5, 5, 22, 22);

        addEventListener(TouchEvent.TOUCH, touchHandler);

        var vl:VerticalLayout = new VerticalLayout();
        vl.gap = 8;
        vl.padding=2;
        layout = vl;

        super.initialize();

        _trackColorBorder = new UIBorder();
        _trackColorBorder.minHeight = AssetMap.getSize(20);
        _trackColorBorder.layoutData = new VerticalLayoutData(100);
        _trackColorBorder.color = _trackColor;
        addChild(_trackColorBorder);

        _trackNameLabel = new Label();
        _trackNameLabel.styleNameList.add("track-header-label");
        _trackNameLabel.layoutData = new VerticalLayoutData(100);
        addChild(_trackNameLabel);
    }

    private function touchHandler(event:TouchEvent):void
    {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch != null && touch.tapCount == 1)
        {
            dispatchEventWith(EVENT_HEADER_TAP, true, _index);
        }
    }

    override protected function draw():void
    {
        super.draw();

        if (isInvalid(INVALIDATE_FLAG_SELECTED))
        {
            if (_selected)
            {
                backgroundSkin = backgroundSelectedSkin;
            }
            else
            {
                backgroundSkin = backgroundNormalSkin;
            }
        }

        if (isInvalid(INVALIDATE_FLAG_TRACK_NAME))
        {
            _trackNameLabel.text = _trackName;
        }

        if (isInvalid(INVALIDATE_FLAG_TRACK_COLOR))
        {
            _trackColorBorder.color = _trackColor;
        }
    }
}
}
