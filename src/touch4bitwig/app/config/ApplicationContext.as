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

package touch4bitwig.app.config
{

import com.teotigraphix.app.config.ApplicationDescriptor;
import com.teotigraphix.app.config.FrameworkContext;

import org.robotlegs.starling.base.ContextEventType;

import touch4bitwig.controller.ApplicationController;
import touch4bitwig.controller.command.ApplicationStartupCommand;
import touch4bitwig.model.IConfigurationModel;
import touch4bitwig.model.IOSCModel;
import touch4bitwig.model.IUIModel;
import touch4bitwig.model.support.ConfigurationModel;
import touch4bitwig.model.support.ConnectionInstance;
import touch4bitwig.model.support.OSCModel;
import touch4bitwig.model.support.UIModel;
import touch4bitwig.service.IConfigurationService;
import touch4bitwig.service.IOSCService;
import touch4bitwig.service.support.ConfigurationService;
import touch4bitwig.service.support.OSCService;
import touch4bitwig.ui.component.frame.PanelLayoutGroup;
import touch4bitwig.ui.component.frame.PanelLayoutGroupMediator;
import touch4bitwig.ui.component.frame.PanelSubToggleGroup;
import touch4bitwig.ui.component.frame.PanelSubToggleGroupMediator;
import touch4bitwig.ui.component.frame.PanelToggleGroup;
import touch4bitwig.ui.component.frame.PanelToggleGroupMediator;
import touch4bitwig.ui.component.main.MainHeader;
import touch4bitwig.ui.component.main.MainHeaderMediator;
import touch4bitwig.ui.component.mixer.MixerBank;
import touch4bitwig.ui.component.mixer.MixerBankMediator;
import touch4bitwig.ui.component.transport.TransportBar;
import touch4bitwig.ui.component.transport.TransportBarMediator;
import touch4bitwig.ui.component.transport.TransportDisplay;
import touch4bitwig.ui.component.transport.TransportDisplayMediator;
import touch4bitwig.ui.component.transport.TransportPopUp;
import touch4bitwig.ui.component.transport.TransportPopUpMediator;
import touch4bitwig.view.MainNavigator;
import touch4bitwig.view.screen.ConfigurationScreen;
import touch4bitwig.view.screen.ConfigurationScreenMediator;
import touch4bitwig.view.screen.MainMediator;
import touch4bitwig.view.screen.MixerScreen;
import touch4bitwig.view.screen.MixerScreenMediator;
import touch4bitwig.view.screen.PanelsScreen;
import touch4bitwig.view.screen.PanelsScreenMediator;

public class ApplicationContext extends FrameworkContext
{

    public function ApplicationContext()
    {
        super(null, true);
        trace("new ApplicationContext()");
    }

    override protected function configureDescriptor():void
    {
        injector.mapSingletonOf(ApplicationDescriptor, ApplicationDescriptorImpl);
    }

    override protected function configureApplication():void
    {
        trace("    ApplicationContext.configureService()");
        configureService();
        trace("    ApplicationContext.configureModel()");
        configureModel();
        trace("    ApplicationContext.configureController()");
        configureController();
        trace("    ApplicationContext.configureView()");
        configureView();
    }

    private function configureService():void
    {
        injector.mapSingletonOf(IOSCService, OSCService);
        injector.mapSingletonOf(IConfigurationService, ConfigurationService);
    }

    private function configureModel():void
    {
        injector.mapSingletonOf(IConfigurationModel, ConfigurationModel);

        injector.mapSingleton(ConnectionInstance);
        injector.mapSingletonOf(IOSCModel, OSCModel);

        injector.mapSingletonOf(IUIModel, UIModel);
    }

    private function configureController():void
    {
        injector.mapSingleton(ApplicationController);
        commandMap.mapEvent(ContextEventType.STARTUP, ApplicationStartupCommand);
    }

    private function configureView():void
    {
        mediatorMap.mapView(MainNavigator, MainMediator);
        mediatorMap.mapView(MainHeader, MainHeaderMediator);

        // ConfigurationScreen
        mediatorMap.mapView(ConfigurationScreen, ConfigurationScreenMediator);

        // MixerScreen
        mediatorMap.mapView(MixerScreen, MixerScreenMediator);
        mediatorMap.mapView(MixerBank, MixerBankMediator);

        // TransportScreen
        mediatorMap.mapView(TransportBar, TransportBarMediator);
        mediatorMap.mapView(TransportPopUp, TransportPopUpMediator);
        mediatorMap.mapView(TransportDisplay, TransportDisplayMediator);

        // PanelsScreen
        mediatorMap.mapView(PanelsScreen, PanelsScreenMediator);
        mediatorMap.mapView(PanelLayoutGroup, PanelLayoutGroupMediator);
        mediatorMap.mapView(PanelSubToggleGroup, PanelSubToggleGroupMediator);
        mediatorMap.mapView(PanelToggleGroup, PanelToggleGroupMediator);
    }

}
}
