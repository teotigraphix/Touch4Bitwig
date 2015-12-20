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

import feathers.display.Scale9Image;
import feathers.textures.Scale9Textures;

import flash.geom.Rectangle;

import touch4bitwig.ui.component.cliplauncher.ClipButton;
import touch4bitwig.ui.component.cliplauncher.SceneButton;

public class ClipLauncherFactory extends AbstractThemeFactory
{
    protected static const BUTTON_SCALE9_GRID:Rectangle = new Rectangle(5, 5, 50, 50);

    private var clipButtonIdleSkinTextures:Scale9Textures;
    private var clipButtonDequeuedSkinTextures:Scale9Textures;
    private var clipButtonQueuedSkinTextures:Scale9Textures;
    private var clipButtonPlaySkinTextures:Scale9Textures;
    private var clipButtonDisabledSkinTextures:Scale9Textures;

    public function ClipLauncherFactory(theme:AbstractTheme)
    {
        super(theme);
    }

    override public function initializeTextures():void
    {
        super.initializeTextures();

        this.clipButtonIdleSkinTextures = new Scale9Textures(
                this.atlas.getTexture("clip-button-idle-skin"), BUTTON_SCALE9_GRID);
        this.clipButtonDequeuedSkinTextures = new Scale9Textures(
                this.atlas.getTexture("clip-button-dequeued-skin"), BUTTON_SCALE9_GRID);
        this.clipButtonQueuedSkinTextures = new Scale9Textures(
                this.atlas.getTexture("clip-button-queued-skin"), BUTTON_SCALE9_GRID);
        this.clipButtonPlaySkinTextures = new Scale9Textures(
                this.atlas.getTexture("clip-button-play-skin"), BUTTON_SCALE9_GRID);
        this.clipButtonDisabledSkinTextures = new Scale9Textures(
                this.atlas.getTexture("clip-button-disabled-skin"), BUTTON_SCALE9_GRID);
    }

    override public function initializeStyleProviders():void
    {
        super.initializeStyleProviders();

        setStyle(ClipButton, setClipButtonStyles);
        setStyle(SceneButton, setSceneButtonStyles);

        setStyle(UIToggleButton, setAutomationButtonStyles, StyleNames.CLIP_LAUNCHER_AUTOMATION_BUTTON);
        setStyle(UIToggleButton, setOverdubButtonStyles, StyleNames.CLIP_LAUNCHER_OVERDUB_BUTTON);
    }

    private function setAutomationButtonStyles(button:UIToggleButton):void
    {
        theme.button.setButtonStyles(button);
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

    private function setOverdubButtonStyles(button:UIToggleButton):void
    {
        theme.button.setButtonStyles(button);
        button.stateToSkinFunction = null;
        button.label = "OVR";
        //button.defaultIcon = AssetMap.createImage("automation-button-icon-skin");
        //button.defaultSelectedIcon = AssetMap.createImage("automation-button-icon-selected-skin");
        button.defaultSkin = AssetMap.create9ScaleImage("button-up-skin", 5, 5, 50, 50);
        button.defaultSelectedSkin = AssetMap.create9ScaleImage("recarm-button-selected-up-skin", 5, 5, 50, 50);
        button.minWidth = 75;
        //button.setSize(50, 50);
        button.padding = 0;
    }

    private function setClipButtonStyles(button:ClipButton):void
    {
        theme.button.setButtonStyles(button);

        button.stateToSkinFunction = null;

        button.defaultLabelProperties.elementFormat = theme.fonts.smallDarkElementFormat;

        button.disabledSkin = new Scale9Image(clipButtonDisabledSkinTextures, properties.scale);

        button.selectedOverlaySkin = AssetMap.create9ScaleImage("clip-button-selected-overlay-skin", 5, 5, 50, 50);

        button.playIconSkin = AssetMap.createImage("clip-button-play-icon-skin");
        button.playIconSkin.width = 15;
        button.playIconSkin.height = 15;

        button.stopIconSkin = AssetMap.createImage("clip-button-stop-icon-skin");
        button.stopIconSkin.width = 15;
        button.stopIconSkin.height = 15;

        button.queuedIconSkin = AssetMap.createImage("clip-button-queued-icon-skin");
        button.queuedIconSkin.width = 15;
        button.queuedIconSkin.height = 15;

        button.idleIconSkin = AssetMap.createImage("clip-button-idle-icon-skin");
        button.idleIconSkin.width = 15;
        button.idleIconSkin.height = 15;

        button.recordIdleIconSkin = AssetMap.createImage("clip-button-record-idle-icon-skin");
        button.recordIdleIconSkin.width = 15;
        button.recordIdleIconSkin.height = 15;

        button.recordQueuedIconSkin = AssetMap.createImage("clip-button-record-queued-icon-skin");
        button.recordQueuedIconSkin.width = 15;
        button.recordQueuedIconSkin.height = 15;

        button.recordPlayIconSkin = AssetMap.createImage("clip-button-record-play-icon-skin");
        button.recordPlayIconSkin.width = 15;
        button.recordPlayIconSkin.height = 15;

        button.labelOffsetY = AssetMap.size(10);
        button.paddingTop = AssetMap.size(5);//this.smallGutterSize;
        button.paddingBottom = 0;//this.smallGutterSize;
        button.paddingLeft = 0;//this.gutterSize;
        button.paddingRight = 0;//this.gutterSize;
        button.gap = properties.smallGutterSize;
        button.minGap = properties.smallGutterSize;
        button.minWidth = button.minHeight = 10; //this.controlSize;
        button.minTouchWidth = properties.gridSize;
        button.minTouchHeight = properties.gridSize;
    }

    private function setSceneButtonStyles(button:SceneButton):void
    {
        theme.button.setButtonStyles(button);

        button.stateToSkinFunction = null;

        button.idleSkin = new Scale9Image(clipButtonIdleSkinTextures, properties.scale);
        button.dequeuedSkin = new Scale9Image(clipButtonDequeuedSkinTextures, properties.scale);
        button.queuedSkin = new Scale9Image(clipButtonQueuedSkinTextures, properties.scale);
        button.playSkin = new Scale9Image(clipButtonPlaySkinTextures, properties.scale);
        button.disabledSkin = new Scale9Image(clipButtonDisabledSkinTextures, properties.scale);

        button.paddingTop = 0;//this.smallGutterSize;
        button.paddingBottom = 0;//this.smallGutterSize;
        button.paddingLeft = 0;//this.gutterSize;
        button.paddingRight = 0;//this.gutterSize;
        button.gap = properties.smallGutterSize;
        button.minGap = properties.smallGutterSize;
        button.minWidth = button.minHeight = 10; //this.controlSize;
        button.minTouchWidth = properties.gridSize;
        button.minTouchHeight = properties.gridSize;
    }
}
}
