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
import com.teotigraphix.controller.ICommandLauncher;
import com.teotigraphix.model.IDeviceModel;
import com.teotigraphix.model.impl.DeviceModelImpl;
import com.teotigraphix.ui.screen.IScreenLauncher;
import com.teotigraphix.ui.screen.IScreenNavigator;

import feathers.core.DrawersApplication;

import org.robotlegs.starling.base.ContextEventType;

import touch4bitwig.controller.ApplicationController;
import touch4bitwig.controller.CommandLauncher;
import touch4bitwig.controller.OSCMessageController;
import touch4bitwig.controller.ScreenLauncher;
import touch4bitwig.controller.UIController;
import touch4bitwig.controller.command.ApplicationStartupCommand;
import touch4bitwig.controller.command.service.CloseOSCConnectionCommand;
import touch4bitwig.controller.command.service.ConnectAndStartOSCService;
import touch4bitwig.event.ServiceCommandType;
import touch4bitwig.model.IApplicationModel;
import touch4bitwig.model.IConfigurationModel;
import touch4bitwig.model.IOSCModel;
import touch4bitwig.model.IUIModel;
import touch4bitwig.model.impl.ApplicationModelImpl;
import touch4bitwig.model.impl.ConfigurationModelImpl;
import touch4bitwig.model.impl.OSCModelImpl;
import touch4bitwig.model.impl.UIModelImpl;
import touch4bitwig.service.IConfigurationService;
import touch4bitwig.service.IOSCService;
import touch4bitwig.service.support.ConfigurationService;
import touch4bitwig.service.support.OSCService;
import touch4bitwig.ui.component.cliplauncher.ClipLauncher;
import touch4bitwig.ui.component.cliplauncher.ClipLauncherMediator;
import touch4bitwig.ui.component.configuration.ConfigurationForm;
import touch4bitwig.ui.component.configuration.ConfigurationFormMediator;
import touch4bitwig.ui.component.device.DeviceBankPager;
import touch4bitwig.ui.component.device.DeviceBankPagerMediator;
import touch4bitwig.ui.component.device.DeviceNavigationControl;
import touch4bitwig.ui.component.device.DeviceNavigationControlMediator;
import touch4bitwig.ui.component.device.DeviceSelectBar;
import touch4bitwig.ui.component.device.DeviceSelectBarMediator;
import touch4bitwig.ui.component.main.MainHeader;
import touch4bitwig.ui.component.main.MainHeaderMediator;
import touch4bitwig.ui.component.mixer.MixerBank;
import touch4bitwig.ui.component.mixer.MixerBankMediator;
import touch4bitwig.ui.component.panel.PanelLayoutGroup;
import touch4bitwig.ui.component.panel.PanelLayoutGroupMediator;
import touch4bitwig.ui.component.panel.PanelSubToggleGroup;
import touch4bitwig.ui.component.panel.PanelSubToggleGroupMediator;
import touch4bitwig.ui.component.panel.PanelToggleGroup;
import touch4bitwig.ui.component.panel.PanelToggleGroupMediator;
import touch4bitwig.ui.component.track.TrackChannelBank;
import touch4bitwig.ui.component.track.TrackChannelBankMediator;
import touch4bitwig.ui.component.track.TrackNavigationControl;
import touch4bitwig.ui.component.track.TrackNavigationControlMediator;
import touch4bitwig.ui.component.transport.TransportBar;
import touch4bitwig.ui.component.transport.TransportBarMediator;
import touch4bitwig.ui.component.transport.TransportDisplay;
import touch4bitwig.ui.component.transport.TransportDisplayMediator;
import touch4bitwig.ui.component.transport.TransportPopUp;
import touch4bitwig.ui.component.transport.TransportPopUpMediator;
import touch4bitwig.view.ApplicationMediator;
import touch4bitwig.view.MainNavigator;
import touch4bitwig.view.drawer.TopDrawer;
import touch4bitwig.view.drawer.TopDrawerMediator;

/**
 * The main application model context for the IOC container.
 */
public class ApplicationContext extends FrameworkContext
{
    //--------------------------------------------------------------------------
    // Public :: Variables
    //--------------------------------------------------------------------------

