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
package t4b.view.ui.main._mediators
{
import feathers.data.ListCollection;

import starling.events.Event;

import t4b.controller.ScreenLauncher;
import t4b.view.core.AbstractMediator;
import t4b.view.ui.main.TransportToolBar;

public class TransportToolBarMediator extends AbstractMediator
{
    [Inject]
    public var view:TransportToolBar;

    //--------------------------------------------------------------------------
    // Methods
    //--------------------------------------------------------------------------
    
    override protected function initializeView():void
    {
        redraw(model.screens.contentScreenID);
    }
    
    override protected function setupViewListeners():void
    {
    }
    
    override protected function setupContextListeners():void
    {
        addContextListener(ScreenLauncher.EVENT_SELECTED_CONTENT_INDEX_CHANGED, 
            context_selectedContentIndexChangedHandler);
    }
    
    //--------------------------------------------------------------------------
    // View
    //--------------------------------------------------------------------------
    
    //--------------------------------------------------------------------------
    // Context
    //--------------------------------------------------------------------------
    
    private function context_selectedContentIndexChangedHandler(event:Event, screenID:String):void
    {
        redraw(screenID);
    }
    
    private function redraw(screenID:String):void
    {
        view.removeChildren();
        
        var collection:ListCollection = model.ui.state.createTransportToolsDataProvider(screenID);
        
        for (var i:int = 0; i < collection.length; i++) 
        {
            var item:Object = collection.getItemAt(i);
            view.addChild(item.control);
        }
    }
}
}