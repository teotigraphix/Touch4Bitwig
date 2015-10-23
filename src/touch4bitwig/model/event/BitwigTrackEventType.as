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

package touch4bitwig.model.event
{

import touch4bitwig.model.state.BitwigTrack;

public final class BitwigTrackEventType
{
    public static const CAN_SCROLL_TRACKS_UP:String = "canScrollTracksUp";
    public static const CAN_SCROLL_TRACKS_DOWN:String = "canScrollTracksDown";

    public static const EXISTS_CHANGE:String = BitwigTrack.EXISTS + "Change";
    public static const CAN_HOLD_NOTES_CHANGE:String = BitwigTrack.CAN_HOLD_NOTES + "Change";
    public static const SELECTED_CHANGE:String = BitwigTrack.SELECTED + "Change";
    public static const NAME_CHANGE:String = BitwigTrack.NAME + "Change";
    public static const COLOR_CHANGE:String = BitwigTrack.COLOR + "Change";
    public static const VOLUME_CHANGE:String = BitwigTrack.VOLUME + "Change";
    public static const VOLUME_STRING_CHANGE:String = BitwigTrack.VOLUME_STRING + "Change";
    public static const PAN_CHANGE:String = BitwigTrack.PAN + "Change";
    public static const PAN_STRING_CHANGE:String = BitwigTrack.PAN_STRING + "Change";
    public static const RECORD_CHANGE:String = BitwigTrack.RECARM + "Change";
    public static const SOLO_CHANGE:String = BitwigTrack.SOLO + "Change";
    public static const MUTE_CHANGE:String = BitwigTrack.MUTE + "Change";
    public static const VU_CHANGE:String = BitwigTrack.VU + "Change";

    public static const CLIP_SELECTED_CHANGE:String = BitwigTrack.EXISTS + "Change";

}
}
