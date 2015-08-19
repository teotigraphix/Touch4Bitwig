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

package touch4bitwig.model.state
{

import touch4bitwig.service.IOSCService;

public class AbstractBitwigState
{
    private var _service:IOSCService;
    private var _flush:Boolean = false;

    public function get service():IOSCService
    {
        return _service;
    }

    public function AbstractBitwigState(service:IOSCService)
    {
        _service = service;
    }

    protected final function dispatch(type:String, value:Object):void
    {
        _service.dispatchEventWith(type, false, value);
    }

    protected final function dispatchValue(type:String, value:Object):void
    {
        _service.dispatchEventWith(type, false, {value: value});
    }

    protected final function isSame(current:Object, value:Object):Boolean
    {
        return (current == value || _flush);
    }

}
}
