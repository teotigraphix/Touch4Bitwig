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

import feathers.controls.Screen;
import feathers.layout.VerticalLayout;
import feathers.layout.VerticalLayoutData;

import touch4bitwig.ui.component.cliplauncher.GridStack;
import touch4bitwig.ui.component.main.MainHeader;

public class ClipsScreen extends Screen
{
    private var _gridStack:GridStack;
    private var _clipLauncherFooter:ClipScreenFooter;

    public function ClipsScreen()
    {
    }

    override protected function initialize():void
    {
        var vl:VerticalLayout = new VerticalLayout();
        layout = vl;

        super.initialize();

        var header:MainHeader = new ClipsHeader();
        header.layoutData = new VerticalLayoutData(100);
        addChild(header);

        //var spacer:LayoutGroup = new LayoutGroup();
        //spacer.layoutData = new VerticalLayoutData(100, 100);
        //addChild(spacer);

        _gridStack = new GridStack();
        _gridStack.layoutData = new VerticalLayoutData(100, 100);
        addChild(_gridStack);

        _clipLauncherFooter = new ClipScreenFooter();
        _clipLauncherFooter.layoutData = new VerticalLayoutData(100);
        addChild(_clipLauncherFooter);
    }

    override protected function draw():void
    {
        super.draw();
    }
}
}
