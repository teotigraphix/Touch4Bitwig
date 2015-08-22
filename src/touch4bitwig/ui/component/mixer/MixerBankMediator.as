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

import starling.animation.Juggler;
import starling.events.Event;

import touch4bitwig.event.TrackModelEventType;
import touch4bitwig.model.state.Track;
import touch4bitwig.service.IOSCService;
import touch4bitwig.ui.mediator.AbstractUIMediator;

public class MixerBankMediator extends AbstractUIMediator
{
    [Inject]
    public var juggler:Juggler;

    [Inject]
    public var oscService:IOSCService;

    [Inject]
    public var view:MixerBank;

    public function MixerBankMediator()
    {
    }

    override public function onRegister():void
    {
        super.onRegister();

        addContextListener(TrackModelEventType.EXISTS_CHANGE, context_trackExistsHandler);
        addContextListener(TrackModelEventType.CAN_HOLD_NOTES_CHANGE, context_canHoldNotesHandler);
        addContextListener(TrackModelEventType.SELECTED_CHANGE, context_trackSelectedHandler);
        addContextListener(TrackModelEventType.NAME_CHANGE, context_trackNameHandler);
        addContextListener(TrackModelEventType.COLOR_CHANGE, context_trackColorHandler);
        addContextListener(TrackModelEventType.VOLUME_CHANGE, context_trackVolumeHandler);
        addContextListener(TrackModelEventType.VOLUME_STRING_CHANGE, context_trackVolumeStringHandler);
        addContextListener(TrackModelEventType.PAN_CHANGE, context_trackPanHandler);
        addContextListener(TrackModelEventType.PAN_STRING_CHANGE, context_trackPanStringHandler);
        addContextListener(TrackModelEventType.RECORD_CHANGE, context_trackRecordHandler);
        addContextListener(TrackModelEventType.SOLO_CHANGE, context_trackSoloHandler);
        addContextListener(TrackModelEventType.MUTE_CHANGE, context_trackMuteHandler);
        addContextListener(TrackModelEventType.VU_CHANGE, context_trackVUHandler);

        for (var i:int = 0; i < 8; i++)
        {
            var track:Track = oscModel.trackBank.tracks[i];
            var index:int = track.index;
            view.setCanHoldNotes(index, track.canHoldNotes);
            view.setExists(index, track.exists);
            view.setTrackSelected(index, track.isSelected);
            view.setTrackName(index, track.name);
            view.setTrackColor(index, track.color);
            view.setVolume(index, track.volume);
            view.setVolumeString(index, track.volumeString);
            view.setPan(index, track.pan);
            view.setPanString(index, track.panString);
            view.setRecord(index, track.isRecArm);
            view.setSolo(index, track.isSolo);
            view.setMute(index, track.isMute);
            view.setVU(index, track.vu);
        }

        addViewListener(MixerItem.EVENT_DOUBLE_TAP, view_doubleTapHandler);
        addViewListener(MixerItem.EVENT_VOLUME_CHANGE, view_volumeChangeHandler);
        addViewListener(MixerItem.EVENT_PAN_CHANGE, view_panChangeHandler);
        addViewListener(MixerItem.EVENT_RECORD_CHANGE, view_recordChangeHandler);
        addViewListener(MixerItem.EVENT_SOLO_CHANGE, view_soloChangeHandler);
        addViewListener(MixerItem.EVENT_MUTE_CHANGE, view_muteChangeHandler);
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    private function context_trackExistsHandler(event:Event, data:Object):void
    {
        view.setExists(data.index, data.value);
    }

    private function context_canHoldNotesHandler(event:Event, data:Object):void
    {
        view.setCanHoldNotes(data.index, data.value);
    }

    private function context_trackSelectedHandler(event:Event, data:Object):void
    {
        view.setTrackSelected(data.index, data.value);
    }

    private function context_trackNameHandler(event:Event, data:Object):void
    {
        view.setTrackName(data.index, data.value);
    }

    private function context_trackColorHandler(event:Event, data:Object):void
    {
        view.setTrackColor(data.index, data.value);
    }

    private function context_trackVolumeHandler(event:Event, data:Object):void
    {
        view.setVolume(data.index, data.value);
    }

    private function context_trackVolumeStringHandler(event:Event, data:Object):void
    {
        view.setVolumeString(data.index, data.value);
    }

    private function context_trackPanHandler(event:Event, data:Object):void
    {
        view.setPan(data.index, data.value);
    }

    private function context_trackPanStringHandler(event:Event, data:Object):void
    {
        view.setPanString(data.index, data.value);
    }

    private function context_trackRecordHandler(event:Event, data:Object):void
    {
        view.setRecord(data.index, data.value);
    }

    private function context_trackSoloHandler(event:Event, data:Object):void
    {
        view.setSolo(data.index, data.value);
    }

    private function context_trackMuteHandler(event:Event, data:Object):void
    {
        view.setMute(data.index, data.value);
    }

    private function context_trackVUHandler(event:Event, data:Object):void
    {
        view.setVU(data.index, data.value);
    }

    private function view_doubleTapHandler(event:Event, index:int):void
    {
        oscService.send("/track/" + (index + 1) + "/select");
    }

    private function view_volumeChangeHandler(event:Event, index:int):void
    {
        oscService.sendInt("/track/" + (index + 1) + "/volume", view.getVolume(index));
    }

    private function view_panChangeHandler(event:Event, index:int):void
    {
        oscService.sendInt("/track/" + (index + 1) + "/pan", view.getPan(index));
    }

    private function view_recordChangeHandler(event:Event, index:int):void
    {
        oscService.sendBoolean("/track/" + (index + 1) + "/recarm", view.getRecord(index));
    }

    private function view_soloChangeHandler(event:Event, index:int):void
    {
        oscService.sendBoolean("/track/" + (index + 1) + "/solo", view.getSolo(index));
    }

    private function view_muteChangeHandler(event:Event, index:int):void
    {
        oscService.sendBoolean("/track/" + (index + 1) + "/mute", view.getMute(index));
    }
}
}
