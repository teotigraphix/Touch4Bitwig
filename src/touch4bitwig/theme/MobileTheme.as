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
import com.teotigraphix.ui.theme.SharedFactory;

import flash.display.Bitmap;
import flash.display.BitmapData;

import starling.events.Event;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class MobileTheme extends AbstractTheme
{
    [Embed(source="/fonts/SourceSansPro-Regular.ttf", fontFamily="SourceSansPro", fontWeight="normal", mimeType="application/x-font", embedAsCFF="true")]
    protected static const SOURCE_SANS_PRO_REGULAR:Class;

    [Embed(source="/fonts/SourceSansPro-Semibold.ttf", fontFamily="SourceSansPro", fontWeight="bold", mimeType="application/x-font", embedAsCFF="true")]
    protected static const SOURCE_SANS_PRO_SEMI_BOLD:Class;

    [Embed(source="/../assets/mobile.png")]
    private static const ATLAS_BITMAP:Class;

    [Embed(source="/../assets/mobile.xml", mimeType="application/octet-stream")]
    private static const ATLAS_XML:Class;

    public function MobileTheme(scaleToDPI:Boolean = true)
    {
        super(scaleToDPI);
        SharedFactory.PRIMARY_BACKGROUND_COLOR = 0x171717;
        AssetMap.theme = this;
        this.initialize();
        this.dispatchEventWith(Event.COMPLETE);
    }

    override protected function initializeScale():void
    {
        super.initializeScale();
        AssetMap.scale = scale;
    }

    override protected function initialize():void
    {
        initializeTextureAtlas();
        super.initialize();
    }

    override protected function addFactories():void
    {
        super.addFactories();
        factories.push(new MainFactory(this));
        factories.push(new TransportBarFactory(this));
        factories.push(new MixerItemFactory(this));
        factories.push(new TrackChannelFactory(this));
        factories.push(new DeviceSelectBarFactory(this));
        factories.push(new ClipLauncherFactory(this));
        factories.push(new TrackNavigationControlFactory(this));
    }

    override protected function initializeTextures():void
    {
        super.initializeTextures();

    }

    override protected function initializeStyleProviders():void
    {
        super.initializeStyleProviders();
    }

    override protected function createFactories():void
    {
        super.createFactories();

        label = new UserLabelFactory(this);
        slider = new UserSliderFactory(this);
        button = new UserButtonFactory(this);
    }

    protected function atlasTexture_onRestore():void
    {
        var atlasBitmapData:BitmapData = Bitmap(new ATLAS_BITMAP()).bitmapData;
        this.atlas.texture.root.uploadBitmapData(atlasBitmapData);
        atlasBitmapData.dispose();
    }

    protected function initializeTextureAtlas():void
    {
        var atlasBitmapData:BitmapData = Bitmap(new ATLAS_BITMAP()).bitmapData;
        var atlasTexture:Texture = Texture.fromBitmapData(atlasBitmapData, false);
        atlasTexture.root.onRestore = this.atlasTexture_onRestore;
        atlasBitmapData.dispose();
        this.atlas = new TextureAtlas(atlasTexture, XML(new ATLAS_XML()));
        AssetMap.atlas = atlas;
    }

}
}
