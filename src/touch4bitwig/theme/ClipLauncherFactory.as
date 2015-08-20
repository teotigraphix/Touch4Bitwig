/**
 * Created by Teoti on 4/16/2015.
 */
package touch4bitwig.theme
{


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
    }

    private function setClipButtonStyles(button:ClipButton):void
    {
        theme.buttons.setButtonStyles(button);

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

        button.labelOffsetY = AssetMap.getSize(10);
        button.paddingTop = AssetMap.getSize(5);//this.smallGutterSize;
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
        theme.buttons.setButtonStyles(button);

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