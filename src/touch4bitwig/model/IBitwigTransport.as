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
package touch4bitwig.model
{

/*



 */

public interface IBitwigTransport extends IBitwigState
{

    //--------------------------------------------------------------------------
    // Properties
    //--------------------------------------------------------------------------

    /**
     * The formatted track transport position String.
     */
    function get positionString():String;

    /**
     * The time signature numerator.
     */
    function get numerator():int;

    /**
     * The time signature denominator.
     */
    function get denominator():int;

    /**
     * Whether the arrangement automation override is enabled.
     */
    function get isAutomationOverride():Boolean;

    /**
     * The Raw tempo as a String.
     */
    function get tempoRaw():String;

    /**
     * Whether the metronome click is enabled.
     */
    function get isClick():Boolean;

    /**
     * Whether the transport is playing.
     */
    function get isPlaying():Boolean;

    /**
     * Whether the arrangement is recording.
     */
    function get isRecording():Boolean;

    /**
     * Whether the loop repeat is enabled.
     */
    function get isRepeat():Boolean;

    /**
     * Whether record preroll is enabled.
     */
    function get isPreRoll():Boolean;

    /**
     * Whether overdub is enabled for the clip launcher.
     */
    function get isOverdubLauncher():Boolean;

    /**
     * Whether overdub is enabled for the arrangement.
     */
    function get isOverdub():Boolean;

    /**
     * TODO Doc
     */
    function get isCrossFade():Boolean;

    /**
     * Whether automation auto write is enabled for the clip launcher.
     */
    function get isAutoWriteLauncher():Boolean;

    /**
     * Whether automation auto write is enabled for the arrangement.
     */
    function get isAutoWrite():Boolean;

    /**
     * The automation over write mode (TOUCH< LATCH,
     */
    function get automationWriteMode():String;

    //----------------------------------
    // Non Bitwig API
    //----------------------------------

    function get automationWriteModeIndex():int;

    //--------------------------------------------------------------------------
    // Methods
    //--------------------------------------------------------------------------

    /**
     * Taps the tempo.
     */
    function tapTempo():void;

    /**
     * Sets a raw float tempo, eg 135.686.
     *
     * @param tempo The raw float tempo.
     */
    function setTempoRaw(tempo:Number):void;

    /**
     * Toggles the transport's Play on/off.
     */
    function togglePlay():void;

    /**
     * Stops the transport.
     */
    function stop():void;

    /**
     * Toggles the arrangement auto write enabled.
     */
    function toggleAutoWrite():void;

    /**
     * Toggles the arrangement record.
     */
    function toggleRecord():void;


}
}
