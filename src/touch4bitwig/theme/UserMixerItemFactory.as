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

import com.teotigraphix.ui.theme.AbstractTheme;
import com.teotigraphix.ui.theme.AbstractThemeFactory;
import com.teotigraphix.ui.theme.AssetMap;

import feathers.controls.ProgressBar;

import touch4bitwig.ui.component.mixer.MixerItem;

public class UserMixerItemFactory extends AbstractThemeFactory
{

    public function UserMixerItemFactory(theme:AbstractTheme)
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

        setStyle(MixerItem, setMixerItemStyles);

        setStyle(ProgressBar, setVUBarStyles, "mixer-item-vu-bar");
    }

    private function setMixerItemStyles(item:MixerItem):void
    {
        item.backgroundNormalSkin = AssetMap.create9ScaleImage("mixer-item-background-skin", 5, 5, 22, 22);
        item.backgroundSelectedSkin = AssetMap.create9ScaleImage("mixer-item-background-selected-skin", 5, 5, 22, 22);
    }

    //----------------------------------
    // vu-bar
    //----------------------------------

    private function setVUBarStyles(bar:ProgressBar):void
    {
        bar.backgroundSkin = AssetMap.create9ScaleImage("background-skin", 5, 5, 22, 22);
        bar.fillSkin = AssetMap.createImage("vu-slider-min-skin");
        bar.fillSkin.height = 0;
        bar.direction = ProgressBar.DIRECTION_VERTICAL;
        bar.width = AssetMap.getSize(5);
        bar.minimum = 0;
        bar.maximum = 127;
        bar.value = 0;
    }
}
}
