////////////////////////////////////////////////////////////////////////////////
// Copyright 2016 Michael Schmalle - Teoti Graphix, LLC
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
package t4b.model.event
{



public final class BitwigTransportEventType
{
    public static const VALUE_CHANGED:String = "BitwigTransportEventType/valueChanged";
    
    public static const IS_PUNCH_IN:String = "isPunchIn";
    public static const IS_PUNCH_OUT:String = "isPunchOut";
    public static const POSITION_STRING:String = "positionString";
    
    public static const NUMERATOR:String = "numerator";
    public static const DENOMINATOR:String = "denominator";
    public static const TIME_SIGNATURE:String = "timeSignature";
    
    public static const IS_AUTOMATION_OVERRIDE:String = "isAutomationOverride";
    public static const TEMPO_RAW:String = "tempoRaw";
    public static const IS_CLICK:String = "isClick";
    public static const IS_PLAYING:String = "isPlaying";
    public static const IS_RECORDING:String = "isRecording";
    
    public static const IS_REPEAT:String = "isRepeat";
    public static const IS_PRE_ROLL:String = "isPreRoll";
    public static const IS_OVER_DUB_LAUNCHER:String = "isOverdubLauncher";
    public static const IS_OVER_DUB:String = "isOverdub";
    public static const CROSS_FADE:String = "crossFade";
    public static const IS_AUTO_WRITE:String = "isAutoWrite";
    public static const IS_AUTO_WRITE_LAUNCHER:String = "isAutoWriteLauncher";
    public static const AUTOMATION_WRITE_MODE:String = "automationWriteMode";
}
}
