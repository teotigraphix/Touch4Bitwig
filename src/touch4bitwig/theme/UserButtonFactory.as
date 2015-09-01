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
import com.teotigraphix.ui.theme.AssetMap;
import com.teotigraphix.ui.theme.ButtonFactory;

import feathers.controls.Button;

public class UserButtonFactory extends ButtonFactory
{

    public function UserButtonFactory(theme:AbstractTheme)
    {
        super(theme);
    }

    override public function initializeStyleProviders():void
    {
        super.initializeStyleProviders();

        setStyle(UIToggleButton, setPanelsLayoutStyles, StyleNames.PANELS_LAYOUT_BUTTON);
        // TODO StyleNames.PANELS_BROWSER_BUTTON
        // TODO  StyleNames.PANELS_INSPECTOR_BUTTON

        setStyle(UIToggleButton, setPanelsStyles, "panels-button");

        setStyle(Button, setBackButtonStyles, StyleNames.BACK_BUTTON);
    }

    override public function setBaseButtonStyles(button:Button):void
    {
        super.setBaseButtonStyles(button);
        button.defaultLabelProperties.elementFormat = theme.fonts.lightUIElementFormat;
    }

    private function setPanelsLayoutStyles(button:UIToggleButton):void
    {
        theme.buttons.setButtonStyles(button);
        button.defaultLabelProperties.elementFormat = theme.fonts.largeUILightElementFormat;
    }

    private function setPanelsStyles(button:UIToggleButton):void
    {
        theme.buttons.setButtonStyles(button);
        button.stateToSkinFunction = null;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("panels-button-selected-skin", 5, 5, 50, 50);
    }

    private function setBackButtonStyles(button:Button):void
    {
        theme.buttons.setButtonStyles(button);
        button.defaultLabelProperties.elementFormat = theme.fonts.largeUILightElementFormat;
        button.label = "Back";
    }
}
}
