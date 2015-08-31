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

package touch4bitwig.controller.command.screen
{

import feathers.core.DrawersApplication;

import org.robotlegs.starling.mvcs.Command;

import touch4bitwig.view.ApplicationScreens;
import touch4bitwig.view.MainNavigator;

public class ShowConfigureScreenCommand extends Command
{
    [Inject]
    public var application:DrawersApplication;

    [Inject]
    public var navigator:MainNavigator;

    override public function execute():void
    {
        application.toggleTopDrawer();

        navigator.pushScreen(ApplicationScreens.SCREEN_CONFIGURATION);
    }
}
}
