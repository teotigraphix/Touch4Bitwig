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

package touch4bitwig.event
{

public final class TrackModelEventType
{
    public static const CAN_SCROLL_TRACKS_UP:String = "canScrollTracksUp";
    public static const CAN_SCROLL_TRACKS_DOWN:String = "canScrollTracksDown";

    public static const EXISTS_CHANGE:String = "trackExistsChange";
    public static const CAN_HOLD_NOTES_CHANGE:String = "canHoldNotesChange";
    public static const SELECTED_CHANGE:String = "trackSelectedChange";
    public static const NAME_CHANGE:String = "trackNameChange";
    public static const COLOR_CHANGE:String = "trackColorChange";
    public static const VOLUME_CHANGE:String = "trackVolumeChange";
    public static const VOLUME_STRING_CHANGE:String = "trackVolumeStringChange";
    public static const PAN_CHANGE:String = "trackPanChange";
    public static const PAN_STRING_CHANGE:String = "trackPanStringChange";
    public static const RECORD_CHANGE:String = "trackRecordChange";
    public static const SOLO_CHANGE:String = "trackSoloChange";
    public static const MUTE_CHANGE:String = "trackMuteChange";
    public static const VU_CHANGE:String = "trackVUChange";

    public static const CLIP_SELECTED_CHANGE:String = "clipSelectedChange";

}
}
