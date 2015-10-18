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

package touch4bitwig.service.support.osc.listeners
{

import com.teotigraphix.frameworks.osc.OSCMessage;

import touch4bitwig.service.IBitwigStateListener;
import touch4bitwig.service.IOSCService;

// TODO once all subclasses are moved into the state classes, remove this class
public class AbstractOSCListener implements IBitwigStateListener
{
    protected var _methods:Array = [];

    private var _service:IOSCService;

    public function AbstractOSCListener(service:IOSCService)
    {
        _service = service;
    }

    public function isHandled(osc:OSCMessage):Boolean
    {
        return _methods[osc.address] != null;
    }

    public function handle(osc:OSCMessage):void
    {
        _methods[osc.address](osc);
    }

    public function configure():void
    {
    }

    public function dispose():void
    {
    }
}
}
