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
import feathers.controls.ProgressBar;
import feathers.controls.Slider;
import feathers.skins.SmartDisplayObjectStateValueSelector;

import touch4bitwig.ui.component.mixer.MixerItem;

public class MixerItemFactory extends AbstractThemeFactory
{

    public function MixerItemFactory(theme:AbstractTheme)
    {
        super(theme);
    }

    override public function initializeStyleProviders():void
    {
        super.initializeStyleProviders();

        setStyle(MixerItem, setMixerItemStyles);

        setStyle(UIToggleButton, setRecArmStyles, StyleNames.MIXER_ITEM_RECARM_BUTTON);
        setStyle(UIToggleButton, setSoloStyles, StyleNames.MIXER_ITEM_SOLO_BUTTON);
        setStyle(UIToggleButton, setMuteStyles, StyleNames.MIXER_ITEM_MUTE_BUTTON);

        setStyle(ProgressBar, setVUBarStyles, StyleNames.MIXER_ITEM_VU_BAR);

        setStyle(Slider, setVolumeSliderStyles, StyleNames.MIXER_ITEM_VOLUME_SLIDER);
        setStyle(Button, setVolumeSliderThumbStyles, "mixer-item-volume-slider-thumb");
        setStyle(Button, setVolumeSliderMinStyles, "mixer-item-volume-slider-min");
        setStyle(Button, setVolumeSliderMaxStyles, "mixer-item-volume-slider-max");
    }

    private function setMixerItemStyles(item:MixerItem):void
    {
        item.backgroundNormalSkin = AssetMap.create9ScaleImage("mixer-item-background-skin", 5, 5, 22, 22);
        item.backgroundSelectedSkin = AssetMap.create9ScaleImage("mixer-item-background-selected-skin", 5, 5, 22, 22);
    }

    //----------------------------------
    // recarm, solo, mute
    //----------------------------------

    private function setRecArmStyles(button:UIToggleButton):void
    {
        theme.button.setButtonStyles(button);
        button.stateToSkinFunction = null;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("recarm-button-selected-up-skin", 5, 5, 50, 50);
        button.defaultSelectedLabelProperties.elementFormat = theme.fonts.darkUIElementFormat;
    }

    private function setSoloStyles(button:UIToggleButton):void
    {
        theme.button.setButtonStyles(button);
        button.stateToSkinFunction = null;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("solo-button-selected-up-skin", 5, 5, 50, 50);
        button.defaultSelectedLabelProperties.elementFormat = theme.fonts.darkUIElementFormat;
    }

    private function setMuteStyles(button:UIToggleButton):void
    {
        theme.button.setButtonStyles(button);
        button.stateToSkinFunction = null;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("mute-button-selected-up-skin", 5, 5, 50, 50);
        button.defaultSelectedLabelProperties.elementFormat = theme.fonts.darkUIElementFormat;
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
        bar.width = AssetMap.size(5);
        bar.minimum = 0;
        bar.maximum = 127;
        bar.value = 0;
    }

    //----------------------------------
    // volume-slider
    //----------------------------------

    private function setVolumeSliderStyles(slider:Slider):void
    {
        //slider.backgroundSkin = AssetMap.create9ScaleImage("background-skin", 5, 5, 22, 22);

        slider.trackLayoutMode = Slider.TRACK_LAYOUT_MODE_MIN_MAX;
        slider.trackScaleMode = Slider.TRACK_SCALE_MODE_EXACT_FIT;
        slider.customThumbStyleName = "volume-slider-thumb";
        slider.customMinimumTrackStyleName = "volume-slider-min";
        slider.customMaximumTrackStyleName = "volume-slider-max";
        slider.direction = Slider.DIRECTION_VERTICAL;
        slider.minimum = 0;
        slider.maximum = 127;
        slider.value = 80;
        slider.step = 1;
    }

    private function setVolumeSliderThumbStyles(thumb:Button):void
    {
        thumb.defaultSkin = AssetMap.createImage("volume-slider-thumb-skin");
        thumb.height = 5;
        thumb.minTouchHeight = 40;
        thumb.stateToSkinFunction = null;
        thumb.hasLabelTextRenderer = false;
    }

    private function setVolumeSliderMinStyles(track:Button):void
    {
        var skinSelector:SmartDisplayObjectStateValueSelector = new SmartDisplayObjectStateValueSelector();
        skinSelector.defaultValue = AssetMap.getScale9Textures("volume-slider-min-skin", 5, 5, 50, 50);
        skinSelector.setValueForState(theme.shared.backgroundDisabledSkinTextures, Button.STATE_DISABLED, false);
        skinSelector.displayObjectProperties =
        {
            textureScale: theme.scale
        };
        //skinSelector.displayObjectProperties.width = 200;
        skinSelector.displayObjectProperties.height = properties.wideControlSize;
        track.stateToSkinFunction = skinSelector.updateValue;
        track.hasLabelTextRenderer = false;
    }

    private function setVolumeSliderMaxStyles(track:Button):void
    {
        track.defaultSkin = AssetMap.createImage("volume-slider-thumb-skin");
        track.stateToSkinFunction = null;
        track.hasLabelTextRenderer = false;
    }
}
}