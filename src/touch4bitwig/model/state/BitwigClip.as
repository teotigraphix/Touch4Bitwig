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

import touch4bitwig.model.IBitwigClip;
import touch4bitwig.model.event.BitwigTrackEventType;
import touch4bitwig.service.IOSCService;

public class BitwigClip extends AbstractBitwigState implements IBitwigClip
{
    //--------------------------------------------------------------------------
    // Private :: Variables
    //--------------------------------------------------------------------------

    private var _index:int;
    private var _track:BitwigTrack;

    private var _name:String;
    private var _isSelected:Boolean;
    private var _hasContent:Boolean;
    private var _color:uint = 0; // 0x393939
    private var _isPlaying:Boolean;
    private var _isRecording:Boolean;
    private var _isQueued:Boolean;

    //--------------------------------------------------------------------------
    // API :: Properties
    //--------------------------------------------------------------------------

    //----------------------------------
    // index
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get index():int
    {
        return _index;
    }

    //----------------------------------
    // track
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get track():BitwigTrack
    {
        return _track;
    }

    //----------------------------------
    // name
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get name():String
    {
        return _name;
    }

    public function set name(value:String):void
    {
        _name = value;
    }

    //----------------------------------
    // isSelected
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get isSelected():Boolean
    {
        return _isSelected;
    }

    public function set isSelected(value:Boolean):void
    {
        _isSelected = value;
        dispatch(BitwigTrackEventType.CLIP_SELECTED_CHANGE,
                {trackIndex: track.index, index: _index, value: _isSelected});
    }

    //----------------------------------
    // hasContent
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get hasContent():Boolean
    {
        return _hasContent;
    }

    public function set hasContent(value:Boolean):void
    {
        _hasContent = value;
    }

    //----------------------------------
    // color
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get color():uint
    {
        if (_color == 0)
            return _track.color;
        return _color;
    }

    public function set color(value:uint):void
    {
        _color = value;
    }

    //----------------------------------
    // isPlaying
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get isPlaying():Boolean
    {
        return _isPlaying;
    }

    public function set isPlaying(value:Boolean):void
    {
        _isPlaying = value;
    }

    //----------------------------------
    // isRecording
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get isRecording():Boolean
    {
        return _isRecording;
    }

    public function set isRecording(value:Boolean):void
    {
        _isRecording = value;
    }

    //----------------------------------
    // isQueued
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get isQueued():Boolean
    {
        return _isQueued;
    }

    public function set isQueued(value:Boolean):void
    {
        _isQueued = value;
    }

    //--------------------------------------------------------------------------
    // Constructor
    //--------------------------------------------------------------------------

    /**
     *
     * @param index 1..clipBankLength
     * @param track The parent IBitwigTrack.
     * @param service The osc service.
     */
    public function BitwigClip(index:int, track:BitwigTrack, service:IOSCService)
    {
        super(service);
        _index = index;
        _track = track;
    }

    //--------------------------------------------------------------------------
    // API :: Methods
    //--------------------------------------------------------------------------

    /**
     * @inheritDoc
     */
    public function launch():void
    {
        service.send("/track/" + _track.index + "/clip/" + _index + "/launch");
    }

    /**
     * @inheritDoc
     */
    public function record():void
    {
        service.send("/track/" + _track.index + "/clip/" + _index + "/record");
    }

    /**
     * @inheritDoc
     */
    public function select():void
    {
        service.send("/track/" + _track.index + "/clip/" + _index + "/select");
    }

    /**
     * @inheritDoc
     */
    public function stop():void
    {
        service.send("/track/" + _track.index + "/clip/stop");
    }

    /**
     * @inheritDoc
     */
    public function returnToArrangement():void
    {
        service.send("/track/" + _track.index + "/clip/returntoarrangement");
    }
}
}