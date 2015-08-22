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

import touch4bitwig.event.DeviceModelEventType;
import touch4bitwig.service.IOSCService;

public class DeviceParam extends AbstractBitwigState
{
    private var _index:int;

    private var _map:Object = {};

    private var _paramName:String;
    private var _paramValue:int;
    private var _paramValueString:String;

    public function get index():int
    {
        return _index;
    }

    public function DeviceParam(service:IOSCService, index:int)
    {
        super(service);
        _index = index;

        _map["param"] = {};
        _map["common"] = {};
        _map["envelope"] = {};
        _map["macro"] = {};
        _map["modulation"] = {};
    }

    public function getValueString(mode:String):String
    {
        return _map[mode]["valueString"];
    }

    public function getValue(mode:String):int
    {
        return _map[mode]["value"];
    }

    public function getName(mode:String):String
    {
        return _map[mode]["name"];
    }

    public function setName(mode:String, value:String):void
    {
        _map[mode]["name"] = value;
        dispatch(DeviceModelEventType.PARAM_NAME_CHANGE, {index: _index, mode: mode, value: value});
    }

    public function setValue(mode:String, value:int):void
    {
        _map[mode]["value"] = value;
        dispatch(DeviceModelEventType.PARAM_VALUE_CHANGE, {index: _index, mode: mode, value: value});
    }

    public function setValueString(mode:String, value:String):void
    {
        _map[mode]["valueString"] = value;
        dispatch(DeviceModelEventType.PARAM_VALUE_STRING_CHANGE, {index: _index, mode: mode, value: value});
    }
}
}
