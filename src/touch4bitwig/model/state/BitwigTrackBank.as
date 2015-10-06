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

public class BitwigTrackBank extends AbstractBitwigState
{
    private var _tracks:Vector.<BitwigTrack> = new Vector.<BitwigTrack>(8, true);

    private var _scenes:Vector.<BitwigScene> = new Vector.<BitwigScene>(8, true);

    private var _canScrollTracksUp:Boolean;
    private var _canScrollTracksDown:Boolean;

    public function get canScrollTracksUp():Boolean
    {
        return _canScrollTracksUp;
    }

    public function set canScrollTracksUp(value:Boolean):void
    {
        if (isSame(_canScrollTracksUp, value))
            return;
        _canScrollTracksUp = value;
        dispatchValue(BitwigTrackEventType.CAN_SCROLL_TRACKS_UP, _canScrollTracksUp);
    }

    public function get canScrollTracksDown():Boolean
    {
        return _canScrollTracksDown;
    }

    public function set canScrollTracksDown(value:Boolean):void
    {
        if (isSame(_canScrollTracksDown, value))
            return;
        _canScrollTracksDown = value;
        dispatchValue(BitwigTrackEventType.CAN_SCROLL_TRACKS_DOWN, _canScrollTracksDown);
    }

    public function get selectedTrack():BitwigTrack
    {
        for each (var track:BitwigTrack in tracks)
        {
            if (track.isSelected)
                return track;
        }
        return null;
    }

    public function get tracks():Vector.<BitwigTrack>
    {
        return _tracks;
    }

    public function set tracks(value:Vector.<BitwigTrack>):void
    {
        _tracks = value;
    }

    public function get scenes():Vector.<BitwigScene>
    {
        return _scenes;
    }

    public function set scenes(value:Vector.<BitwigScene>):void
    {
        _scenes = value;
    }

    public function BitwigTrackBank(service:IOSCService)
    {
        super(service);
        for (var i:int = 0; i < _tracks.length; i++)
        {
            _tracks[i] = new BitwigTrack(i + 1, service);
            _scenes[i] = new BitwigScene(i + 1, service);
        }
    }

    public function scrollTracksUp():void
    {
        service.send("/track/bank/-");
    }

    public function scrollTracksDown():void
    {
        service.send("/track/bank/+");
    }

    public function scrollTracksPageUp():void
    {
        service.send("/track/-");
    }

    public function scrollTracksPageDown():void
    {
        service.send("/track/+");
    }

    public function scrollScenesUp():void
    {
        service.send("/scene/-");
    }

    public function scrollScenesDown():void
    {
        service.send("/scene/+");
    }
}
}
