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

import touch4bitwig.model.state.BitwigClip;

public interface IBitwigTrack extends IBitwigState
{
    //--------------------------------------------------------------------------
    // Properties
    //--------------------------------------------------------------------------

    function get index():int;

    /**
     * @inheritDoc
     */
    function get name():String;

    function set name(value:String):void;

    /**
     * @inheritDoc
     */
    function get exists():Boolean;

    function set exists(value:Boolean):void;

    /**
     * @inheritDoc
     */
    function get canHoldNotes():Boolean;

    function set canHoldNotes(value:Boolean):void;

    /**
     * @inheritDoc
     */
    function get activated():Boolean;

    function set activated(value:Boolean):void;

    /**
     * @inheritDoc
     */
    function get selected():Boolean;

    function set selected(value:Boolean):void;

    /**
     * @inheritDoc
     */
    function get volume():int;

    function set volume(value:int):void;

    /**
     * @inheritDoc
     */
    function get volumeString():String;

    function set volumeString(value:String):void;

    /**
     * @inheritDoc
     */
    function get pan():int;

    function set pan(value:int):void;

    /**
     * @inheritDoc
     */
    function get panString():String;

    function set panString(value:String):void;

    /**
     * @inheritDoc
     */
    function get mute():Boolean;

    function set mute(value:Boolean):void;

    /**
     * @inheritDoc
     */
    function get solo():Boolean;

    function set solo(value:Boolean):void;

    /**
     * @inheritDoc
     */
    function get recarm():Boolean;

    function set recarm(value:Boolean):void;

    /**
     * @inheritDoc
     */
    function get monitor():Boolean;

    function set monitor(value:Boolean):void;

    /**
     * @inheritDoc
     */
    function get autoMonitor():Boolean;

    function set autoMonitor(value:Boolean):void;

    /**
     * @inheritDoc
     */
    function get crossfadeMode():String;

    function set crossfadeMode(value:String):void;

    /**
     * @inheritDoc
     */
    function get vu():int;

    /**
     * @inheritDoc
     */
    function get color():int;

    function set color(value:int):void;

    //--------------------------------------------------------------------------
    // Methods
    //--------------------------------------------------------------------------

    function getClip(index:int):BitwigClip;

    /**
     * Queues the clip for stop.
     */
    function stop():void;

    /**
     * Returns the track back to arrangement sequencing.
     */
    function returnToArrangement():void;
}
}
