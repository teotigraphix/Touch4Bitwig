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
    function get trackName():String;

    function set trackName(value:String):void;

    function get trackColor():uint;

    function set trackColor(value:uint):void;

    function get panString():String;

    function set panString(value:String):void;

    function get panValue():Number;

    function set panValue(value:Number):void;

    function get volumeValue():Number;

    function set volumeValue(value:Number):void;

    function get volumeString():String;

    function set volumeString(value:String):void;

    function get vuValue():Number;

    function set vuValue(value:Number):void;

    function get isRecArm():Boolean;

    function set isRecArm(value:Boolean):void;

    function get isSolo():Boolean;

    function set isSolo(value:Boolean):void;

    function get isMute():Boolean;

    function set isMute(value:Boolean):void;
}
}
