package touch4bitwig.view.mediator
{

import flash.events.Event;

import starling.core.Starling;
import starling.events.Event;

import touch4bitwig.event.ApplicationEventType;
import touch4bitwig.service.IOSCService;
import touch4bitwig.view.MainNavigator;
import touch4bitwig.view.screen.ApplicationScreens;

/*

[Starling] Mask support requires 'depthAndStencil' to be enabled in the application descriptor.
[Starling] Initialization complete.
[Starling] Display Driver: DirectX9
new ApplicationContext()
BootstrapApplication.INITIALIZE()
BootstrapApplication.ADDED_TO_STAGE()
BootstrapNavigator.INITIALIZE()
BootstrapNavigator.ADDED_TO_STAGE()
    ApplicationContext.configureService()
    ApplicationContext.configureModel()
    ApplicationContext.configureView()
new MainMediator()
    ApplicationContext.startupComplete()
    FrameworkContext.dispatchEventWith(STARTUP)
BootstrapNavigator.CREATION_COMPLETE()
{MainMediator} onRegister()
BootstrapApplication.CREATION_COMPLETE()

*/

public class MainMediator extends AbstractMediator
{
    private static const TAG:String = "MainMediator";

    [Inject]
    public var navigator:MainNavigator;

    [Inject]
    public var oscService:IOSCService;

    public function MainMediator()
    {
        trace("new MainMediator()");
    }

    override public function onRegister():void
    {
        super.onRegister();

        // Comes from the ApplicationStartupCommand when all loading is finished
        // and the first screen is ready to be shown
        addContextListener(ApplicationEventType.APPLICATION_COMPLETE, context_applicationCompleteHandler);

        logger.log(TAG, "onRegister()");

        // For desktop
        if (Starling.current.nativeStage['nativeWindow'] != null)
        {
            Starling.current.nativeStage['nativeWindow'].addEventListener(
                    "closing", nativeWindow_closingHandler, false, 0, true);
        }

        //// var aspect:String = this.stage.stageWidth >= this.stage.stageHeight ? StageAspectRatio.LANDSCAPE :
        //// StageAspectRatio.PORTRAIT;

        Starling.juggler.delayCall(function ():void
                                   {
                                       oscService.flush();
                                   }, 0.2);
    }

    override public function onRemove():void
    {
        super.onRemove();
        logger.log(TAG, "onRemove()");
    }

    private function context_applicationCompleteHandler(event:starling.events.Event):void
    {
        logger.log(TAG, "context_applicationCompleteHandler()");
        logger.log(TAG, "Show initial screen");

        navigator.pushScreen(ApplicationScreens.SCREEN_MIXER);
    }

    private function nativeWindow_closingHandler(event:flash.events.Event):void
    {

    }
}
}
