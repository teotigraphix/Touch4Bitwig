////////////////////////////////////////////////////////////////////////////////
// Copyright 2016 Michael Schmalle - Teoti Graphix, LLC
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
package t4b.controller
{

import com.teotigraphix.core.sdk_internal;
import com.teotigraphix.ui.component.IScreenNavigator;
import com.teotigraphix.ui.core.AbstractScreenLauncher;

import org.robotlegs.starling.core.IMediatorMap;

import t4b.view.ui.LoadingScreen;
import t4b.view.ui.MainScreen;
import t4b.view.ui._mediators.LoadingScreenMediator;
import t4b.view.ui._mediators.MainScreenMediator;

use namespace sdk_internal;

public class ScreenLauncher extends AbstractScreenLauncher
{
    public static const LOAD:String = "load";
    public static const MAIN:String = "main";
    
    //--------------------------------------------------------------------------
    // Constructor
    //--------------------------------------------------------------------------
    
    public function ScreenLauncher()
    {
        super();
        rootScreen = MAIN;
    }

    override protected function configureFramework(navigator:IScreenNavigator):void
    {
        super.configureFramework(navigator);
    }

    override protected function configure(navigator:IScreenNavigator):void
    {
        super.configure(navigator);
        
        navigator.addScreen(LOAD, create(LoadingScreen, LoadingScreenMediator));
        navigator.addScreen(MAIN, create(MainScreen, MainScreenMediator));
    }

    override protected function configureControls(mediatorMap:IMediatorMap):void
    {
        super.configureControls(mediatorMap);
    }

    override protected function configurePopUpControls(mediatorMap:IMediatorMap):void
    {
        super.configurePopUpControls(mediatorMap);
    }
    
    //--------------------------------------------------------------------------
    // API :: Methods
    //--------------------------------------------------------------------------
    
    public function goToLoad():void
    {
        setApplicationScreen(LOAD);
    }
    
    public function goToMain():void
    {
        setApplicationScreen(MAIN);
    }
}
}
