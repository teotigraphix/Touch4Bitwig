/**
 * Created by Teoti on 4/13/2015.
 */
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

import touch4bitwig.ui.component.track.channel.DeviceKnob;

public class TrackChannelFactory extends AbstractThemeFactory
{

    public function TrackChannelFactory(theme:AbstractTheme)
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

        setStyle(UIToggleButton, setRecArmStyles, "track-strip-recarm-button");
        setStyle(UIToggleButton, setSoloStyles, "track-strip-solo-button");
        setStyle(UIToggleButton, setMuteStyles, "track-strip-mute-button");

        setStyle(ProgressBar, setVUBarStyles, "track-strip-vu-bar");

        setStyle(Slider, setVolumeSliderStyles, "track-strip-volume-slider");
        setStyle(Button, setVolumeSliderThumbStyles, "volume-slider-thumb");
        setStyle(Button, setVolumeSliderMinStyles, "volume-slider-min");
        setStyle(Button, setVolumeSliderMaxStyles, "volume-slider-max");

        setStyle(DeviceKnob, setDeviceKnobStyles, "track-channel-device-knob");

        setStyle(Button, setTrackNavigationUpButtonStyles, "track-navigation-up-button");
        setStyle(Button, setTrackNavigationDownButtonStyles, "track-navigation-down-button");

    }

    private function setTrackNavigationUpButtonStyles(button:Button):void
    {
        theme.buttons.setButtonStyles(button);
        button.defaultIcon = AssetMap.createImage("track-navigation-up-icon-skin");
    }

    private function setTrackNavigationDownButtonStyles(button:Button):void
    {
        theme.buttons.setButtonStyles(button);
        button.defaultIcon = AssetMap.createImage("track-navigation-down-icon-skin");
    }

    //----------------------------------
    // recarm, solo, mute
    //----------------------------------

    private function setDeviceKnobStyles(knob:DeviceKnob):void
    {
        knob.backgroundSkin = AssetMap.createImage("knob-background-skin");
        knob.knobThumbSkin = AssetMap.createImage("knob-thumb-skin");
        knob.indicatorSkin = AssetMap.createImage("knob-indicator-" + (knob.index + 1) + "-skin");
        //knob.indicatorSkin.touchable = false;
    }

    //----------------------------------
    // recarm, solo, mute
    //----------------------------------

    private function setRecArmStyles(button:UIToggleButton):void
    {
        theme.buttons.setButtonStyles(button);
        button.label = "O";
        button.isQuickHitAreaEnabled = true;
        button.maxHeight = AssetMap.getSize(40);
        button.minTouchHeight = AssetMap.getSize(40);
        button.stateToSkinFunction = null;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("recarm-button-selected-up-skin", 5, 5, 50, 50);
        button.defaultSelectedLabelProperties.elementFormat = theme.fonts.darkUIElementFormat;
    }

    private function setSoloStyles(button:UIToggleButton):void
    {
        theme.buttons.setButtonStyles(button);
        button.label = "S";
        button.isQuickHitAreaEnabled = true;
        button.maxHeight = AssetMap.getSize(40);
        button.minTouchHeight = AssetMap.getSize(40);
        button.stateToSkinFunction = null;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("solo-button-selected-up-skin", 5, 5, 50, 50);
        button.defaultSelectedLabelProperties.elementFormat = theme.fonts.darkUIElementFormat;
    }

    private function setMuteStyles(button:UIToggleButton):void
    {
        theme.buttons.setButtonStyles(button);
        button.label = "M";
        button.isQuickHitAreaEnabled = true;
        button.maxHeight = AssetMap.getSize(40);
        button.minTouchHeight = AssetMap.getSize(40);
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
        bar.width = AssetMap.getSize(5);
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
