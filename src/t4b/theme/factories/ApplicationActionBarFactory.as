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
package t4b.theme.factories
{

import com.teotigraphix.ui.theme.AbstractTheme;
import com.teotigraphix.ui.theme.AbstractThemeFactory;

import feathers.controls.Button;
import feathers.controls.ToggleButton;
import feathers.layout.HorizontalLayout;

import t4b.theme.SkinNames;
import t4b.theme.StyleNames;
import t4b.view.ui.main.ApplicationActionBar;

public class ApplicationActionBarFactory extends AbstractThemeFactory
{
    public static const STYLE_PLAY_BUTTON:String = "play-button";

    public function ApplicationActionBarFactory(theme:AbstractTheme)
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

        setStyle(ApplicationActionBar, setStyles);
        
        setStyle(Button, set_logoStyle, StyleNames.LOGO_BUTTON);
        
        setStyle(ToggleButton, set_actionsButtonStyle, StyleNames.ACTIONS_BUTTON);
    }

    private function set_actionsButtonStyle(button:ToggleButton):void
    {
        button.hasLabelTextRenderer = false;
        button.stateToSkinFunction = null;
        button.defaultIcon = createScaledImage("actions-up-icon");
        button.defaultSelectedIcon = createScaledImage("actions-selected-icon");
    }
    
    private function set_toolbarButtonStyle(button:ToggleButton):void
    {
        button.hasLabelTextRenderer = false;
        button.stateToSkinFunction = null;
        //button.defaultIcon = createScaledImage(SkinNames.ACTION_TOOLBAR_UP_ICON);
        //button.defaultSelectedIcon = createScaledImage(SkinNames.ACTION_TOOLBAR_SELECTED_ICON);
    }

    private function set_logoStyle(button:Button):void
    {
        button.hasLabelTextRenderer = false;
        button.stateToSkinFunction = null;
        button.defaultIcon = createImage(SkinNames.LOGO_60);
    }
    
    private function setStyles(actionBar:ApplicationActionBar):void
    {
        actionBar.backgroundSkin = create9ScaleImage("application-header-skin", 5, 5, 50, 50);
        var hl:HorizontalLayout = actionBar.layout as HorizontalLayout;
        //header.verticalAlign = HorizontalLayout.VERTICAL_ALIGN_MIDDLE;
        hl.padding = dp(8);
        hl.gap = dp(16);
    }
}
}
