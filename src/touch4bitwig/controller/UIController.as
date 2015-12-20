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

package touch4bitwig.controller {

import com.teotigraphix.controller.impl.AbstractController;
import com.teotigraphix.ui.component.Toast;

import starling.events.Event;

import touch4bitwig.model.IConfigurationModel;
import touch4bitwig.model.IUIModel;
import touch4bitwig.model.event.BitwigApplicationEventType;
import touch4bitwig.model.event.ConfigurationModelEventType;
import touch4bitwig.model.event.UIModelEventType;
import touch4bitwig.view.ApplicationScreens;
import touch4bitwig.view.MainNavigator;

/**
 * Mediates application level context events for the user interface.
 */
public class UIController extends AbstractController {
    //--------------------------------------------------------------------------
    // Inject
    //--------------------------------------------------------------------------

    public function UIController() {
    }
    [Inject]
    public var navigator:MainNavigator;
    [Inject]
    public var uiModel:IUIModel;

    //--------------------------------------------------------------------------
    // Constructor
    //--------------------------------------------------------------------------
    [Inject]
    public var configurationModel:IConfigurationModel;

    //--------------------------------------------------------------------------
    // Overridden :: Methods
    //--------------------------------------------------------------------------

    override protected function onRegister():void {
        super.onRegister();

        addContextListener(UIModelEventType.BACK, context_backHandler);
        addContextListener(ConfigurationModelEventType.START_COMPLETE, context_startCompleteHandler);
        addContextListener(ConfigurationModelEventType.IS_IN_CONFIG_CHANGE, context_isInConfigHandler);
        addContextListener(BitwigApplicationEventType.FLUSH_COMPLETE, context_flushCompleteHandler);

        // TEMP
        addContextListener(BitwigApplicationEventType.PROJECT_NAME, context_projectNameHandler);
    }

    //--------------------------------------------------------------------------
    // Private :: Handlers
    //--------------------------------------------------------------------------

    private function context_isInConfigHandler(event:Event, isConfig:Boolean):void {
        if (isConfig) {

            // Config button TopDrawer trigger
            dispatchWith(ApplicationCommands.SHOW_CONFIGURATION_SCREEN);
        }
        else {
            if (uiModel.screenID == null) {
                uiModel.screenID = ApplicationScreens.SCREEN_MIXER;
            }
            else {
                navigator.popScreen();
            }
        }
    }

    private function context_projectNameHandler(event:Event, data:Object):void {
        Toast.show("Project change to " + data.value, 2000);
    }

    private function context_startCompleteHandler(event:Event):void {
        //configurationModel.isInConfig = false;
    }

    private function context_flushCompleteHandler(event:Event):void {
        uiModel.refresh();

        if (navigator.activeScreenID == ApplicationScreens.SCREEN_CONFIGURATION) {
            configurationModel.isInConfig = false;
        }

    }

    private function context_backHandler(event:Event):void {
        navigator.popScreen();
    }

}
}
