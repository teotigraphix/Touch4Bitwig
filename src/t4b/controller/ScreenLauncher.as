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

import feathers.controls.IScreen;
import feathers.controls.StackScreenNavigator;

import org.robotlegs.starling.core.IMediatorMap;

import t4b.view.ui.LoadingScreen;
import t4b.view.ui.MainScreen;
import t4b.view.ui.TransportContentScreen;
import t4b.view.ui._mediators.LoadingScreenMediator;
import t4b.view.ui._mediators.MainScreenMediator;
import t4b.view.ui._mediators.TransportContentScreenMediator;
import t4b.view.ui.main.ApplicationToolBar;
import t4b.view.ui.main.TransportToolBar;
import t4b.view.ui.main._mediators.ApplicationToolBarMediator;
import t4b.view.ui.main._mediators.TransportToolBarMediator;
import t4b.view.ui.transport.TransportBar;
import t4b.view.ui.transport.TransportDisplay;
import t4b.view.ui.transport.TransportPopUp;
import t4b.view.ui.transport._mediators.TransportBarMediator;
import t4b.view.ui.transport._mediators.TransportDisplayMediator;
import t4b.view.ui.transport._mediators.TransportPopUpMediator;

use namespace sdk_internal;

public class ScreenLauncher extends AbstractScreenLauncher
{
    public static const LOAD:String = "load";
    public static const MAIN:String = "main";
    
    /**
     * data - screenID
     */
    public static const EVENT_SELECTED_CONTENT_INDEX_CHANGED:String = "selectedContentIndexChanged";
    
    public static const CONTENT_TRANSPORT:String = "contentTransport";
    
    private var _contentNavigator:StackScreenNavigator;
    private var _contentScreenID:String;
    
    //----------------------------------
    // contentNavigator
    //----------------------------------
    
    public function get contentNavigator():StackScreenNavigator
    {
        return _contentNavigator;
    }
    
    public function set contentNavigator(value:StackScreenNavigator):void
    {
        _contentNavigator = value;
        
        if (_contentNavigator != null)
        {
            configureContent(_contentNavigator);
            configureContentControls(_mediatorMap);
        }
    }
    
    public function get contentScreenID():String
    {
        return _contentScreenID;
    }
    
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
        
        //navigator.addScreen(TRANSPORT, create(TransportScreen, TransportScreenMediator));
    }

    override protected function configureControls(mediatorMap:IMediatorMap):void
    {
        super.configureControls(mediatorMap);
        

        mediatorMap.mapView(ApplicationToolBar, ApplicationToolBarMediator);
        mediatorMap.mapView(TransportToolBar, TransportToolBarMediator);
        
    }

    override protected function configurePopUpControls(mediatorMap:IMediatorMap):void
    {
        super.configurePopUpControls(mediatorMap);
        
        mediatorMap.mapView(TransportPopUp, TransportPopUpMediator);  
    }
    //----------------------------------
    // contentNavigator
    //----------------------------------
    
    private function configureContent(navigator:StackScreenNavigator):void
    {
        if (!_mediatorMap.hasMapping(TransportContentScreen))
        {
            var transport:TransportContentScreen = new TransportContentScreen();
            
            navigator.addScreen(CONTENT_TRANSPORT, create(transport, TransportContentScreenMediator));   
        }
    }
    
    protected function configureContentControls(mediatorMap:IMediatorMap):void
    {
        if (!_mediatorMap.hasMapping(TransportDisplay))
        {
            mediatorMap.mapView(TransportDisplay, TransportDisplayMediator);
            mediatorMap.mapView(TransportBar, TransportBarMediator);
            
        }
    }
    
    sdk_internal function setContentScreen(screenID:String):IScreen
    {
        if (_contentScreenID == screenID)
            return null;
        
        _contentScreenID = screenID;
        
        logger.log("ScreenLauncher", "creating content screen [{0}]", screenID);
        var screen:IScreen = IScreen(_contentNavigator.pushScreen(_contentScreenID));
        injector.injectInto(screen);
        
        logger.log("ScreenLauncher", "content screen [{0}] created as {1}", screenID, screen);
        
        dispatchWith(EVENT_SELECTED_CONTENT_INDEX_CHANGED, false, screenID);
        
        return screen;
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
    
    public function goToTransport():void
    {
        setContentScreen(CONTENT_TRANSPORT);
    }
}
}
