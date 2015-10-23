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

import touch4bitwig.model.state.BitwigTrack;

public interface IBitwigClip
{
    //--------------------------------------------------------------------------
    // Properties
    //--------------------------------------------------------------------------

    //----------------------------------
    // index
    //----------------------------------

    function get index():int;

    //----------------------------------
    // track
    //----------------------------------

    /**
     * The parent track.
     */
    function get track():BitwigTrack;

    //----------------------------------
    // name
    //----------------------------------

    function get name():String;

    function set name(value:String):void;

    //----------------------------------
    // isSelected
    //----------------------------------

    function get isSelected():Boolean;

    function set isSelected(value:Boolean):void;

    //----------------------------------
    // hasContent
    //----------------------------------

    function get hasContent():Boolean;

    function set hasContent(value:Boolean):void;

    //----------------------------------
    // color
    //----------------------------------

    function get color():uint;

    function set color(value:uint):void;

    //----------------------------------
    // isPlaying
    //----------------------------------

    function get isPlaying():Boolean;

    function set isPlaying(value:Boolean):void;

    //----------------------------------
    // isRecording
    //----------------------------------

    function get isRecording():Boolean;

    function set isRecording(value:Boolean):void;

    //----------------------------------
    // isQueued
    //----------------------------------

    function get isQueued():Boolean;

    function set isQueued(value:Boolean):void;

    //--------------------------------------------------------------------------
    // Methods
    //--------------------------------------------------------------------------

    /**
     * Queues the clip for play.
     */
    function launch():void;

    /**
     * Queues the clip for recording.
     */
    function record():void;

    /**
     * Selects the clip in the Bitwig user interface.
     */
    function select():void;

    /**
     * Queues the clip for stop.
     */
    function stop():void;

    /**
     * Returns the sequencer to play arrangement clips.
     */
    function returnToArrangement():void;
}
}
