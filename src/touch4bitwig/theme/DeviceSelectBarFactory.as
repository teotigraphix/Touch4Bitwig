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
import feathers.controls.Label;
import feathers.layout.HorizontalLayout;
import feathers.layout.HorizontalLayoutData;
import feathers.layout.VerticalLayout;

import touch4bitwig.ui.component.device.DeviceSelectBar;

public class DeviceSelectBarFactory extends AbstractThemeFactory
{

    public function DeviceSelectBarFactory(theme:AbstractTheme)
    {
        super(theme);
    }

    override public function initializeTextures():void
    {
        super.initializeTextures();
    }

    override public function initializeStyleProviders():void
    {
        super.initializeStyleProviders();

        setStyle(DeviceSelectBar, setDeviceSelectBarStyles);

        setStyle(DeviceSelectBar, setDeviceSelectBarStyles);

        setStyle(Button, setRightButtonStyles, "device-select-bar-right-button");
        setStyle(Button, setLeftButtonStyles, "device-select-bar-left-button");

        setStyle(Label, setNameLabelStyles, "device-select-bar-name-label");

        setStyle(UIToggleButton, setBypassButtonStyles, "device-select-bar-bypass-button");
        setStyle(UIToggleButton, setExpandButtonStyles, "device-select-bar-expand-button");

        setStyle(UIToggleButton, setWindowButtonStyles, "device-select-bar-window-button");

        setStyle(UIToggleButton, setBrowserButtonStyles, "device-select-bar-browser-button");
        setStyle(UIToggleButton, setMacroPageButtonStyles, "device-select-bar-macro-page-button");
    }

    private function setDeviceSelectBarStyles(bar:DeviceSelectBar):void
    {
        var l:VerticalLayout = bar.layout as VerticalLayout;
        l.gap = AssetMap.size(4);
        l.padding = AssetMap.size(6);
    }

    private function setRightButtonStyles(button:Button):void
    {
        theme.button.setButtonStyles(button);
        button.layoutData = new HorizontalLayoutData(NaN, 100);
        button.minWidth = AssetMap.size(75);
        button.defaultIcon = AssetMap.createImage("device-select-bar-right-button-icon-skin");
    }

    private function setLeftButtonStyles(button:Button):void
    {
        theme.button.setButtonStyles(button);
        button.layoutData = new HorizontalLayoutData(NaN, 100);
        button.minWidth = AssetMap.size(75);
        button.defaultIcon = AssetMap.createImage("device-select-bar-left-button-icon-skin");
    }

    private function setNameLabelStyles(label:Label):void
    {
        label.textRendererProperties.elementFormat = theme.fonts.largeUILightElementFormat;
        label.textRendererProperties.disabledElementFormat = theme.fonts.largeUILightDisabledElementFormat;
    }

    private function setBrowserButtonStyles(button:UIToggleButton):void
    {
        theme.button.setButtonStyles(button);

        button.isQuickHitAreaEnabled = true;
        button.hasLabelTextRenderer = false;

        button.minTouchHeight = AssetMap.size(40);
        button.stateToSkinFunction = null;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.disabledSkin = AssetMap.create9ScaleImage("button-disabled-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("panels-button-selected-skin", 5, 5, 50, 50);
        button.defaultIcon = AssetMap.createImage("device-browser-icon-up-skin");
        button.defaultSelectedIcon = AssetMap.createImage("device-browser-icon-selected-skin");
    }

    private function setMacroPageButtonStyles(button:UIToggleButton):void
    {
        theme.button.setButtonStyles(button);
        button.isQuickHitAreaEnabled = true;
        button.hasLabelTextRenderer = false;
        button.minTouchHeight = AssetMap.size(40);
        button.stateToSkinFunction = null;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.disabledSkin = AssetMap.create9ScaleImage("button-disabled-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("panels-button-selected-skin", 5, 5, 50, 50);
        button.defaultIcon = AssetMap.createImage("device-macro-page-icon-up-skin");
        button.defaultSelectedIcon = AssetMap.createImage("device-macro-page-icon-selected-skin");
    }

    private function setExpandButtonStyles(button:UIToggleButton):void
    {
        theme.button.setButtonStyles(button);
        button.isQuickHitAreaEnabled = true;
        button.hasLabelTextRenderer = false;
        //button.maxHeight = AssetMap.size(40);
        button.minTouchHeight = AssetMap.size(40);
        button.stateToSkinFunction = null;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.disabledSkin = AssetMap.create9ScaleImage("button-disabled-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("panels-button-selected-skin", 5, 5, 50, 50);
        button.defaultIcon = AssetMap.createImage("device-expand-icon-up-skin");
        button.defaultSelectedIcon = AssetMap.createImage("device-expand-icon-selected-skin");
    }

    private function setBypassButtonStyles(button:UIToggleButton):void
    {
        theme.button.setButtonStyles(button);
        button.isQuickHitAreaEnabled = true;
        button.hasLabelTextRenderer = false;
        //button.maxHeight = AssetMap.size(40);
        button.minTouchHeight = AssetMap.size(40);
        button.stateToSkinFunction = null;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.disabledSkin = AssetMap.create9ScaleImage("button-disabled-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("button-selected-up-skin", 5, 5, 50, 50);
        button.defaultIcon = AssetMap.createImage("bitwig-icon-skin");
        button.defaultSelectedIcon = AssetMap.createImage("bitwig-icon-selected-skin");
    }

    private function setWindowButtonStyles(button:UIToggleButton):void
    {
        theme.button.setButtonStyles(button);
        button.isQuickHitAreaEnabled = true;
        button.hasLabelTextRenderer = false;
        //button.maxHeight = AssetMap.size(40);
        button.minTouchHeight = AssetMap.size(40);
        button.stateToSkinFunction = null;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.disabledSkin = AssetMap.create9ScaleImage("button-disabled-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("panels-button-selected-skin", 5, 5, 50, 50);
        button.defaultIcon = AssetMap.createImage("device-window-icon-up-skin");
        button.defaultSelectedIcon = AssetMap.createImage("device-window-icon-selected-skin");
    }
}
}
