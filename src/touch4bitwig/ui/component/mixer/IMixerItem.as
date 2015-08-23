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

package touch4bitwig.ui.component.mixer
{

public interface IMixerItem
{

    function get index():int;

    function set index(value:int):void;

    function get exists():Boolean;

    function set exists(value:Boolean):void;

    function get canHoldNotes():Boolean;

    function set canHoldNotes(value:Boolean):void;

    function get selected():Boolean;

    function set selected(value:Boolean):void;

    function get trackName():String;

    function set trackName(value:String):void;

    function get trackColor():uint;

    function set trackColor(value:uint):void;

    function get volume():Number;

    function set volume(value:Number):void;

    function get volumeString():String;

    function set volumeString(value:String):void;

    function get vu():Number;

    function set vu(value:Number):void;

    function get pan():Number;

    function set pan(value:Number):void;

    function get panString():String;

    function set panString(value:String):void;

    function get isRecArm():Boolean;

    function set isRecArm(value:Boolean):void;

    function get isSolo():Boolean;

    function set isSolo(value:Boolean):void;

    function get isMute():Boolean;

    function set isMute(value:Boolean):void;
}
}
