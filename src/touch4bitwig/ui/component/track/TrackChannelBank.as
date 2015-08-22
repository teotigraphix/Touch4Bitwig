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

package touch4bitwig.ui.component.track
{

import feathers.controls.LayoutGroup;
import feathers.layout.HorizontalLayout;
import feathers.layout.HorizontalLayoutData;

public class TrackChannelBank extends LayoutGroup
{
    public function TrackChannelBank()
    {
    }

    override protected function initialize():void
    {
        var l:HorizontalLayout = new HorizontalLayout();
        layout = l;
        super.initialize();

        for (var i:int = 0; i < 8; i++)
        {
            var channel:TrackChannel = new TrackChannel();
            channel.index = i;
            channel.layoutData = new HorizontalLayoutData(100, 100);
            addChild(channel);
        }
    }

    override protected function draw():void
    {
        super.draw();
    }

    public function getParamValue(index:int):int
    {
        return TrackChannel(getChildAt(index)).deviceParamGroup.paramValue;
    }

    public function isRecarm(index:int):Boolean
    {
        return TrackChannel(getChildAt(index)).trackControlGroup.isRecarm;
    }

    public function isSolo(index:int):Boolean
    {
        return TrackChannel(getChildAt(index)).trackControlGroup.isSolo;
    }

    public function isMute(index:int):Boolean
    {
        return TrackChannel(getChildAt(index)).trackControlGroup.isMute;
    }

    public function getVolume(index:int):Number
    {
        return TrackChannel(getChildAt(index)).trackVolumeGroup.volume;
    }

    public function setExists(index:int, value:Boolean):void
    {
        //TrackChannel(getChildAt(index - 1)).visible = value;
    }

    //-------------------------------

    public function setParamName(index:int, value:String):void
    {
        TrackChannel(getChildAt(index - 1)).deviceParamGroup.paramName = value;
    }

    public function setParamValue(index:int, value:int):void
    {
        TrackChannel(getChildAt(index - 1)).deviceParamGroup.paramValue = value;
    }

    public function setParamValueString(index:int, value:String):void
    {
        TrackChannel(getChildAt(index - 1)).deviceParamGroup.paramValueString = value;
    }

    public function setIsRecarm(index:int, value:Boolean):void
    {
        TrackChannel(getChildAt(index - 1)).trackControlGroup.isRecarm = value;
    }

    public function setIsSolo(index:int, value:Boolean):void
    {
        TrackChannel(getChildAt(index - 1)).trackControlGroup.isSolo = value;
    }

    public function setIsMute(index:int, value:Boolean):void
    {
        TrackChannel(getChildAt(index - 1)).trackControlGroup.isMute = value;
    }

    public function setVU(index:int, value:int):void
    {
        TrackChannel(getChildAt(index - 1)).trackVolumeGroup.vu = value;
    }

    public function setVolume(index:int, value:Number):void
    {
        TrackChannel(getChildAt(index - 1)).trackVolumeGroup.volume = value;
    }
}
}
