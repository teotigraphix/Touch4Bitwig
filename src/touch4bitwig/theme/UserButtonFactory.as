/**
 * Created by Teoti on 4/4/2015.
 */
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

        setStyle(UIToggleButton, setRecArmStyles, "recarm-button");
        setStyle(UIToggleButton, setSoloStyles, "solo-button");
        setStyle(UIToggleButton, setMuteStyles, "mute-button");

        setStyle(Button, setStopStyles, "stop-button");
        setStyle(UIToggleButton, setPlayStyles, "play-button");
        setStyle(UIToggleButton, setRecordStyles, "record-button");
        setStyle(UIToggleButton, setAutomationStyles, "automation-button");
        setStyle(UIToggleButton, setTransportBarPopUpButtonStyles, "transport-bar-popup-button");

        setStyle(UIToggleButton, setOverdubStyles, "overdub-button");

        setStyle(UIToggleButton, setPanelsLayoutStyles, "panels-layout-button");
        setStyle(UIToggleButton, setPanelsStyles, "panels-button");

    }

    override public function setBaseButtonStyles(button:Button):void
    {
        super.setBaseButtonStyles(button);
        button.defaultLabelProperties.elementFormat = theme.fonts.lightUIElementFormat;
    }

    private function setTransportBarPopUpButtonStyles(button:UIToggleButton):void
    {
        theme.buttons.setButtonStyles(button);
        button.defaultIcon = AssetMap.createImage("transport-bar-popup-button-icon-skin");
        button.width = AssetMap.getSize(50);
        button.hasLabelTextRenderer = false;
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

    private function setRecArmStyles(button:UIToggleButton):void
    {
        theme.buttons.setButtonStyles(button);
        button.stateToSkinFunction = null;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("recarm-button-selected-up-skin", 5, 5, 50, 50);
        button.defaultSelectedLabelProperties.elementFormat = theme.fonts.darkUIElementFormat;
    }

    private function setSoloStyles(button:UIToggleButton):void
    {
        theme.buttons.setButtonStyles(button);
        button.stateToSkinFunction = null;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("solo-button-selected-up-skin", 5, 5, 50, 50);
        button.defaultSelectedLabelProperties.elementFormat = theme.fonts.darkUIElementFormat;
    }

    private function setMuteStyles(button:UIToggleButton):void
    {
        theme.buttons.setButtonStyles(button);
        button.stateToSkinFunction = null;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("mute-button-selected-up-skin", 5, 5, 50, 50);
        button.defaultSelectedLabelProperties.elementFormat = theme.fonts.darkUIElementFormat;
    }

    //----------------------------------
    // Transport Buttons
    //----------------------------------

    private function setStopStyles(button:Button):void
    {
        theme.buttons.setButtonStyles(button);
        button.stateToSkinFunction = null;
        button.defaultIcon = AssetMap.createImage("stop-button-icon-skin");
        button.defaultIcon.width = 20;
        button.defaultIcon.height = 20;
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.downSkin = AssetMap.create9ScaleImage("button-down-skin", 5, 5, 50, 50);

        button.setSize(50, 50);
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

        button.setSize(50, 50);
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

        button.setSize(50, 50);
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

        button.setSize(50, 50);
    }

    private function setOverdubStyles(button:UIToggleButton):void
    {
        theme.buttons.setButtonStyles(button);
        button.stateToSkinFunction = null;
        button.label = "OVR";
        //button.defaultIcon = AssetMap.createImage("automation-button-icon-skin");
        //button.defaultSelectedIcon = AssetMap.createImage("automation-button-icon-selected-skin");
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("recarm-button-selected-up-skin", 5, 5, 50, 50);

        button.setSize(50, 50);
        button.padding = 0;
    }
}
}
