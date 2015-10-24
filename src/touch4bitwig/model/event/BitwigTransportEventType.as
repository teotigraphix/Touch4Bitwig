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

import touch4bitwig.model.state.BitwigTransport;

public final class BitwigTransportEventType
{
    public static const POSITION_STRING_CHANGE:String = BitwigTransport.POSITION_STRING + "Change";
    public static const NUMERATOR_CHANGE:String = BitwigTransport.NUMERATOR + "Change";
    public static const DENOMINATOR_CHANGE:String = BitwigTransport.DENOMINATOR + "Change";
    public static const TIME_SIGNATURE_CHANGE:String = BitwigTransport.TIME_SIGNATURE + "Change";

    public static const IS_AUTOMATION_OVERRIDE_CHANGE:String = BitwigTransport.IS_AUTOMATION_OVERRIDE + "Change";

    public static const TEMPO_RAW_CHANGE:String = BitwigTransport.TEMPO_RAW + "Change";
    public static const IS_CLICK_CHANGE:String = BitwigTransport.IS_CLICK + "Change";
    public static const IS_PLAYING_CHANGE:String = BitwigTransport.IS_PLAYING + "Change";
    public static const IS_RECORDING_CHANGE:String = BitwigTransport.IS_RECORDING + "Change";
    public static const IS_REPEAT_CHANGE:String = BitwigTransport.IS_REPEAT + "Change";
    public static const IS_PRE_ROLL_CHANGE:String = BitwigTransport.IS_PRE_ROLL + "Change";
    public static const IS_OVERDUB_LAUNCHER_CHANGE:String = BitwigTransport.IS_OVER_DUB_LAUNCHER + "Change";
    public static const IS_OVERDUB_CHANGE:String = BitwigTransport.IS_OVER_DUB + "Change";
    public static const CROSSFADE_CHANGE:String = BitwigTransport.CROSS_FADE + "Change";
    public static const IS_AUTO_WRITE_LAUNCHER_CHANGE:String = BitwigTransport.IS_AUTO_WRITE_LAUNCHER + "Change";
    public static const IS_AUTO_WRITE_CHANGE:String = BitwigTransport.IS_AUTO_WRITE + "Change";
    public static const AUTOMATION_WRITE_MODE_CHANGE:String = BitwigTransport.AUTOMATION_WRITE_MODE + "Change";

    public static const IS_PUNCH_IN_CHANGE:String = BitwigTransport.IS_PUNCH_IN + "Change";
    public static const IS_PUNCH_OUT_CHANGE:String = BitwigTransport.IS_PUNCH_OUT + "Change";
}
}
