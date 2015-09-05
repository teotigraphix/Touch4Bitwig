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

package touch4bitwig.ui.component.panel
{

import com.teotigraphix.ui.theme.AssetMap;

import feathers.controls.Button;
import feathers.data.ListCollection;

import starling.events.Event;

import touch4bitwig.event.ApplicationModelEventType;
import touch4bitwig.model.state.Application;
import touch4bitwig.ui.AbstractUIMediator;

public class PanelToggleGroupMediator extends AbstractUIMediator
{
    private var view:PanelToggleGroup;

    private var _arrangeDataProvider:ListCollection;
    private var _mixDataProvider:ListCollection;
    private var _editDataProvider:ListCollection;

    public function PanelToggleGroupMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();
        addContextListener(ApplicationModelEventType.PANEL_LAYOUT_CHANGE, context_panelLayoutChange);
        addViewListener(Event.TRIGGERED, view_triggeredHandler);
    }

    override public function onRegister():void
    {
        super.onRegister();

        // Toggles;      NoteEditor, Automation, Device, Mixer, Browser, Inspector

        // Arrange;      Notes, Automation, Device, Mixer
        // Mix;          Notes, Automation, Device
        // Edit;         Device, Mixer

        _arrangeDataProvider = new ListCollection([
            {
                label: "NoteEditor",
                defaultIcon: AssetMap.createImage("icon-note-editor-up-skin")
                //defaultSelectedIcon:AssetMap.createImage("icon-note-editor-selected-skin")
            },
            {
                label: "Automation",
                defaultIcon: AssetMap.createImage("icon-automation-editor-up-skin")
                //defaultSelectedIcon:AssetMap.createImage("icon-automation-editor-selected-skin")
            },
            {
                label: "Device",
                defaultIcon: AssetMap.createImage("icon-device-editor-up-skin")
                //defaultSelectedIcon:AssetMap.createImage("icon-device-editor-selected-skin")
            },
            {
                label: "Mixer",
                defaultIcon: AssetMap.createImage("icon-mixer-editor-up-skin")
                //defaultSelectedIcon:AssetMap.createImage("icon-mixer-editor-selected-skin")
            },
            {
                label: "FullScreen",
                defaultIcon: AssetMap.createImage("icon-full-screen-up-skin")
                //defaultSelectedIcon:AssetMap.createImage("icon-full-screen-selected-skin")
            }
        ]);

        _mixDataProvider = new ListCollection([
            {
                label: "NoteEditor",
                defaultIcon: AssetMap.createImage("icon-note-editor-up-skin")
                //defaultSelectedIcon:AssetMap.createImage("icon-note-editor-selected-skin")
            },
            {
                label: "Automation",
                defaultIcon: AssetMap.createImage("icon-automation-editor-up-skin")
                //defaultSelectedIcon:AssetMap.createImage("icon-automation-editor-selected-skin")
            },
            {
                label: "Device",
                defaultIcon: AssetMap.createImage("icon-device-editor-up-skin")
                //defaultSelectedIcon:AssetMap.createImage("icon-device-editor-selected-skin")
            },
            {
                label: "FullScreen",
                defaultIcon: AssetMap.createImage("icon-full-screen-up-skin")
                // defaultSelectedIcon:AssetMap.createImage("icon-full-screen-selected-skin")
            }
        ]);

        _editDataProvider = new ListCollection([
            {
                label: "Device",
                defaultIcon: AssetMap.createImage("icon-device-editor-up-skin")
                //defaultSelectedIcon:AssetMap.createImage("icon-device-editor-selected-skin")
            },
            {
                label: "Mixer",
                defaultIcon: AssetMap.createImage("icon-mixer-editor-up-skin")
                //defaultSelectedIcon:AssetMap.createImage("icon-mixer-editor-selected-skin")
            },
            {
                label: "FullScreen",
                defaultIcon: AssetMap.createImage("icon-full-screen-up-skin")
                //defaultSelectedIcon:AssetMap.createImage("icon-full-screen-selected-skin")
            }
        ]);

        view.buttonFactory = buttonFactory;

        context_panelLayoutChange(null, {value: oscModel.application.layout})
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    override public function setViewComponent(viewComponent:Object):void
    {
        super.setViewComponent(viewComponent);
        view = PanelToggleGroup(viewComponent);
    }

    override public function preRemove():void
    {
        super.preRemove();
        view = null;
    }

    private function buttonFactory():Button
    {
        var button:Button = new Button();
        button.iconPosition = Button.ICON_POSITION_TOP;
        return button;
    }

    private function view_triggeredHandler(event:Event, data:Object):void
    {
        switch (data.label)
        {
            case "NoteEditor" :
                oscService.send("/panel/noteEditor");
                break;
            case "Automation" :
                oscService.send("/panel/automationEditor");
                break;
            case "Device" :
                oscService.send("/panel/devices");
                break;
            case "Mixer" :
                oscService.send("/panel/mixer");
                break;
            case "FullScreen" :
                oscService.send("/panel/fullscreen");
                break;
        }
    }

    private function context_panelLayoutChange(event:Event, data:Object):void
    {
        switch (data.value)
        {
            case Application.LAYOUT_ARRANGE :
                view.dataProvider = _arrangeDataProvider;
                break;

            case Application.LAYOUT_MIX :
                view.dataProvider = _mixDataProvider;
                break;

            case Application.LAYOUT_EDIT :
                view.dataProvider = _editDataProvider;
                break;
        }
    }

}
}
