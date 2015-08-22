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

import touch4bitwig.event.ApplicationModelEventType;
import touch4bitwig.service.IOSCService;

public class Application extends AbstractBitwigState
{
    public static const LAYOUT_ARRANGE:String = "arrange";
    public static const LAYOUT_MIX:String = "mix";
    public static const LAYOUT_EDIT:String = "edit";

    private var _layout:String = null;
    private var _active:Boolean;

    public function get layout():String
    {
        return _layout;
    }

    public function set layout(value:String):void
    {
        if (isSame(_layout, value))
            return;
        _layout = value;
        dispatchValue(ApplicationModelEventType.PANEL_LAYOUT_CHANGE, _layout);
    }

    public function get active():Boolean
    {
        return _active;
    }

    public function set active(value:Boolean):void
    {
        if (isSame(_active, value))
            return;
        _active = value;
        dispatchValue(ApplicationModelEventType.ACTIVE_CHANGE, _active);
    }

    public function Application(service:IOSCService)
    {
        super(service);
    }
}
}
