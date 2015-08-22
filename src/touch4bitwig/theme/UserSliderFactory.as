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
import com.teotigraphix.ui.theme.AssetMap;
import com.teotigraphix.ui.theme.SliderFactory;

import feathers.controls.Button;
import feathers.controls.Slider;
import feathers.skins.SmartDisplayObjectStateValueSelector;

public class UserSliderFactory extends SliderFactory
{

    public function UserSliderFactory(theme:AbstractTheme)
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

        setStyle(Slider, setVolumeSliderStyles, "volume-slider");
        setStyle(Button, setVolumeSliderThumbStyles, "volume-slider-thumb");
        setStyle(Button, setVolumeSliderMinStyles, "volume-slider-min");
        setStyle(Button, setVolumeSliderMaxStyles, "volume-slider-max");
    }

    override public function setHorizontalSliderMinimumTrackStyles(track:Button):void
    {
        super.setHorizontalSliderMinimumTrackStyles(track);
    }

    override public function setHorizontalSliderMaximumTrackStyles(track:Button):void
    {
        super.setHorizontalSliderMaximumTrackStyles(track);
    }

    override public function setVerticalSliderMinimumTrackStyles(track:Button):void
    {
        var skinSelector:SmartDisplayObjectStateValueSelector = new SmartDisplayObjectStateValueSelector();
        skinSelector.defaultValue = theme.shared.backgroundSkinTextures;
        skinSelector.setValueForState(theme.shared.backgroundDisabledSkinTextures, Button.STATE_DISABLED, false);
        skinSelector.displayObjectProperties =
        {
            textureScale: theme.scale
        };
        skinSelector.displayObjectProperties.width = 20;
        //skinSelector.displayObjectProperties.height = properties.wideControlSize;
        track.stateToSkinFunction = skinSelector.updateValue;
        track.hasLabelTextRenderer = false;
    }

    override public function setVerticalSliderMaximumTrackStyles(track:Button):void
    {
        var skinSelector:SmartDisplayObjectStateValueSelector = new SmartDisplayObjectStateValueSelector();
        skinSelector.defaultValue = theme.shared.backgroundSkinTextures;
        skinSelector.setValueForState(theme.shared.backgroundDisabledSkinTextures, Button.STATE_DISABLED, false);
        skinSelector.displayObjectProperties =
        {
            textureScale: theme.scale
        };
        skinSelector.displayObjectProperties.width = 20;
        skinSelector.displayObjectProperties.height = properties.wideControlSize;
        track.stateToSkinFunction = skinSelector.updateValue;
        track.hasLabelTextRenderer = false;
    }

    //----------------------------------
    // volume-slider
    //----------------------------------

    private function setVolumeSliderStyles(slider:Slider):void
    {
        slider.width = 30;
        slider.trackLayoutMode = Slider.TRACK_LAYOUT_MODE_MIN_MAX;
        slider.customThumbStyleName = "volume-slider-thumb";
        slider.customMinimumTrackStyleName = "volume-slider-min";
        slider.customMaximumTrackStyleName = "volume-slider-max";
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
        skinSelector.displayObjectProperties.width = 30;
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
