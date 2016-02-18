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
package t4b.view.ui._mediators
{

import com.teotigraphix.app.event.ApplicationEventType;

import starling.events.Event;

import t4b.model.IApplicationModel;
import t4b.view.core.AbstractMediator;
import t4b.view.ui.LoadingScreen;

public class LoadingScreenMediator extends AbstractMediator
{
    [Inject]
    public var view:LoadingScreen;

    [Inject]
    public var applicationModel:IApplicationModel;

    public function LoadingScreenMediator()
    {
    }

    override protected function initializeView():void
    {
        view.imageLoader.source = "images/loading-800.png";
        view.loadingLabel.text = "Loading...";
    }
    
    override protected function setupContextListeners():void
    {
        addContextListener(ApplicationEventType.LOG_STARTUP_MESSAGE, context_logStartupMessageHandler);
    }
    
    private function context_logStartupMessageHandler(event:Event, message:String):void
    {
        view.loadingLabel.text = message;
    }
    
    override protected function setupViewListeners():void
    {

    }

    override public function onRemove():void
    {
        super.onRemove();
    }
}
}
