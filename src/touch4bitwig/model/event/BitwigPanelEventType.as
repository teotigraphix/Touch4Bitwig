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

public final class BitwigPanelEventType
{
    public static const PANEL_NOTE_EDITOR_VISIBLE_CHANGE:String = "panelNoteEditorVisibleChange";
    public static const PANEL_AUTOMATION_EDITOR_VISIBLE_CHANGE:String = "panelAutomationEditorVisibleChange";
    public static const PANEL_DEVICES_VISIBLE_CHANGE:String = "panelDevicesVisibleChange";
    public static const PANEL_MIXER_VISIBLE_CHANGE:String = "panelMixerVisible";
    public static const PANEL_FULL_SCREEN_VISIBLE_CHANGE:String = "panelFullscreenVisible";

    // Arranger
    public static const ARRANGER_CUE_MARKER_VISIBLE_CHANGE:String = "arrangerCueMarkerVisibleChange";
    public static const ARRANGER_PLAYBACK_FOLLOW_VISIBLE_CHANGE:String = "arrangerPlaybackFollowVisibleChange";
    public static const ARRANGER_TRACK_ROW_HEIGHT_VISIBLE_CHANGE:String = "arrangerTrackRowHeightVisibleChange";
    public static const ARRANGER_CLIP_LAUNCHER_VISIBLE_CHANGE:String = "arrangerClipLauncherVisibleChange";
    public static const ARRANGER_TIME_LINE_VISIBLE_CHANGE:String = "arrangerTimeLineVisibleChange";
    public static const ARRANGER_IO_VISIBLE_CHANGE:String = "arrangerIoVisibleChange";
    public static const ARRANGER_EFFECTS_TRACKS_VISIBLE_CHANGE:String = "arrangerEffectTracksVisibleChange";

    // Mixer
    public static const MIXER_CLIP_LAUNCHER_VISIBLE_CHANGE:String = "mixerClipLauncherVisibleChange";
    public static const MIXER_CROSS_FADE_VISIBLE_CHANGE:String = "mixerCrossFadeVisibleChange";
    public static const MIXER_DEVICE_VISIBLE_CHANGE:String = "mixerDeviceVisibleChange";
    public static const MIXER_SENDS_VISIBLE_CHANGE:String = "mixerSendsVisibleChange";
    public static const MIXER_IO_VISIBLE_CHANGE:String = "mixerIoVisibleChange";
    public static const MIXER_METER_VISIBLE_CHANGE:String = "mixerMeterVisibleChange";

}
}
