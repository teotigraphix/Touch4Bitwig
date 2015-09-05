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

import touch4bitwig.event.PanelModelEventType;
import touch4bitwig.service.IOSCService;

public class Arranger extends AbstractBitwigState
{
    private var _cueMarkerVisible:Boolean;
    private var _playbackFollowVisible:Boolean;
    private var _trackRowHeightVisible:Boolean;
    private var _clipLauncherVisible:Boolean;
    private var _timelineVisible:Boolean;
    private var _ioVisible:Boolean;
    private var _effectTracksVisible:Boolean;

    public function get cueMarkerVisible():Boolean
    {
        return _cueMarkerVisible;
    }

    public function set cueMarkerVisible(value:Boolean):void
    {
        if (isSame(_cueMarkerVisible, value))
            return;
        _cueMarkerVisible = value;
        dispatchValue(PanelModelEventType.ARRANGER_CUE_MARKER_VISIBLE_CHANGE, _cueMarkerVisible);
    }

    public function get playbackFollowVisible():Boolean
    {
        return _playbackFollowVisible;
    }

    public function set playbackFollowVisible(value:Boolean):void
    {
        if (isSame(_playbackFollowVisible, value))
            return;
        _playbackFollowVisible = value;
        dispatchValue(PanelModelEventType.ARRANGER_PLAYBACK_FOLLOW_VISIBLE_CHANGE, _playbackFollowVisible);
    }

    public function get trackRowHeightVisible():Boolean
    {
        return _trackRowHeightVisible;
    }

    public function set trackRowHeightVisible(value:Boolean):void
    {
        if (isSame(_trackRowHeightVisible, value))
            return;
        _trackRowHeightVisible = value;
        dispatchValue(PanelModelEventType.ARRANGER_TRACK_ROW_HEIGHT_VISIBLE_CHANGE, _trackRowHeightVisible);
    }

    public function get clipLauncherVisible():Boolean
    {
        return _clipLauncherVisible;
    }

    public function set clipLauncherVisible(value:Boolean):void
    {
        if (isSame(_clipLauncherVisible, value))
            return;
        _clipLauncherVisible = value;
        dispatchValue(PanelModelEventType.ARRANGER_CLIP_LAUNCHER_VISIBLE_CHANGE, _clipLauncherVisible);
    }

    public function get timelineVisible():Boolean
    {
        return _timelineVisible;
    }

    public function set timelineVisible(value:Boolean):void
    {
        if (isSame(_timelineVisible, value))
            return;
        _timelineVisible = value;
        dispatchValue(PanelModelEventType.ARRANGER_TIME_LINE_VISIBLE_CHANGE, _timelineVisible);
    }

    public function get ioVisible():Boolean
    {
        return _ioVisible;
    }

    public function set ioVisible(value:Boolean):void
    {
        if (isSame(_ioVisible, value))
            return;
        _ioVisible = value;
        dispatchValue(PanelModelEventType.ARRANGER_IO_VISIBLE_CHANGE, _ioVisible);
    }

    public function get effectTracksVisible():Boolean
    {
        return _effectTracksVisible;
    }

    public function set effectTracksVisible(value:Boolean):void
    {
        if (isSame(_effectTracksVisible, value))
            return;
        _effectTracksVisible = value;
        dispatchValue(PanelModelEventType.ARRANGER_EFFECTS_TRACKS_VISIBLE_CHANGE, _effectTracksVisible);
    }

    public function Arranger(service:IOSCService)
    {
        super(service);
    }
}
}
