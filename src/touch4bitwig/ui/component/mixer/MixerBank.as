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

import feathers.controls.LayoutGroup;

public class MixerBank extends LayoutGroup
{
    private var _skin:HMixerBankSkin;

    public function MixerBank()
    {
    }

    override protected function initialize():void
    {
        super.initialize();

        _skin = new HMixerBankSkin();
        addChild(_skin);
    }

    override protected function draw():void
    {
        super.draw();

        _skin.move(0, 0);
        _skin.setSize(actualWidth, actualHeight);
    }

    /**
     * Returns the MixerItem at the specified index - 1.
     * All track indexes start at 1 not 0.
     * @param index The TrackBank index 1-8.
     */
    public function getMixerItem(index:int):IMixerItem
    {
        return IMixerItem(_skin.getChildAt(index - 1));
    }
}
}
