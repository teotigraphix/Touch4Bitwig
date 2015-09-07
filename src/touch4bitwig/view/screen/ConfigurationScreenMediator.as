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

package touch4bitwig.view.screen
{

import starling.events.Event;

import touch4bitwig.model.IConfigurationModel;
import touch4bitwig.model.IUIModel;
import touch4bitwig.view.AbstractMediator;
import touch4bitwig.view.MainNavigator;

public class ConfigurationScreenMediator extends AbstractMediator
{
    [Inject]
    public var screen:ConfigurationScreen;

    [Inject]
    public var configurationModel:IConfigurationModel;

    [Inject]
    public var uiModel:IUIModel;

    [Inject]
    public var navigator:MainNavigator;

    public function ConfigurationScreenMediator()
    {
    }

    override public function onRegister():void
    {
        super.onRegister();

        screen.ipList.dataProvider = configurationModel.ipDataProvider;
        screen.isInConfig = navigator.activeScreen == null;

        addViewListener(ConfigurationScreen.EVENT_BACK, view_backHandler);
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    private function view_backHandler(event:Event):void
    {
        configurationModel.isInConfig = false;
    }
}
}
