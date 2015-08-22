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

public class Scene extends AbstractBitwigState
{
    private var _index:int;
    private var _name:String;

    public function get index():int
    {
        return _index;
    }

    public function set index(value:int):void
    {
        _index = value;
    }

    public function get name():String
    {
        return "Scene " + _index; //_name;
    }

    public function set name(value:String):void
    {
        _name = value;
    }

    public function Scene(index:int, service:IOSCService)
    {
        super(service);
        _index = index;
    }

    public function launch():void
    {
        service.send("/scene/" + index + "/launch");
    }
}
}
