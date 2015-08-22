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

package touch4bitwig.ui.component.cliplauncher
{

import feathers.controls.LayoutGroup;
import feathers.layout.AnchorLayout;
import feathers.layout.AnchorLayoutData;

public class GridStack extends LayoutGroup
{
    private var _clipLauncher:ClipLauncher;
    //private var _sceneLauncher:SceneLauncher;

    private var _selectedIndex:int = -1;

    public function get selectedIndex():int
    {
        return _selectedIndex;
    }

    public function set selectedIndex(value:int):void
    {
        _selectedIndex = value;

        if (_selectedIndex == 0)
        {
            _clipLauncher.visible = false;
            //_sceneLauncher.visible = true;
        }
        else if (_selectedIndex == 1)
        {
            _clipLauncher.visible = true;
            //_sceneLauncher.visible = false;
        }
    }

    public function get clipLauncher():ClipLauncher
    {
        return _clipLauncher;
    }

    //public function get sceneLauncher():SceneLauncher
    //{
    //    return _sceneLauncher;
    //}

    public function GridStack()
    {
        super();
    }

    override protected function initialize():void
    {
        var al:AnchorLayout = new AnchorLayout();
        layout = al;

        super.initialize();

        _clipLauncher = new ClipLauncher();
        _clipLauncher.layoutData = new AnchorLayoutData(0, 0, 0, 0);
        addChild(_clipLauncher);

        //_sceneLauncher = new SceneLauncher();
        //_sceneLauncher.layoutData = new AnchorLayoutData(0, 0, 0, 0);
        //addChild(_sceneLauncher);

        //_clipLauncher.visible = false;
        //_sceneLauncher.visible = false;
    }

    override protected function draw():void
    {
        super.draw();
    }
}
}
