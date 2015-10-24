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

import touch4bitwig.model.state.BitwigScene;
import touch4bitwig.model.state.BitwigTrack;

public interface IBitwigTrackBank extends IBitwigState
{
    //--------------------------------------------------------------------------
    // Properties
    //--------------------------------------------------------------------------

    /**
     * The length of the track bank, how many tracks are contained in the bank.
     */
    function get length():int;

    function get canScrollTracksUp():Boolean;

    function get canScrollTracksDown():Boolean;

    function get selectedTrack():BitwigTrack;

    function get scenes():Vector.<BitwigScene>;

    //--------------------------------------------------------------------------
    // Methods
    //--------------------------------------------------------------------------

    /**
     * Returns the track within the track bank.
     *
     * @param index The track bank index (1..trackBank.length).
     */
    function getTrack(index:int):IBitwigTrack;

    /**
     * Scrolls the track bank by 1 previous.
     *
     * <p>Message: <code>/track/bank/-</code></p>
     */
    function scrollTracksUp():void;

    /**
     * Scrolls the track bank by 1 next.
     *
     * <p>Message: <code>/track/bank/+</code></p>
     */
    function scrollTracksDown():void;

    /**
     * Scrolls the track bank by 1 page (length) previous.
     *
     * <p>Message: <code>/track/bank/page/-</code></p>
     */
    function scrollTracksPageUp():void;

    /**
     * Scrolls the track bank by 1 page (length) next.
     *
     * <p>Message: <code>/track/bank/page/+</code></p>
     */
    function scrollTracksPageDown():void;

    /**
     * Scrolls to the previous track in the track bank, if the previous track is 1,
     * the selected track becomes track length in the track bank.
     *
     * <p>Message: <code>/track/-</code></p>
     */
    function scrollTrackUp():void;

    /**
     * Scrolls to the next track in the track bank, if the next track is length,
     * the selected track becomes track 1 in the track bank.
     *
     * <p>Message: <code>/track/+</code></p>
     */
    function scrollTrackDown():void;

    // TODO [OSC] Need isVUEnabled sent from script to maintain state
    /**
     * Toggles whether VU messages are sent from Bitwig.
     *
     * <p>Message: <code>/track/vu {0,1}</code></p>
     *
     * @param enabled Whether vu messages are sent from Bitwig.
     */
    function enableVUs(enabled:Boolean):void;

    // TODO [OSC] Need currentBank (Instrument,Effect) sent from script to maintain state
    /**
     * Toggles whether the current track bank is Audio/Instrument or Effect.
     *
     * <p>Message: <code>/track/toggleBank</code></p>
     *
     * @param enabled Whether vu messages are sent from Bitwig.
     */
    function toggleBank():void;

    /**
     * Adds an audio track.
     *
     * <p>Message: <code>/track/add/audio</code></p>
     */
    function addAudioTrack():void;

    /**
     * Adds an instrument track.
     *
     * <p>Message: <code>/track/add/instrument</code></p>
     */
    function addInstrumentTrack():void;

    /**
     * Adds an effect track.
     *
     * <p>Message: <code>/track/add/effect</code></p>
     */
    function addEffectTrack():void;

    ///**
    // * Toggles track activation.
    // *
    // * <p>Message: <code>/track/{1-length}/activated {0,1}</code></p>
    // *
    // * @param index The track bank index.
    // * @param activated Whether the track is activated.
    // */
    //function activate(index:int, activated:Boolean):void;

    /**
     * Selects a child track of the bank.
     *
     * <p>Message: <code>/track/{1-8}/select</code></p>
     *
     * @param index The track bank index (1..length).
     */
    function select(index:int):void;
    //
    ///**
    // * Sets the volume of the track.
    // *
    // * <p>Message: <code>/track/{1-8}/volume {0-127}</code></p>
    // *
    // * @param index The track bank index (1..length).
    // * @param value The track volume (0..127).
    // */
    //function setVolume(index:int, value:Number):void;
    //
    ///**
    // * Toggles the track volume indication.
    // *
    // * @param index The track bank index (1..length).
    // * @param indicated
    // */
    //function setVolumeIndication(index:int, indicated:Boolean):void;

    /**
     * Selects a child track layer/group of the bank and enters the layer/group.
     *
     * @param index The track bank index (0..bankLength).
     */
    function selectChildren(index:int):void;

    /**
     * Selects the parent track bank of the selected track.
     */
    function selectParent():void;

    function scrollScenesUp():void;

    function scrollScenesDown():void;

    //
    /**
     * Queues all clips in the track bank to stop.
     */
    function stop():void;


    /**
     * Returns the entire track bank back to arrangement sequencing.
     */
    function returnToArrangement():void;


}
}
