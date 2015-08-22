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

public final class TransportModelEventType
{
    public static const POSITION_STRING_CHANGE:String = "positionStringChange";
    public static const NUMERATOR_CHANGE:String = "numeratorChange";
    public static const DENOMINATOR_CHANGE:String = "denominatorChange";
    public static const IS_AUTOMATION_OVERRIDE_CHANGE:String = "automationOverrideChange";

    public static const TEMPO_RAW_CHANGE:String = "tempoRawChange";
    public static const IS_CLICK_CHANGE:String = "isClickChange";
    public static const IS_PLAYING_CHANGE:String = "isPlayingChange";
    public static const IS_RECORDING_CHANGE:String = "isRecordingChange";
    public static const IS_REPEAT_CHANGE:String = "isRepeatChange";
    public static const IS_PRE_ROLL_CHANGE:String = "isPreRollChange";
    public static const IS_OVERDUB_LAUNCHER_CHANGE:String = "isOverdubLauncherChange";
    public static const IS_OVERDUB_CHANGE:String = "isOverdubChange";
    public static const IS_CROSSFADE_CHANGE:String = "isCrossFadeChange";
    public static const IS_AUTOWRITE_LAUNCHER_CHANGE:String = "isAutowriteLauncherChange";
    public static const IS_AUTOWRITE_CHANGE:String = "isAutowriteChange";
    public static const AUTOMATION_WRITE_MODE_CHANGE:String = "automationWriteModeChange";

}
}
