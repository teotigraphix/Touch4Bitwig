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
package t4b.view.core
{

import com.teotigraphix.app.event.ApplicationEventType;
import com.teotigraphix.app.ui.IBootstrapApplication;

import starling.events.Event;

public class ApplicationMediator extends AbstractMediator
{
    [Inject]
    public var view:IBootstrapApplication;
    
    public function ApplicationMediator()
    {
    }

    override public function onRegister():void
    {
        super.onRegister();
    }

    override protected function initializeView():void
    {
    }

    override protected function setupViewListeners():void
    {
    }

    override protected function setupContextListeners():void
    {
        addContextListener(ApplicationEventType.APPLICATION_COMPLETE, context_applicationCompleteHandler);
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    override protected function onOrientationChange(isLandscape:Boolean, isTablet:Boolean):void
    {
        super.onOrientationChange(isLandscape, isTablet);
    }

    private function context_applicationCompleteHandler(event:Event):void
    {
        model.screens.goToMain();
    }
}
}