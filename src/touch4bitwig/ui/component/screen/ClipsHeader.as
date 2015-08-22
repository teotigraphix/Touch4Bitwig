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

package touch4bitwig.ui.component.screen
{

import touch4bitwig.ui.component.main.MainHeader;
import touch4bitwig.ui.component.transport.TransportBar;

public class ClipsHeader extends MainHeader
{
    private var _transportBar:TransportBar;

    public function ClipsHeader()
    {
    }

    override protected function initialize():void
    {
        _transportBar = new TransportBar();

        super.initialize();

        //title = "Clips";

    }

    override protected function draw():void
    {
        super.draw();
    }

    //override protected function addLeftItems():void
    //{
    //    leftItems = new <DisplayObject>[_activeEngineButton, _transportBar];
    //}
    //
    //override protected function addRightItems():void
    //{
    //    rightItems = new <DisplayObject>[_clipsButton, _deviceButton, _panelsButton, _mixerButton];
    //}
}
}
