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
import starling.events.Event;

import t4b.view.core.AbstractMediator;
import t4b.view.ui.main.ApplicationToolBar;

public class ApplicationToolBarMediator extends AbstractMediator
{
    [Inject]
    public var view:ApplicationToolBar;
    
    public function ApplicationToolBarMediator()
    {
        super();
    }
    
    override protected function initializeView():void
    {
        view.tabBar.dataProvider = model.ui.state.applicationToolBarDataProvider;
        view.tabBar.selectedIndex = model.ui.state.selectedContentIndex;
        view.tabBar.validate();
    }
    
    override protected function setupViewListeners():void
    {
        addViewListener(ApplicationToolBar.EVENT_TAB_CHANGE, view_tabChangedHandler);
    }
    
    override protected function setupContextListeners():void
    {
        //addContextListener(ProjectPreferencesUI.EVENT_SELECTED_CONTENT_INDEX_CHANGE, 
       //     context_selectedContentIndexChangedHandler);
    }
    
    private function context_selectedContentIndexChangedHandler(event:Event, index:int):void
    {
        view.tabBar.selectedIndex = index;
    }
    
    private function view_tabChangedHandler(event:Event, selectedIndex:int):void
    {
        model.ui.state.selectedContentIndex = selectedIndex;
    }
}
}