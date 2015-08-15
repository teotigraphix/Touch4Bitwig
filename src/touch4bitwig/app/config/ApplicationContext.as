package touch4bitwig.app.config
{

import org.robotlegs.starling.base.ContextEventType;
import org.robotlegs.starling.mvcs.Context;

import touch4bitwig.controller.ApplicationController;
import touch4bitwig.controller.command.ApplicationStartupCommand;
import touch4bitwig.model.state.GlobalModel;
import touch4bitwig.model.support.ApplicationModel;
import touch4bitwig.model.support.ConnectionInstance;
import touch4bitwig.model.support.DeviceModel;
import touch4bitwig.model.support.FrameModel;
import touch4bitwig.model.support.TrackModel;
import touch4bitwig.model.support.TransportModel;
import touch4bitwig.service.IConfigurationService;
import touch4bitwig.service.ILogger;
import touch4bitwig.service.IOSCService;
import touch4bitwig.service.support.ConfigurationService;
import touch4bitwig.service.support.Logger;
import touch4bitwig.service.support.OSCService;
import touch4bitwig.view.MainNavigator;
import touch4bitwig.view.mediator.MainMediator;
import touch4bitwig.view.mediator.TestScreenMediator;
import touch4bitwig.view.screen.TestScreen;

public class ApplicationContext extends Context
{

    public function ApplicationContext()
    {
        super(null, true);
        trace("new ApplicationContext()");
    }

    override public function startup():void
    {
        trace("    ApplicationContext.configureService()");
        configureService();
        trace("    ApplicationContext.configureModel()");
        configureModel();
        trace("    ApplicationContext.configureController()");
        configureController();
        trace("    ApplicationContext.configureView()");
        configureView();
        trace("    ApplicationContext.startupComplete()");
        startupComplete();
    }

    private function configureService():void
    {
        injector.mapSingletonOf(ILogger, Logger);
        injector.mapSingletonOf(IOSCService, OSCService);
        injector.mapSingletonOf(IConfigurationService, ConfigurationService);
    }

    private function configureModel():void
    {
        injector.mapSingleton(TrackModel);
        injector.mapSingleton(TransportModel);
        injector.mapSingleton(DeviceModel);
        injector.mapSingleton(FrameModel);

        injector.mapSingleton(ApplicationModel);
        injector.mapSingleton(ConnectionInstance);

        injector.mapSingleton(GlobalModel);
    }

    private function configureController():void
    {
        injector.mapSingleton(ApplicationController);
        commandMap.mapEvent(ContextEventType.STARTUP, ApplicationStartupCommand);
    }

    private function configureView():void
    {
        mediatorMap.mapView(MainNavigator, MainMediator);
        mediatorMap.mapView(TestScreen, TestScreenMediator);

    }

    private function startupComplete():void
    {
        trace("    ApplicationContext.dispatchEventWith(STARTUP)");
        dispatchEventWith(ContextEventType.STARTUP);
    }
}
}
