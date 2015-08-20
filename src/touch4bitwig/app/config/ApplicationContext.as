package touch4bitwig.app.config
{

import com.teotigraphix.app.config.ApplicationDescriptor;
import com.teotigraphix.app.config.FrameworkContext;

import org.robotlegs.starling.base.ContextEventType;

import touch4bitwig.controller.ApplicationController;
import touch4bitwig.controller.command.ApplicationStartupCommand;
import touch4bitwig.model.state.GlobalModel;
import touch4bitwig.model.support.ApplicationModel;
import touch4bitwig.model.support.ConnectionInstance;
import touch4bitwig.model.support.DeviceModel;
import touch4bitwig.model.support.FrameModel;
import touch4bitwig.model.support.TrackModel;
import touch4bitwig.model.support.TransportModel;
import touch4bitwig.model.support.UIModel;
import touch4bitwig.service.IConfigurationService;
import touch4bitwig.service.IOSCService;
import touch4bitwig.service.support.ConfigurationService;
import touch4bitwig.service.support.OSCService;
import touch4bitwig.ui.component.mixer.MixerBank;
import touch4bitwig.ui.mediator.mixer.MixerBankMediator;
import touch4bitwig.view.MainNavigator;
import touch4bitwig.view.mediator.MainMediator;
import touch4bitwig.view.mediator.MixerScreenMediator;
import touch4bitwig.view.mediator.TestScreenMediator;
import touch4bitwig.view.screen.MixerScreen;
import touch4bitwig.view.screen.TestScreen;

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
        injector.mapSingleton(TrackModel);
        injector.mapSingleton(TransportModel);
        injector.mapSingleton(DeviceModel);
        injector.mapSingleton(FrameModel);

        injector.mapSingleton(ApplicationModel);
        injector.mapSingleton(ConnectionInstance);

        injector.mapSingleton(GlobalModel);
        injector.mapSingleton(UIModel);
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

        // MixerScreen
        mediatorMap.mapView(MixerScreen, MixerScreenMediator);
        mediatorMap.mapView(MixerBank, MixerBankMediator);

    }

}
}
