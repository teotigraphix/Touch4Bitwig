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

public class MixerItemSkinBase extends LayoutGroup implements IMixerItem
{
    public var owner:MixerItem;

    private var _selected:Boolean;
    private var _trackName:String;
    private var _trackColor:uint;
    private var _panString:String;
    private var _panValue:Number;
    private var _volumeValue:Number;
    private var _volumeString:String;
    private var _vuValue:Number;
    private var _isRecArm:Boolean;
    private var _isSolo:Boolean;
    private var _isMute:Boolean;
    private var _canHoldNotes:Boolean;

    override protected function initialize():void
    {
        super.initialize();
    }

    override protected function draw():void
    {
        super.draw();

        if (isInvalid(INVALIDATION_FLAG_ALL))
        {
            backgroundSkin = owner.backgroundNormalSkin;
        }
    }

    [Bindable]
    public function get selected():Boolean
    {
        return _selected;
    }

    public function set selected(value:Boolean):void
    {
        _selected = value;

        if (_selected)
        {
            backgroundSkin = owner.backgroundSelectedSkin;
        }
        else
        {
            backgroundSkin = owner.backgroundNormalSkin;
        }
    }

    [Bindable]
    public function get canHoldNotes():Boolean
    {
        return _canHoldNotes;
    }

    public function set canHoldNotes(value:Boolean):void
    {
        _canHoldNotes = value;
    }

    [Bindable]
    public function get trackColor():uint
    {
        return _trackColor;
    }

    public function set trackColor(value:uint):void
    {
        _trackColor = value;
    }

    [Bindable]
    public function get trackName():String
    {
        return _trackName;
    }

    public function set trackName(value:String):void
    {
        _trackName = value;
    }

    [Bindable]
    public function get panString():String
    {
        return _panString;
    }

    public function set panString(value:String):void
    {
        _panString = value;
    }

    //[Bindable]
    public function get panValue():Number
    {
        return _panValue;
    }

    public function set panValue(value:Number):void
    {
        _panValue = value;
    }

    //[Bindable]
    public function get volumeValue():Number
    {
        return _volumeValue;
    }

    public function set volumeValue(value:Number):void
    {
        _volumeValue = value;
    }

    [Bindable]
    public function get volumeString():String
    {
        return _volumeString;
    }

    public function set volumeString(value:String):void
    {
        _volumeString = value;
    }

    [Bindable]
    public function get vuValue():Number
    {
        return _vuValue;
    }

    public function set vuValue(value:Number):void
    {
        _vuValue = value;
    }

    [Bindable]
    public function get isRecArm():Boolean
    {
        return _isRecArm;
    }

    public function set isRecArm(value:Boolean):void
    {
        _isRecArm = value;
    }

    [Bindable]
    public function get isSolo():Boolean
    {
        return _isSolo;
    }

    public function set isSolo(value:Boolean):void
    {
        _isSolo = value;
    }

    [Bindable]
    public function get isMute():Boolean
    {
        return _isMute;
    }

    public function set isMute(value:Boolean):void
    {
        _isMute = value;
    }

    public function MixerItemSkinBase()
    {
    }

    //------------------------------
    // Handlers
    //------------------------------

    protected function pan_changeHandler(value:Number):void
    {
        dispatchEventWith(MixerItem.EVENT_PAN_CHANGE, false, value);
    }

    protected function volume_changeHandler(value:Number):void
    {
        dispatchEventWith(MixerItem.EVENT_VOLUME_CHANGE, false, value);
    }

    protected function recarm_changeHandler(selected:Boolean):void
    {
        dispatchEventWith(MixerItem.EVENT_RECORD_CHANGE, false, selected);
    }

    protected function solo_changeHandler(selected:Boolean):void
    {
        dispatchEventWith(MixerItem.EVENT_SOLO_CHANGE, false, selected);
    }

    protected function mute_changeHandler(selected:Boolean):void
    {
        dispatchEventWith(MixerItem.EVENT_MUTE_CHANGE, false, selected);
    }

}
}
