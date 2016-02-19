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

package t4b.theme.factories
{

import com.teotigraphix.ui.theme.AbstractTheme;
import com.teotigraphix.ui.theme.AbstractThemeFactory;
import com.teotigraphix.ui.theme.AssetMap;

import feathers.controls.Button;
import feathers.controls.ToggleButton;

import t4b.theme.StyleNames;

public class TransportBarFactory extends AbstractThemeFactory
{

    public function TransportBarFactory(theme:AbstractTheme)
    {
        super(theme);
    }

    override public function initializeStyleProviders():void
    {
        super.initializeStyleProviders();

        setStyle(Button, setStopStyles, StyleNames.TRANSPORT_BAR_STOP_BUTTON);
        setStyle(ToggleButton, setPlayStyles, StyleNames.TRANSPORT_BAR_PLAY_BUTTON);
        setStyle(ToggleButton, setRecordStyles, StyleNames.TRANSPORT_BAR_RECORD_BUTTON);
        setStyle(ToggleButton, setAutomationStyles, StyleNames.TRANSPORT_BAR_AUTOMATION_BUTTON);
        setStyle(ToggleButton, setTransportBarPopUpButtonStyles, StyleNames.TRANSPORT_BAR_POPUP_BUTTON);
    }

    private function setStopStyles(button:Button):void
    {
        theme.button.setButtonStyles(button);
        button.stateToSkinFunction = null;
        button.defaultIcon = AssetMap.createImage("bitwig/stop-button-icon-skin");
        button.defaultIcon.width = 20;
        button.defaultIcon.height = 20;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.downSkin = AssetMap.create9ScaleImage("button-down-skin", 5, 5, 50, 50);
        button.minWidth = 75;
        //button.setSize(50, 50);
    }

    private function setPlayStyles(button:ToggleButton):void
    {
        theme.button.setButtonStyles(button);
        button.stateToSkinFunction = null;
        button.defaultIcon = AssetMap.createImage("bitwig/play-button-icon-skin");
        button.defaultSelectedIcon = AssetMap.createImage("bitwig/play-button-icon-selected-skin");
        button.defaultIcon.width = 20;
        button.defaultIcon.height = 20;
        button.defaultSelectedIcon.width = 20;
        button.defaultSelectedIcon.height = 20;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("button-selected-up-skin", 5, 5, 50, 50);
        button.minWidth = 75;
        //button.setSize(50, 50);
    }

    private function setRecordStyles(button:ToggleButton):void
    {
        theme.button.setButtonStyles(button);
        button.stateToSkinFunction = null;
        button.defaultIcon = AssetMap.createImage("bitwig/record-button-icon-skin");
        button.defaultSelectedIcon = AssetMap.createImage("bitwig/record-button-icon-selected-skin");
        button.defaultIcon.width = 20;
        button.defaultIcon.height = 20;
        button.defaultSelectedIcon.width = 20;
        button.defaultSelectedIcon.height = 20;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("bitwig/recarm-button-selected-up-skin", 5, 5, 50, 50);
        button.minWidth = 75;
        //button.setSize(50, 50);
    }

    private function setAutomationStyles(button:ToggleButton):void
    {
        theme.button.setButtonStyles(button);
        button.stateToSkinFunction = null;
        button.defaultIcon = AssetMap.createImage("bitwig/automation-button-icon-skin");
        button.defaultSelectedIcon = AssetMap.createImage("bitwig/automation-button-icon-selected-skin");
        button.defaultIcon.width = 20;
        button.defaultIcon.height = 20;
        button.defaultSelectedIcon.width = 20;
        button.defaultSelectedIcon.height = 20;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("bitwig/recarm-button-selected-up-skin", 5, 5, 50, 50);
        button.minWidth = 75;
        //button.setSize(50, 50);
    }

    private function setTransportBarPopUpButtonStyles(button:ToggleButton):void
    {
        theme.button.setButtonStyles(button);
        button.defaultIcon = AssetMap.createImage("bitwig/transport-bar-popup-button-icon-skin");
        button.width = AssetMap.size(50);
        button.hasLabelTextRenderer = false;
        button.minWidth = 75;
    }
}
}