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

package touch4bitwig.model.state
{

import touch4bitwig.model.event.BitwigTrackEventType;
import touch4bitwig.service.IOSCService;

public class BitwigTrack extends AbstractBitwigState
{
    private var _index:int;

    private var _canHoldNotes:Boolean;
    private var _exists:Boolean;
    private var _isActivate:Boolean;
    private var _isSelected:Boolean;
    private var _name:String;
    private var _volumeString:String;
    private var _volume:int;
    private var _panString:String;
    private var _pan:int;
    private var _color:int;
    private var _isMute:Boolean;
    private var _isSolo:Boolean;
    private var _isRecArm:Boolean;
    private var _isMonitor:Boolean;
    private var _isAutoMonitor:Boolean;
    private var _vu:int;

    private var _clips:Vector.<BitwigClip> = new Vector.<BitwigClip>(8, true);

    public function get index():int
    {
        return _index;
    }

    public function set index(value:int):void
    {
        _index = value;
    }

    public function get canHoldNotes():Boolean
    {
        return _canHoldNotes;
    }

    public function set canHoldNotes(value:Boolean):void
    {
        _canHoldNotes = value;
        dispatch(BitwigTrackEventType.CAN_HOLD_NOTES_CHANGE, {index: _index, value: _canHoldNotes});
    }

    public function get exists():Boolean
    {
        return _exists;
    }

    public function set exists(value:Boolean):void
    {
        //if (_exists == value)
        //    return;
        _exists = value;
        dispatch(BitwigTrackEventType.EXISTS_CHANGE, {index: _index, value: _exists});
    }

    public function get isActivate():Boolean
    {
        return _isActivate;
    }

    public function set isActivate(value:Boolean):void
    {
        _isActivate = value;
    }

    public function get isSelected():Boolean
    {
        return _isSelected;
    }

    public function set isSelected(value:Boolean):void
    {
        _isSelected = value;
        dispatch(BitwigTrackEventType.SELECTED_CHANGE, {index: _index, value: _isSelected, track:this});
    }

    public function get name():String
    {
        return _name;
    }

    public function set name(value:String):void
    {
        _name = value;
        dispatch(BitwigTrackEventType.NAME_CHANGE, {index: _index, value: _name});
    }

    public function get volumeString():String
    {
        return _volumeString;
    }

    public function set volumeString(value:String):void
    {
        _volumeString = value;
        dispatch(BitwigTrackEventType.VOLUME_STRING_CHANGE, {index: _index, value: _volumeString});
    }

    public function get volume():int
    {
        return _volume;
    }

    public function set volume(value:int):void
    {
        _volume = value;
        dispatch(BitwigTrackEventType.VOLUME_CHANGE, {index: _index, value: _volume});
    }

    public function get panString():String
    {
        return _panString;
    }

    public function set panString(value:String):void
    {
        _panString = value;
        dispatch(BitwigTrackEventType.PAN_STRING_CHANGE, {index: _index, value: _panString});
    }

    public function get pan():int
    {
        return _pan;
    }

    public function set pan(value:int):void
    {
        _pan = value;
        dispatch(BitwigTrackEventType.PAN_CHANGE, {index: _index, value: _pan});
    }

    public function get color():int
    {
        return _color;
    }

    public function set color(value:int):void
    {
        _color = value;
        dispatch(BitwigTrackEventType.COLOR_CHANGE, {index: _index, value: _color});
    }

    public function get isMute():Boolean
    {
        return _isMute;
    }

    public function set isMute(value:Boolean):void
    {
        _isMute = value;
        dispatch(BitwigTrackEventType.MUTE_CHANGE, {index: _index, value: _isMute});
    }

    public function get isSolo():Boolean
    {
        return _isSolo;
    }

    public function set isSolo(value:Boolean):void
    {
        _isSolo = value;
        dispatch(BitwigTrackEventType.SOLO_CHANGE, {index: _index, value: _isSolo});
    }

    public function get isRecArm():Boolean
    {
        return _isRecArm;
    }

    public function set isRecArm(value:Boolean):void
    {
        _isRecArm = value;
        dispatch(BitwigTrackEventType.RECORD_CHANGE, {index: _index, value: _isRecArm});
    }

    public function get isMonitor():Boolean
    {
        return _isMonitor;
    }

    public function set isMonitor(value:Boolean):void
    {
        _isMonitor = value;
    }

    public function get isAutoMonitor():Boolean
    {
        return _isAutoMonitor;
    }

    public function set isAutoMonitor(value:Boolean):void
    {
        _isAutoMonitor = value;
    }

    public function get clips():Vector.<BitwigClip>
    {
        return _clips;
    }

    public function set clips(value:Vector.<BitwigClip>):void
    {
        _clips = value;
    }

    public function get vu():int
    {
        return _vu;
    }

    public function set vu(value:int):void
    {
        _vu = value;
        dispatch(BitwigTrackEventType.VU_CHANGE, {index: index, value: _vu});
    }

    public function BitwigTrack(index:int, service:IOSCService)
    {
        super(service);
        _index = index;
        for (var i:int = 0; i < _clips.length; i++)
        {
            _clips[i] = new BitwigClip(i + 1, this, service);
        }
    }
}
}
