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

package touch4bitwig.service
{

import com.teotigraphix.frameworks.osc.IOSCListener;

import starling.events.Event;

public interface IOSCService
{
    function get isRunning():Boolean;

    function send(message:String):void;

    function sendString(message:String, value:String):void;

    function sendInt(message:String, value:int):void;

    function sendFloat(message:String, value:Number):void

    function sendBoolean(message:String, value:Boolean):void;

    /**
     * Refreshes all osc messages from the current Bitwig session model.
     */
    function refresh():void;

    function dispatchEventWith(type:String, bubbles:Boolean = false, data:Object = null):void;

    function addOSCListener(listener:IOSCListener):void;

    function removeOSCListener(listener:IOSCListener):void;

    function connect(inputIp:String, inputPort:int, outputIp:String, outputPort:int):Boolean;

    function close():void;

    function dispatchEvent(event:Event):void;
}
}
