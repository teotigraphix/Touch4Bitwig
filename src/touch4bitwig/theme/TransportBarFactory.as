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

package touch4bitwig.theme
{

import com.teotigraphix.ui.component.UIToggleButton;
import com.teotigraphix.ui.theme.AbstractTheme;
import com.teotigraphix.ui.theme.AbstractThemeFactory;
import com.teotigraphix.ui.theme.AssetMap;

import feathers.controls.Button;

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
        setStyle(UIToggleButton, setPlayStyles, StyleNames.TRANSPORT_BAR_PLAY_BUTTON);
        setStyle(UIToggleButton, setRecordStyles, StyleNames.TRANSPORT_BAR_RECORD_BUTTON);
        setStyle(UIToggleButton, setAutomationStyles, StyleNames.TRANSPORT_BAR_AUTOMATION_BUTTON);
        setStyle(UIToggleButton, setTransportBarPopUpButtonStyles, StyleNames.TRANSPORT_BAR_POPUP_BUTTON);
    }

    private function setStopStyles(button:Button):void
    {
        theme.buttons.setButtonStyles(button);
        button.stateToSkinFunction = null;
        button.defaultIcon = AssetMap.createImage("stop-button-icon-skin");
        button.defaultIcon.width = 20;
        button.defaultIcon.height = 20;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.downSkin = AssetMap.create9ScaleImage("button-down-skin", 5, 5, 50, 50);
        button.minWidth = 75;
        //button.setSize(50, 50);
    }

    private function setPlayStyles(button:UIToggleButton):void
    {
        theme.buttons.setButtonStyles(button);
        button.stateToSkinFunction = null;
        button.defaultIcon = AssetMap.createImage("play-button-icon-skin");
        button.defaultSelectedIcon = AssetMap.createImage("play-button-icon-selected-skin");
        button.defaultIcon.width = 20;
        button.defaultIcon.height = 20;
        button.defaultSelectedIcon.width = 20;
        button.defaultSelectedIcon.height = 20;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("button-selected-up-skin", 5, 5, 50, 50);
        button.minWidth = 75;
        //button.setSize(50, 50);
    }

    private function setRecordStyles(button:UIToggleButton):void
    {
        theme.buttons.setButtonStyles(button);
        button.stateToSkinFunction = null;
        button.defaultIcon = AssetMap.createImage("record-button-icon-skin");
        button.defaultSelectedIcon = AssetMap.createImage("record-button-icon-selected-skin");
        button.defaultIcon.width = 20;
        button.defaultIcon.height = 20;
        button.defaultSelectedIcon.width = 20;
        button.defaultSelectedIcon.height = 20;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("recarm-button-selected-up-skin", 5, 5, 50, 50);
        button.minWidth = 75;
        //button.setSize(50, 50);
    }

    private function setAutomationStyles(button:UIToggleButton):void
    {
        theme.buttons.setButtonStyles(button);
        button.stateToSkinFunction = null;
        button.defaultIcon = AssetMap.createImage("automation-button-icon-skin");
        button.defaultSelectedIcon = AssetMap.createImage("automation-button-icon-selected-skin");
        button.defaultIcon.width = 20;
        button.defaultIcon.height = 20;
        button.defaultSelectedIcon.width = 20;
        button.defaultSelectedIcon.height = 20;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("recarm-button-selected-up-skin", 5, 5, 50, 50);
        button.minWidth = 75;
        //button.setSize(50, 50);
    }

    private function setTransportBarPopUpButtonStyles(button:UIToggleButton):void
    {
        theme.buttons.setButtonStyles(button);
        button.defaultIcon = AssetMap.createImage("transport-bar-popup-button-icon-skin");
        button.width = AssetMap.getSize(50);
        button.hasLabelTextRenderer = false;
        button.minWidth = 75;
    }
}
}