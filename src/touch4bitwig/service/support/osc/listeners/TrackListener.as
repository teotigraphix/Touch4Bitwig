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

package touch4bitwig.service.support.osc.listeners
{

import com.teotigraphix.frameworks.osc.OSCMessage;

import touch4bitwig.model.state.TrackBank;
import touch4bitwig.service.IOSCService;

public class TrackListener extends AbstractOSCListener
{
    private var _model:TrackBank;

    public function TrackListener(service:IOSCService, model:TrackBank)
    {
        super(service);
        _model = model;

        config();
    }

    override protected function config():void
    {
        _methods["/track/canScrollTracksUp"] = canScrollTracksUp;
        _methods["/track/canScrollTracksDown"] = canScrollTracksDown;

        for (var i:int = 1; i < 9; i++)
        {
            _methods["/track/" + i + "/canHoldNotes"] = trackCanHoldNotesHandler;
            _methods["/track/" + i + "/exists"] = trackExistsHandler;
            _methods["/track/" + i + "/selected"] = trackSelectedHandler;
            _methods["/track/" + i + "/name"] = trackNameHandler;
            _methods["/track/" + i + "/color"] = trackColorHandler;
            _methods["/track/" + i + "/recarm"] = trackRecArmHandler;
            _methods["/track/" + i + "/solo"] = trackSoloHandler;
            _methods["/track/" + i + "/mute"] = trackMuteHandler;
            _methods["/track/" + i + "/volume"] = trackVolumeHandler;
            _methods["/track/" + i + "/pan"] = trackPanHandler;
            _methods["/track/" + i + "/volumeStr"] = trackVolumeStrHandler;
            _methods["/track/" + i + "/panStr"] = trackPanStrHandler;
            _methods["/track/" + i + "/vu"] = trackVUHandler;

            for (var j:int = 1; j < 9; j++)
            {
                _methods["/track/" + i + "/clip/" + j + "/name"] = clipNameHandler;
                _methods["/track/" + i + "/clip/" + j + "/selected"] = clipIsSelectedHandler;
                _methods["/track/" + i + "/clip/" + j + "/hasContent"] = clipHasContentHandler;
                _methods["/track/" + i + "/clip/" + j + "/color"] = clipColorHandler;
                _methods["/track/" + i + "/clip/" + j + "/isPlaying"] = clipIsPlayingHandler;
                _methods["/track/" + i + "/clip/" + j + "/isRecording"] = clipIsRecordingHandler;
                _methods["/track/" + i + "/clip/" + j + "/isQueued"] = clipIsQueuedHandler;
            }
        }
    }

    private function canScrollTracksUp(osc:OSCMessage):void
    {
        _model.canScrollTracksUp = osc.arguments[0];
    }

    private function canScrollTracksDown(osc:OSCMessage):void
    {
        _model.canScrollTracksDown = osc.arguments[0];
    }

    private function trackCanHoldNotesHandler(osc:OSCMessage):void
    {
        _model.tracks[toIndex(osc)].canHoldNotes = osc.arguments[0];
    }

    private function trackExistsHandler(osc:OSCMessage):void
    {
        _model.tracks[toIndex(osc)].exists = osc.arguments[0];
    }

    private function trackSelectedHandler(osc:OSCMessage):void
    {
        _model.tracks[toIndex(osc)].isSelected = osc.arguments[0];
    }

    private function trackNameHandler(osc:OSCMessage):void
    {
        _model.tracks[toIndex(osc)].name = osc.arguments[0];
    }

    private function trackColorHandler(osc:OSCMessage):void
    {
        _model.tracks[toIndex(osc)].color = toColor(osc);
    }

    private function trackRecArmHandler(osc:OSCMessage):void
    {
        _model.tracks[toIndex(osc)].isRecArm = osc.arguments[0];
    }

    private function trackSoloHandler(osc:OSCMessage):void
    {
        _model.tracks[toIndex(osc)].isSolo = osc.arguments[0];
    }

    private function trackMuteHandler(osc:OSCMessage):void
    {
        _model.tracks[toIndex(osc)].isMute = osc.arguments[0];
    }

    private function trackVolumeHandler(osc:OSCMessage):void
    {
        _model.tracks[toIndex(osc)].volume = osc.arguments[0];
    }

    private function trackVolumeStrHandler(osc:OSCMessage):void
    {
        _model.tracks[toIndex(osc)].volumeString = osc.arguments[0];
    }

    private function trackPanHandler(osc:OSCMessage):void
    {
        _model.tracks[toIndex(osc)].pan = osc.arguments[0];
    }

    private function trackPanStrHandler(osc:OSCMessage):void
    {
        _model.tracks[toIndex(osc)].panString = osc.arguments[0];
    }

    private function trackVUHandler(osc:OSCMessage):void
    {
        _model.tracks[toIndex(osc)].vu = osc.arguments[0];
    }

    //----------------------------------
    // Clips
    //----------------------------------

    private function clipNameHandler(osc:OSCMessage):void
    {
        _model.tracks[toIndex(osc)].clips[toClipIndex(osc)].name = osc.arguments[0];
    }

    private function clipIsSelectedHandler(osc:OSCMessage):void
    {
        _model.tracks[toIndex(osc)].clips[toClipIndex(osc)].isSelected = osc.arguments[0];
    }

    private function clipHasContentHandler(osc:OSCMessage):void
    {
        _model.tracks[toIndex(osc)].clips[toClipIndex(osc)].hasContent = osc.arguments[0];
    }

    private function clipColorHandler(osc:OSCMessage):void
    {
        _model.tracks[toIndex(osc)].clips[toClipIndex(osc)].color = toColor(osc);
    }

    private function clipIsPlayingHandler(osc:OSCMessage):void
    {
        _model.tracks[toIndex(osc)].clips[toClipIndex(osc)].isPlaying = osc.arguments[0];
    }

    private function clipIsRecordingHandler(osc:OSCMessage):void
    {
        _model.tracks[toIndex(osc)].clips[toClipIndex(osc)].isRecording = osc.arguments[0];
    }

    private function clipIsQueuedHandler(osc:OSCMessage):void
    {
        _model.tracks[toIndex(osc)].clips[toClipIndex(osc)].isQueued = osc.arguments[0];
    }

    public static function toColor(osc:OSCMessage):uint
    {
        var value:String = osc.arguments[0];
        value = value.substring(4, value.length - 1);
        var colors:Array = value.split(",");
        var rgb:uint = (((255 * Number(colors[0])) & 0x0ff) << 16) |
                (((255 * Number(colors[1])) & 0x0ff) << 8) |
                ((255 * Number(colors[2])) & 0x0ff);
        return rgb;
    }

    private static function toIndex(osc:OSCMessage):int
    {
        var split:Array = osc.address.split("/");
        return int(split[2]) - 1;
    }

    private static function toClipIndex(osc:OSCMessage):int
    {
        var split:Array = osc.address.split("/");
        return int(split[4]) - 1;
    }
}
}
