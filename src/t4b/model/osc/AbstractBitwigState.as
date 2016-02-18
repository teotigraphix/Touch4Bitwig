////////////////////////////////////////////////////////////////////////////////
// Copyright 2016 Michael Schmalle - Teoti Graphix, LLC
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
package t4b.model.osc
{

import com.teotigraphix.frameworks.osc.OSCMessage;

import org.as3commons.lang.IllegalStateError;

import t4b.service.OSCService;

public class AbstractBitwigState implements IBitwigState
{
    //--------------------------------------------------------------------------
    // Private :: Variables
    //--------------------------------------------------------------------------

    protected var _methods:Array = [];
    private var _service:OSCService;
    private var _flush:Boolean = false;

    //--------------------------------------------------------------------------
    // Protected:: Properties
    //--------------------------------------------------------------------------

    protected function get service():OSCService
    {
        return _service;
    }

    //--------------------------------------------------------------------------
    // Constructor
    //--------------------------------------------------------------------------

    public function AbstractBitwigState(service:OSCService)
    {
        _service = service;
    }

    //--------------------------------------------------------------------------
    // API :: Methods
    //--------------------------------------------------------------------------
    /**
     * @inheritDoc
     */
    public function isHandled(osc:OSCMessage):Boolean
    {
        return _methods[osc.address] != null;
    }

    /**
     * @inheritDoc
     */
    public function handle(osc:OSCMessage):void
    {
        _methods[osc.address](osc);
    }

    /**
     * @inheritDoc
     */
    public function configure():void
    {
        throw new IllegalStateError("Abstract method configure()");
    }

    /**
     * @inheritDoc
     */
    public function dispose():void
    {
        throw new IllegalStateError("Abstract method dispose()");
    }

    //--------------------------------------------------------------------------
    // Protected :: Methods
    //--------------------------------------------------------------------------

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
