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

package touch4bitwig.ui.component.mixer
{

import com.teotigraphix.ui.theme.AssetMap;

import feathers.controls.LayoutGroup;
import feathers.layout.HorizontalLayout;
import feathers.layout.HorizontalLayoutData;

public class MixerBank extends LayoutGroup
{
    public function MixerBank()
    {
    }

    override protected function initialize():void
    {
        var hl:HorizontalLayout = new HorizontalLayout();
        hl.gap = AssetMap.getSize(8);
        hl.padding = AssetMap.getSize(28);
        layout = hl;

        super.initialize();

        for (var i:int = 0; i < 8; i++)
        {
            var item:MixerItem = new MixerItem();
            item.index = i;
            item.layoutData = new HorizontalLayoutData(100, 100);
            item.minHeight = 300;
            item.backgroundSkin = AssetMap.createImage("mixer-item-background-skin");
            addChild(item);
        }
    }

    override protected function draw():void
    {
        super.draw();
    }

    public function getSelected(index:int):Boolean
    {
        return MixerItem(getChildAt(index)).selected;
    }

    public function getVolume(index:int):Number
    {
        return MixerItem(getChildAt(index)).volumeValue;
    }

    public function getPan(index:int):Number
    {
        return MixerItem(getChildAt(index)).panValue;
    }

    public function getRecord(index:int):Boolean
    {
        return MixerItem(getChildAt(index)).isRecArm;
    }

    public function getSolo(index:int):Boolean
    {
        return MixerItem(getChildAt(index)).isSolo;
    }

    public function getMute(index:int):Boolean
    {
        return MixerItem(getChildAt(index)).isMute;
    }

    public function setCanHoldNotes(index:int, value:Boolean):void
    {
        MixerItem(getChildAt(index - 1)).canHoldNotes = value;
    }

    public function setExists(index:int, value:Boolean):void
    {
        MixerItem(getChildAt(index - 1)).exists = value;
    }

    public function setTrackSelected(index:int, value:Boolean):void
    {
        MixerItem(getChildAt(index - 1)).selected = value;
    }

    public function setTrackName(index:int, value:String):void
    {
        MixerItem(getChildAt(index - 1)).trackName = value;
    }

    public function setTrackColor(index:int, value:int):void
    {
        MixerItem(getChildAt(index - 1)).trackColor = value;
    }

    public function setVolume(index:int, value:Number):void
    {
        MixerItem(getChildAt(index - 1)).volumeValue = value;
    }

    public function setVolumeString(index:int, value:String):void
    {
        MixerItem(getChildAt(index - 1)).volumeString = value;
    }

    public function setPan(index:int, value:Number):void
    {
        MixerItem(getChildAt(index - 1)).panValue = value;
    }

    public function setPanString(index:int, value:String):void
    {
        MixerItem(getChildAt(index - 1)).panString = value;
    }

    public function setRecord(index:int, value:Boolean):void
    {
        MixerItem(getChildAt(index - 1)).isRecArm = value;
    }

    public function setSolo(index:int, value:Boolean):void
    {
        MixerItem(getChildAt(index - 1)).isSolo = value;
    }

    public function setMute(index:int, value:Boolean):void
    {
        MixerItem(getChildAt(index - 1)).isMute = value;
    }

    public function setVU(index:int, value:int):void
    {
        MixerItem(getChildAt(index - 1)).vuValue = value;
    }
}
}
