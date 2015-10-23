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

import touch4bitwig.model.IBitwigTrack;
import touch4bitwig.model.event.BitwigTrackEventType;
import touch4bitwig.ui.AbstractUIMediator;

public class MixerBankMediator extends AbstractUIMediator
{
    [Inject]
    public var juggler:Juggler;

    [Inject]
    public var view:MixerBank;

    public function MixerBankMediator()
    {
    }

    override public function onRegister():void
    {
        super.onRegister();

        addContextListener(BitwigTrackEventType.EXISTS_CHANGE, context_trackExistsHandler);
        addContextListener(BitwigTrackEventType.CAN_HOLD_NOTES_CHANGE, context_canHoldNotesHandler);
        addContextListener(BitwigTrackEventType.SELECTED_CHANGE, context_trackSelectedHandler);
        addContextListener(BitwigTrackEventType.NAME_CHANGE, context_trackNameHandler);
        addContextListener(BitwigTrackEventType.COLOR_CHANGE, context_trackColorHandler);
        addContextListener(BitwigTrackEventType.VOLUME_CHANGE, context_trackVolumeHandler);
        addContextListener(BitwigTrackEventType.VOLUME_STRING_CHANGE, context_trackVolumeStringHandler);
        addContextListener(BitwigTrackEventType.PAN_CHANGE, context_trackPanHandler);
        addContextListener(BitwigTrackEventType.PAN_STRING_CHANGE, context_trackPanStringHandler);
        addContextListener(BitwigTrackEventType.RECORD_CHANGE, context_trackRecordHandler);
        addContextListener(BitwigTrackEventType.SOLO_CHANGE, context_trackSoloHandler);
        addContextListener(BitwigTrackEventType.MUTE_CHANGE, context_trackMuteHandler);
        addContextListener(BitwigTrackEventType.VU_CHANGE, context_trackVUHandler);

        for (var i:int = 1; i < 9; i++)
        {
            var track:IBitwigTrack = oscModel.trackBank.getTrack(i);
            var item:IMixerItem = view.getMixerItem(track.index);

            item.canHoldNotes = track.canHoldNotes;
            item.exists = track.exists;
            item.selected = track.selected;
            item.trackName = track.name;
            item.trackColor = track.color;
            item.volume = track.volume;
            item.volumeString = track.volumeString;
            item.pan = track.pan;
            item.panString = track.panString;
            item.isRecArm = track.recarm;
            item.isSolo = track.solo;
            item.isMute = track.mute;
            item.vu = track.vu;
        }

        addViewListener(MixerItem.EVENT_SELECT, view_selectHandler);
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

    //--------------------------------------------------------------------------
    // Context :: Handlers
    //--------------------------------------------------------------------------

    private function context_trackExistsHandler(event:Event, data:Object):void
    {
        view.getMixerItem(data.index).exists = data.value;
    }

    private function context_canHoldNotesHandler(event:Event, data:Object):void
    {
        view.getMixerItem(data.index).canHoldNotes = data.value;
    }

    private function context_trackSelectedHandler(event:Event, data:Object):void
    {
        view.getMixerItem(data.index).selected = data.value;
    }

    private function context_trackNameHandler(event:Event, data:Object):void
    {
        view.getMixerItem(data.index).trackName = data.value;
    }

    private function context_trackColorHandler(event:Event, data:Object):void
    {
        view.getMixerItem(data.index).trackColor = data.value;
    }

    private function context_trackVolumeHandler(event:Event, data:Object):void
    {
        view.getMixerItem(data.index).volume = data.value;
    }

    private function context_trackVolumeStringHandler(event:Event, data:Object):void
    {
        view.getMixerItem(data.index).volumeString = data.value;
    }

    private function context_trackPanHandler(event:Event, data:Object):void
    {
        view.getMixerItem(data.index).pan = data.value;
    }

    private function context_trackPanStringHandler(event:Event, data:Object):void
    {
        view.getMixerItem(data.index).panString = data.value;
    }

    private function context_trackRecordHandler(event:Event, data:Object):void
    {
        view.getMixerItem(data.index).isRecArm = data.value;
    }

    private function context_trackSoloHandler(event:Event, data:Object):void
    {
        view.getMixerItem(data.index).isSolo = data.value;
    }

    private function context_trackMuteHandler(event:Event, data:Object):void
    {
        view.getMixerItem(data.index).isMute = data.value;
    }

    private function context_trackVUHandler(event:Event, data:Object):void
    {
        view.getMixerItem(data.index).vu = data.value;
    }

    //--------------------------------------------------------------------------
    // View :: Handlers
    //--------------------------------------------------------------------------

    private function view_selectHandler(event:Event, index:int):void
    {
        // XXX BUG
        if (index == 0)
            return;
        oscModel.trackBank.getTrack(index).selected = true;
    }

    private function view_doubleTapHandler(event:Event, index:int):void
    {
        oscModel.trackBank.selectChildren(index);
    }

    private function view_volumeChangeHandler(event:Event, index:int):void
    {
        oscModel.trackBank.getTrack(index).volume = view.getMixerItem(index).volume;
    }

    private function view_panChangeHandler(event:Event, index:int):void
    {
        oscModel.trackBank.getTrack(index).pan = view.getMixerItem(index).pan;
    }

    private function view_recordChangeHandler(event:Event, index:int):void
    {
        oscModel.trackBank.getTrack(index).recarm = view.getMixerItem(index).isRecArm;
    }

    private function view_soloChangeHandler(event:Event, index:int):void
    {
        oscModel.trackBank.getTrack(index).solo = view.getMixerItem(index).isSolo;
    }

    private function view_muteChangeHandler(event:Event, index:int):void
    {
        oscModel.trackBank.getTrack(index).mute = view.getMixerItem(index).isMute;
    }
}
}
