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

Sent


Received


- /play [toggles play/pause (moves the start play head on pause)]
* get isPlaying:Boolean
- /play {1} [If the transport is NOT playing, play.]
* togglePlay():void



- /stop [stops the transport if isPlaying == true, resets the play head if isPlaying == false]
* get isPlaying:Boolean
* stop(reset:Boolean = false):void
- /stop {1} [If the transport IS playing, stop.]

- /restart
* restart():void

- /record
* get isRecording:Boolean
* toggleRecord():void

- /overdub [toggles launcher overdub]
- /overdub/launcher [toggles arranger overdub]

- /repeat toggles
* toggleRepeat():void
- /repeat {0, 1}
* isRepeat:Boolean

- /punchIn [toggles punch in]
* get isPunchOut:Boolean
* togglePunchOut():void
- /punchOut [toggles punch out]
* get isPunchIn:Boolean
* togglePunchIn():void


- /click [toggles metronome click]
* toggleClick():void
- /click {0,1}
* isClick:Boolean

- /tempo/raw {0.0..666.0} [sets the raw tempo]
* tempRaw:Number
- /tempo/tap [taps the tempo]
* tapTempo():void
- /tempo/+ ?{value} [increments tempo by one, optionally increment by value]
* incTempo(value:Number = 1):void
- /tempo/- ?{value} [decrements tempo by one, optionally decrement by value]
* decTempo(value:Number = 1):void
- /time {value} [Sets the transport playback position to the given beat time value.]
* setTime(value:Number):void

- /position/+ [Increase position by 0.01]
- /position/- [Decrease position by 0.01]
- /position/++ [Increase position by 1]
- /position/-- [Decrease position by 1]
* incPosition(fine:Boolean = false):void
* decPosition(fine:Boolean = false):void

- /crossfade {0..127} [Sets the crossfade amount between A & B]
* crossFade:int

- /autowrite [Toggles the clip launcher automation write enabled state of the Bitwig Studio transport.]
- /automationWriteMode [Toggles the arranger automation write enabled state of the Bitwig Studio transport.]
* get isAutoWrite:Boolean
* get isAutoWriteLauncher:Boolean
* toggleAutoWrite():void
* toggleAutoWriteLauncher():void

MINE
- /automationOverride
* resetAutomationOverride():void

 */

public interface IBitwigTransport extends IBitwigState
{

    //--------------------------------------------------------------------------
    // Properties
    //--------------------------------------------------------------------------

    //----------------------------------
    // isPlaying
    //----------------------------------

    /**
     * [ReadOnly] Whether the transport is playing.
     *
     * @see #togglePlay()
     * @see #stop()
     */
    function get isPlaying():Boolean;

    //----------------------------------
    // isRecording
    //----------------------------------

    /**
     * [ReadOnly] Whether the arrangement is recording.
     *
     * @see #toggleRecord()
     */
    function get isRecording():Boolean;

    //----------------------------------
    // isOverdub
    //----------------------------------

    /**
     * Whether overdub is enabled for the arrangement.
     */
    function get isOverdub():Boolean;

    function set isOverdub(value:Boolean):void;

    //----------------------------------
    // isOverdubLauncher
    //----------------------------------

    /**
     * Whether overdub is enabled for the clip launcher.
     */
    function get isOverdubLauncher():Boolean;

    function set isOverdubLauncher(value:Boolean):void;

    //----------------------------------
    // isRepeat
    //----------------------------------

    /**
     * Whether the loop repeat is enabled.
     */
    function get isRepeat():Boolean;

    function set isRepeat(value:Boolean):void;

    //----------------------------------
    // isPunchIn
    //----------------------------------

    /**
     * [ReadOnly]
     */
    function get isPunchIn():Boolean;

    //----------------------------------
    // isPunchOut
    //----------------------------------

    /**
     * [ReadOnly]
     */
    function get isPunchOut():Boolean;

    //----------------------------------
    // isClick
    //----------------------------------

    /**
     * Whether the metronome click is enabled.
     *
     * @see #toggleClick()
     */
    function get isClick():Boolean;

    function set isClick(value:Boolean):void;

    //----------------------------------
    // tempoRaw
    //----------------------------------

    /**
     * The Raw tempo as a String (0.0-666.0).
     */
    function get tempoRaw():Number;

    function set tempoRaw(value:Number):void;

    //----------------------------------
    // crossFade
    //----------------------------------

    /**
     * The amount of track crossfade between A & B.
     */
    function get crossFade():int;

