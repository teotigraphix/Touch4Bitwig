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

import touch4bitwig.event.PanelModelEventType;
import touch4bitwig.service.IOSCService;

public class Panes extends AbstractBitwigState
{
    private var _noteEditorVisible:Boolean;
    private var _automationEditorVisible:Boolean;
    private var _devicesVisible:Boolean;
    private var _mixerVisible:Boolean;
    private var _fullscreenVisible:Boolean;

    public function get noteEditorVisible():Boolean
    {
        return _noteEditorVisible;
    }

    public function set noteEditorVisible(value:Boolean):void
    {
        if (isSame(_noteEditorVisible, value))
            return;
        _noteEditorVisible = value;
        dispatchValue(PanelModelEventType.PANEL_NOTE_EDITOR_VISIBLE_CHANGE, _noteEditorVisible);
    }

    public function get automationEditorVisible():Boolean
    {
        return _automationEditorVisible;
    }

    public function set automationEditorVisible(value:Boolean):void
    {
        if (isSame(_automationEditorVisible, value))
            return;
        _automationEditorVisible = value;
        dispatchValue(PanelModelEventType.PANEL_AUTOMATION_EDITOR_VISIBLE_CHANGE, _automationEditorVisible);
    }

    public function get devicesVisible():Boolean
    {
        return _devicesVisible;
    }

    public function set devicesVisible(value:Boolean):void
    {
        if (isSame(_devicesVisible, value))
            return;
        _devicesVisible = value;
        dispatchValue(PanelModelEventType.PANEL_DEVICES_VISIBLE_CHANGE, _devicesVisible);
    }

    public function get mixerVisible():Boolean
    {
        return _mixerVisible;
    }

    public function set mixerVisible(value:Boolean):void
    {
        if (isSame(_mixerVisible, value))
            return;
        _mixerVisible = value;
        dispatchValue(PanelModelEventType.PANEL_MIXER_VISIBLE_CHANGE, _mixerVisible);
    }

    public function get fullscreenVisible():Boolean
    {
        return _fullscreenVisible;
    }

    public function set fullscreenVisible(value:Boolean):void
    {
        if (isSame(_fullscreenVisible, value))
            return;
        _fullscreenVisible = value;
        dispatchValue(PanelModelEventType.PANEL_FULL_SCREEN_VISIBLE_CHANGE, _fullscreenVisible);
    }

    public function Panes(service:IOSCService)
    {
        super(service);
    }
}
}
