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

package touch4bitwig.ui.component.mixer
{

import feathers.controls.LayoutGroup;
import feathers.skins.IStyleProvider;

import starling.display.DisplayObject;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class MixerItem extends LayoutGroup implements IMixerItem
{
    public static const EVENT_SELECT:String = "select";

    public static const EVENT_DOUBLE_TAP:String = "doubleTap";
    public static const EVENT_VOLUME_CHANGE:String = "volumeChange";
    public static const EVENT_PAN_CHANGE:String = "panChange";
    public static const EVENT_RECORD_CHANGE:String = "recordChange";
    public static const EVENT_SOLO_CHANGE:String = "soloChange";
    public static const EVENT_MUTE_CHANGE:String = "muteChange";

    private static const INVALIDATE_FLAG_EXISTS:String = "exists";
    private static const INVALIDATE_FLAG_CAN_HOLD_NOTES:String = "canHoldNotes";
    private static const INVALIDATE_FLAG_SELECTED:String = "selected";
    private static const INVALIDATE_FLAG_TRACK_NAME:String = "trackName";
    private static const INVALIDATE_FLAG_TRACK_COLOR:String = "trackColor";
    private static const INVALIDATE_FLAG_PAN:String = "pan";
    private static const INVALIDATE_FLAG_VOLUME:String = "volume";
    private static const INVALIDATE_FLAG_RECORD:String = "record";
    private static const INVALIDATE_FLAG_SOLO:String = "solo";
    private static const INVALIDATE_FLAG_MUTE:String = "volume";
    private static const INVALIDATE_FLAG_VU:String = "vu";

    public static var globalStyleProvider:IStyleProvider;

    // Theme
    public var backgroundNormalSkin:DisplayObject;
    public var backgroundSelectedSkin:DisplayObject;

    private var _index:int = -1;

    private var _exists:Boolean;
    private var _canHoldNotes:Boolean;
    private var _selected:Boolean = undefined;
    private var _trackName:String = " ";
    private var _trackColor:uint;
    private var _volumeValue:Number;
    private var _volumeString:String = " ";
    private var _vuValue:Number;
    private var _panValue:Number;
    private var _panString:String = " ";
    private var _isRecArm:Boolean;
    private var _isSolo:Boolean;
    private var _isMute:Boolean;

    private var _skin:MixerItemSkin;

    override protected function get defaultStyleProvider():IStyleProvider
    {
        return MixerItem.globalStyleProvider;
    }

    public function get index():int
    {
        return _index;
    }

    public function set index(value:int):void
    {
        _index = value;
    }

    public function get exists():Boolean
    {
        return _exists;
    }

    public function set exists(value:Boolean):void
    {
        if (_exists == value)
            return;
        _exists = value;
        invalidate(INVALIDATE_FLAG_EXISTS);
    }

    public function get canHoldNotes():Boolean
    {
        return _canHoldNotes;
    }

    public function set canHoldNotes(value:Boolean):void
    {
        if (_canHoldNotes == value)
            return;
        _canHoldNotes = value;
        invalidate(INVALIDATE_FLAG_CAN_HOLD_NOTES);
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

    public function get trackColor():uint
    {
        return _trackColor;
    }

    public function set trackColor(value:uint):void
    {
        if (_trackColor == value)
            return;
        _trackColor = value;
        invalidate(INVALIDATE_FLAG_TRACK_COLOR);
    }

    public function get volume():Number
    {
        return _volumeValue;
    }

    public function set volume(value:Number):void
    {
        if (_volumeValue == value)
            return;
        _volumeValue = value;
        invalidate(INVALIDATE_FLAG_VOLUME);
    }

    public function get volumeString():String
    {
        return _volumeString;
    }

    public function set volumeString(value:String):void
    {
        if (_volumeString == value)
            return;
        _volumeString = value;
        invalidate(INVALIDATE_FLAG_VOLUME);
    }

    public function get vu():Number
    {
        return _vuValue;
    }

    public function set vu(value:Number):void
    {
        if (_vuValue == value)
            return;
        _vuValue = value;
        invalidate(INVALIDATE_FLAG_VU);
    }

    public function get pan():Number
    {
        return _panValue;
    }

    public function set pan(value:Number):void
    {
        if (_panValue == value)
            return;
        _panValue = value;
        invalidate(INVALIDATE_FLAG_PAN);
    }

    public function get panString():String
    {
        return _panString;
    }

    public function set panString(value:String):void
    {
        if (_panString == value)
            return;
        _panString = value;
        invalidate(INVALIDATE_FLAG_PAN);
    }

    public function get isRecArm():Boolean
    {
        return _isRecArm;
    }

    public function set isRecArm(value:Boolean):void
    {
        if (_isRecArm == value)
            return;
        _isRecArm = value;
        invalidate(INVALIDATE_FLAG_RECORD);
    }

    public function get isSolo():Boolean
    {
        return _isSolo;
    }

    public function set isSolo(value:Boolean):void
    {
        if (_isSolo == value)
            return;
        _isSolo = value;
        invalidate(INVALIDATE_FLAG_SOLO);
    }

    public function get isMute():Boolean
    {
        return _isMute;
    }

    public function set isMute(value:Boolean):void
    {
        if (_isMute == value)
            return;
        _isMute = value;
        invalidate(INVALIDATE_FLAG_MUTE);
    }

    public function MixerItem()
    {
        super();
    }

    override protected function initialize():void
    {
        addEventListener(TouchEvent.TOUCH, touchHandler);

        super.initialize();

        _skin = new MixerItemSkin();
        _skin.owner = this;
        addChild(_skin);

        _skin.addEventListener(EVENT_SELECT, view_selectHandler);

        _skin.addEventListener(EVENT_VOLUME_CHANGE, volumeSlider_changeHandler);
        _skin.addEventListener(EVENT_PAN_CHANGE, panSlider_changeHandler);

        _skin.addEventListener(EVENT_RECORD_CHANGE, recordButton_changeHandler);
        _skin.addEventListener(EVENT_SOLO_CHANGE, soloButton_changeHandler);
        _skin.addEventListener(EVENT_MUTE_CHANGE, muteButton_changeHandler);
    }

    override protected function draw():void
    {
        super.draw();

        _skin.move(0, 0);
        _skin.setSize(actualWidth, actualHeight);

        if (isInvalid(INVALIDATE_FLAG_SELECTED))
        {
            _skin.selected = _selected;
        }

        if (isInvalid(INVALIDATE_FLAG_EXISTS))
        {
            for (var i:int = 0; i < numChildren; i++)
                visible = _exists;
        }

        if (isInvalid(INVALIDATE_FLAG_CAN_HOLD_NOTES))
        {
            _skin.canHoldNotes = _canHoldNotes;
        }

        if (isInvalid(INVALIDATE_FLAG_TRACK_NAME))
        {
            _skin.trackName = _trackName;
        }

        if (isInvalid(INVALIDATE_FLAG_TRACK_COLOR))
        {
            _skin.trackColor = _trackColor;
        }

        if (isInvalid(INVALIDATE_FLAG_VU))
        {
            _skin.vu = _vuValue;
        }

        if (isInvalid(INVALIDATE_FLAG_VOLUME))
        {
            _skin.volume = _volumeValue;
            _skin.volumeString = _volumeString;
        }

        if (isInvalid(INVALIDATE_FLAG_PAN))
        {
            _skin.pan = _panValue;
            _skin.panString = _panString;
        }

        if (isInvalid(INVALIDATE_FLAG_RECORD))
        {
            _skin.isRecArm = _isRecArm;
        }

        if (isInvalid(INVALIDATE_FLAG_SOLO))
        {
            _skin.isSolo = _isSolo;
        }

        if (isInvalid(INVALIDATE_FLAG_MUTE))
        {
            _skin.isMute = _isMute;
        }
    }

    private function recordButton_changeHandler(event:Event, selected:Boolean):void
    {
        if (_isRecArm == selected)
            return;
        _isRecArm = selected;
        dispatchEventWith(EVENT_RECORD_CHANGE, true, _index);
    }

    private function soloButton_changeHandler(event:Event, selected:Boolean):void
    {
        if (_isSolo == selected)
            return;
        _isSolo = selected;
        dispatchEventWith(EVENT_SOLO_CHANGE, true, _index);
    }

    private function muteButton_changeHandler(event:Event, selected:Boolean):void
    {
        if (_isMute == selected)
            return;
        _isMute = selected;
        dispatchEventWith(EVENT_MUTE_CHANGE, true, _index);
    }

    private function volumeSlider_changeHandler(event:Event, volume:Number):void
    {
        _volumeValue = volume;
        dispatchEventWith(EVENT_VOLUME_CHANGE, true, _index);
    }

    private function panSlider_changeHandler(event:Event, pan:Number):void
    {
        _panValue = pan;
        dispatchEventWith(EVENT_PAN_CHANGE, true, _index);
    }

    private function view_selectHandler(event:Event):void
    {
        dispatchEventWith(EVENT_DOUBLE_TAP, true, _index);
    }

    private function touchHandler(event:TouchEvent):void
    {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch != null && touch.tapCount == 2)
        {
            dispatchEventWith(EVENT_DOUBLE_TAP, true, _index);
        }
    }
}
}
