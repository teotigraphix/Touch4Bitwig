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

package touch4bitwig.controller
{

import com.teotigraphix.service.ILogger;

import org.robotlegs.starling.mvcs.Actor;

import starling.events.EventDispatcher;

public class AbstractController extends Actor
{
    [Inject]
    public var logger:ILogger;

    [Inject]
    override public function set eventDispatcher(value:EventDispatcher):void
    {
        super.eventDispatcher = value;
        onRegister();
    }

    public function AbstractController()
    {
    }

    protected function onRegister():void
    {
    }
}
}
