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

import starling.events.Event;

import touch4bitwig.model.state.GlobalModel;

public interface IOSCService
{
    function send(message:String):void;

    function sendString(message:String, value:String):void;

    function sendInt(message:String, value:int):void;

    function sendBoolean(message:String, value:Boolean):void;

    function start(model:GlobalModel):void;

    function flush():void;

    function dispatchEventWith(type:String, bubbles:Boolean = false, data:Object = null):void;

    function dispatchEvent(event:Event):void;
}
}