    function set crossFade(value:int):void;

    //----------------------------------
    // isAutoWriteLauncher
    //----------------------------------

    /**
     * [ReadOnly] Whether automation auto write is enabled for the clip launcher.
     */
    function get isAutoWriteLauncher():Boolean;

    //----------------------------------
    // isAutoWrite
    //----------------------------------

    /**
     * [ReadOnly] Whether automation auto write is enabled for the arrangement.
     */
    function get isAutoWrite():Boolean;

    //----------------------------------
    // isPreRoll
    //----------------------------------

    /**
     * [ReadOnly] Whether record pre-roll is enabled.
     */
    function get isPreRoll():Boolean;

    //----------------------------------
    // automationWriteMode
    //----------------------------------

    /**
     * The automation over write mode (latch,touch,write).
     */
    function get automationWriteMode():String;

    function set automationWriteMode(value:String):void;

    //----------------------------------
    // positionString
    //----------------------------------

    /**
     * [ReadOnly] The formatted track transport position String.
     */
    function get positionString():String;

    //----------------------------------
    // numerator
    //----------------------------------

    /**
     * TODO setter, The time signature numerator.
     */
    function get numerator():int;

    //----------------------------------
    // denominator
    //----------------------------------

    /**
     * TODO setter, The time signature denominator.
     */
    function get denominator():int;

    //----------------------------------
    // isAutomationOverride
    //----------------------------------

    /**
     * Whether the arrangement automation override is enabled.
     */
    function get isAutomationOverride():Boolean;

    //----------------------------------
    // timeSignature
    //----------------------------------

    /**
     * Updates the time signature according to the given string.
     *
     * <p>A textual representation of the new time signature value, formatted as
     * 'numerator/denominator[, ticks]'</p>
     */
    function get timeSignature():String;

    function set timeSignature(value:String):void;

    //----------------------------------
    // Non Bitwig API
    //----------------------------------

    function get automationWriteModeIndex():int;

    //--------------------------------------------------------------------------
    // Methods
    //--------------------------------------------------------------------------

    /**
     * Toggles the transport's Play on/off.
     *
     * @see #isPlaying
     */
    function togglePlay():void;

    /**
     * TODO test in runtime
     * Stops the transport.
     *
     * @param reset
     * @see #isPlaying
     */
    function stop(reset:Boolean = false):void;

    /**
     * When the transport is stopped, calling this function starts transport playback,
     * otherwise the transport is first stopped and the playback is restarted from the
     * last play-start position.
     *
     * @see #isPlaying
     */
    function restart():void;

    /**
     * Toggles the arrangement record.
     */
    function toggleRecord():void;

    /**
     * Toggles the punch in.
     * Currently there is no BooleanValue for this, so toggling is the only option.
     */
    function togglePunchIn():void;

    /**
     * Toggles the punch out.
     * Currently there is no BooleanValue for this, so toggling is the only option.
     */
    function togglePunchOut():void;

    /**
     * Toggles the metronome click.
     */
    function toggleClick():void;

    /**
     * Taps the tempo.
     */
    function tapTempo():void;

    /**
     * Increments tempo by one, optionally increment by value or 1.
     *
     * @param value The value to increment the tempo.
     */
    function incTempo(value:Number = 1):void;

    /**
     * Decrements tempo by one, optionally decrement by value or 1.
     *
     * @param value The value to decrement the tempo.
     */
    function decTempo(value:Number = 1):void;

    /**
     * Sets the transport playback position to the given beat time value.
     *
     * @param value The new beat time.
     */
    function setPosition(value:Number):void;

    /**
     * Increase transport position by 1 or 0.01.
     *
     * @param fine
     */
    function incPosition(fine:Boolean = false):void;

    /**
     * Decrease transport position by 1 or 0.01.
     *
     * @param fine
     */
    function decPosition(fine:Boolean = false):void;

    /**
     * Toggles the arrangement auto write enabled.
     */
    function toggleAutoWrite():void;

    /**
     * Toggles the clip launcher auto write enabled.
     */
    function toggleAutoWriteLauncher():void;

    /**
     * Resets the automation override in Bitwig.
     */
    function resetAutomationOverride():void;

    /**
     * /position/{+,-} Small in-/decrease of play position
     * @param isLarge
     */
    function forward(isLarge:Boolean = false):void;

    /**
     * position/{++,--} Large in-/decrease of play position
     * @param isLarge
     */
    function rewind(isLarge:Boolean = false):void;
}
}