    public var application:DrawersApplication;

    //--------------------------------------------------------------------------
    // Constructor
    //--------------------------------------------------------------------------

    public function ApplicationContext()
    {
        super(null, true);
        trace("new ApplicationContext()");
    }

    //--------------------------------------------------------------------------
    // Overridden : Methods
    //--------------------------------------------------------------------------

    override protected function configureDescriptor():void
    {
        injector.mapSingletonOf(ApplicationDescriptor, ApplicationDescriptorImpl);
    }

    override protected function configureApplication():void
    {
        injector.mapValue(DrawersApplication, application);
        injector.mapValue(MainNavigator, contextView);

        trace("    ApplicationContext.configureService()");
        configureService();
        trace("    ApplicationContext.configureModel()");
        configureModel();
        trace("    ApplicationContext.configureController()");
        configureController();
        trace("    ApplicationContext.configureView()");
        configureView();
    }

    //--------------------------------------------------------------------------
    // Private : Methods
    //--------------------------------------------------------------------------

    private function configureService():void
    {
        injector.mapSingletonOf(IOSCService, OSCService);
        injector.mapSingletonOf(IConfigurationService, ConfigurationService);
    }

    private function configureModel():void
    {
        injector.mapSingletonOf(IApplicationModel, ApplicationModelImpl);

        // Framework, TODO move this
        injector.mapSingletonOf(IDeviceModel, DeviceModelImpl);

        injector.mapSingletonOf(IConfigurationModel, ConfigurationModelImpl);
        injector.mapSingletonOf(IOSCModel, OSCModelImpl);
        injector.mapSingletonOf(IUIModel, UIModelImpl);

        injector.mapValue(IScreenNavigator, contextView);
    }

    private function configureController():void
    {
        injector.mapSingleton(ApplicationController);
        injector.mapSingleton(UIController);
        injector.mapSingleton(OSCMessageController);

        injector.mapSingletonOf(ICommandLauncher, CommandLauncher);
        injector.mapSingletonOf(IScreenLauncher, ScreenLauncher);

        commandMap.mapEvent(ContextEventType.STARTUP, ApplicationStartupCommand);
        ;
        commandMap.mapEvent(ServiceCommandType.CONNECT_AND_START, ConnectAndStartOSCService);
        commandMap.mapEvent(ServiceCommandType.CLOSE_OSC_CONNECTION, CloseOSCConnectionCommand);
    }

    private function configureView():void
    {
        mediatorMap.mapView(MainNavigator, ApplicationMediator);
        mediatorMap.mapView(MainHeader, MainHeaderMediator);

        mediatorMap.mapView(TrackNavigationControl, TrackNavigationControlMediator);

        // Drawers
        mediatorMap.mapView(TopDrawer, TopDrawerMediator);

        // ConfigurationScreen
        mediatorMap.mapView(ConfigurationForm, ConfigurationFormMediator);

        // MixerScreen

        mediatorMap.mapView(MixerBank, MixerBankMediator);

        // TransportScreen
        mediatorMap.mapView(TransportBar, TransportBarMediator);
        mediatorMap.mapView(TransportPopUp, TransportPopUpMediator);
        mediatorMap.mapView(TransportDisplay, TransportDisplayMediator);

        // PanelsScreen
        mediatorMap.mapView(PanelLayoutGroup, PanelLayoutGroupMediator);
        mediatorMap.mapView(PanelSubToggleGroup, PanelSubToggleGroupMediator);
        mediatorMap.mapView(PanelToggleGroup, PanelToggleGroupMediator);

        // ClipsScreen
        mediatorMap.mapView(ClipLauncher, ClipLauncherMediator);

        // DeviceScreen
        mediatorMap.mapView(DeviceBankPager, DeviceBankPagerMediator);
        mediatorMap.mapView(DeviceNavigationControl, DeviceNavigationControlMediator);
        mediatorMap.mapView(DeviceSelectBar, DeviceSelectBarMediator);
        mediatorMap.mapView(TrackChannelBank, TrackChannelBankMediator);
    }
}
}
