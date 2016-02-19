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
import com.teotigraphix.app.configuration.IApplicationPermissions;
import com.teotigraphix.controller.ICommandLauncher;
import com.teotigraphix.core.sdk_internal;
import com.teotigraphix.ui.IScreenLauncher;
import com.teotigraphix.ui.core.AbstractUIState;

import feathers.data.ListCollection;

import t4b.view.ui.main.TransportToolBar;
import t4b.view.ui.transport.TransportBar;

use namespace sdk_internal;

public class UIState extends AbstractUIState
{
    [Inject]
    public var _commands:ICommandLauncher;
    
    [Inject]
    public var _screens:IScreenLauncher;
    
    [Inject]
    public var _permissions:IApplicationPermissions;
    
    private var _applicationToolBarDataProvider:ListCollection = new ListCollection();
    private var _transportTempoWholeDataProvider:ListCollection;
    private var _transportTempoFractionDataProvider:ListCollection;
    
    private var _selectedContentIndex:int = 0;
    
    private function get commands():CommandLauncher
    {
        return CommandLauncher(_commands);
    }
    
    private function get screens():ScreenLauncher
    {
        return ScreenLauncher(_screens);
    }
    
    //----------------------------------
    // selectedContentIndex
    //----------------------------------
    
    public function get selectedContentIndex():int
    {
        return _selectedContentIndex;
    }
    
    public function set selectedContentIndex(value:int):void
    {
        if (_selectedContentIndex == value)
            return;
        _selectedContentIndex = value;
    }
    
    //----------------------------------
    // applicationToolBarDataProvider
    //----------------------------------
    
    public function get applicationToolBarDataProvider():ListCollection
    {
        return _applicationToolBarDataProvider;
    }
    
    //----------------------------------
    // Transport
    //----------------------------------
    
    public function get transportTempoWholeDataProvider():ListCollection
    {
        return _transportTempoWholeDataProvider;
    }
    
    public function get transportTempoFractionDataProvider():ListCollection
    {
        return _transportTempoFractionDataProvider;
    }

    //--------------------------------------------------------------------------
    // Constructor
    //--------------------------------------------------------------------------
    
    public function UIState()
    {
        super();
    }
    
    
    //----------------------------------
    // transportToolsDataProvider
    //----------------------------------
    
    // {control:DisplayObject} with Mediator
    public function createTransportToolsDataProvider(screenID:String):ListCollection
    {
        var dataProvider:ListCollection = new ListCollection([]);
        
        switch(screenID)
        {
            case ScreenLauncher.CONTENT_TRANSPORT:
            {
                dataProvider.addItem({control:new TransportBar()});
                break;
            }
        }
        return dataProvider;
    }
    
    
    override protected function onRegister():void
    {
        super.onRegister();
        
        _applicationToolBarDataProvider.data = [];
        
        _applicationToolBarDataProvider.addItem({label:"T", screenID:ScreenLauncher.CONTENT_TRANSPORT});
        _applicationToolBarDataProvider.addItem({label:"D", screenID:ScreenLauncher.CONTENT_TRANSPORT});
        _applicationToolBarDataProvider.addItem({label:"W", screenID:ScreenLauncher.CONTENT_TRANSPORT});
        _applicationToolBarDataProvider.addItem({label:"K", screenID:ScreenLauncher.CONTENT_TRANSPORT});
        _applicationToolBarDataProvider.addItem({label:"F", screenID:ScreenLauncher.CONTENT_TRANSPORT});
        
        // Transport
        
        _transportTempoWholeDataProvider = new ListCollection();
        _transportTempoFractionDataProvider = new ListCollection();
        
        var i:int;
        var value:int = 20;
        for (i = 0; i < 667 - 20; i++)
        {
            _transportTempoWholeDataProvider.addItem({label: value, index: i, bpm: value});
            value++;
        }
        
        value = 0;
        
        for (i = 0; i < 100; i++)
        {
            _transportTempoFractionDataProvider.addItem({label: i, index: i, bpm: value});
            value++;
        }
    }
}
}