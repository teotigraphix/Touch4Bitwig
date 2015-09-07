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

package touch4bitwig.view.drawer
{

import com.teotigraphix.ui.mediator.AbstractMediator;

import starling.events.Event;

import touch4bitwig.model.IConfigurationModel;

public class TopDrawerMediator extends AbstractMediator
{
    [Inject]
    public var view:TopDrawer;

    [Inject]
    public var configurationModel:IConfigurationModel;

    public function TopDrawerMediator()
    {
    }

    override public function onRegister():void
    {
        super.onRegister();

        addViewListener(TopDrawer.EVENT_CONFIGURE, view_configureHandler);
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    private function view_configureHandler(event:Event):void
    {
        configurationModel.isInConfig = true;
    }
}
}
