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

package touch4bitwig.view
{

import feathers.core.DrawersApplication;

import flash.events.Event;

import org.robotlegs.starling.core.IMediatorMap;

import org.robotlegs.starling.mvcs.Context;

import starling.core.Starling;
import starling.events.Event;

import touch4bitwig.app.config.ApplicationContext;

import touch4bitwig.event.ApplicationEventType;
import touch4bitwig.event.UIModelEventType;
import touch4bitwig.model.IUIModel;
import touch4bitwig.view.AbstractMediator;
import touch4bitwig.view.ApplicationScreens;
import touch4bitwig.view.MainNavigator;
import touch4bitwig.view.drawer.TopDrawer;

/*

[Starling] Mask support requires 'depthAndStencil' to be enabled in the application descriptor.
[Starling] Initialization complete.
[Starling] Display Driver: DirectX9
new ApplicationContext()
BootstrapApplication.INITIALIZE()
BootstrapApplication.ADDED_TO_STAGE()
BootstrapNavigator.INITIALIZE()
BootstrapNavigator.ADDED_TO_STAGE()
    FrameworkContext.configureDescriptor()
    FrameworkContext.configureCore()
    FrameworkContext.configureApplication()
    ApplicationContext.configureService()
    ApplicationContext.configureModel()
    ApplicationContext.configureController()
    ApplicationContext.configureView()
new MainMediator()
    FrameworkContext.startupComplete()
    FrameworkContext.dispatchEventWith(STARTUP)
StartupCommand.execute()


... config, load ips, refresh osc


BootstrapNavigator.CREATION_COMPLETE()
    [Log] {MainMediator} , onRegister()
BootstrapApplication.CREATION_COMPLETE()
    [Log] {ApplicationController} , applicationCompleteHandler()
    [Log] {MainMediator} , context_applicationCompleteHandler()
    [Log] {MainMediator} , Show initial screen

*/

public class ApplicationMediator extends AbstractMediator
{
    private static const TAG:String = "ApplicationMediator";

    [Inject]
    public var application:DrawersApplication;

    [Inject]
    public var navigator:MainNavigator;

    [Inject]
    public var uiModel:IUIModel;

    public function ApplicationMediator()
    {
        trace("new ApplicationMediator()");
    }

    override public function onRegister():void
    {
        super.onRegister();

        // Comes from the ApplicationStartupCommand when all loading is finished
        // and the first screen is ready to be shown
        addContextListener(ApplicationEventType.APPLICATION_COMPLETE, context_applicationCompleteHandler);
        addContextListener(UIModelEventType.SCREEN_ID, context_screenIDHandler);
        addContextListener(UIModelEventType.BACK, context_backHandler);

        logger.log(TAG, "onRegister()");

        // For desktop
        if (Starling.current.nativeStage['nativeWindow'] != null)
        {
            Starling.current.nativeStage['nativeWindow'].addEventListener(
                    "closing", nativeWindow_closingHandler, false, 0, true);
        }

        //// var aspect:String = this.stage.stageWidth >= this.stage.stageHeight ? StageAspectRatio.LANDSCAPE :
        //// StageAspectRatio.PORTRAIT;

        application.topDrawer = new TopDrawer();
        mediatorMap.createMediator(application.topDrawer);

    }

    override public function onRemove():void
    {
        super.onRemove();
        logger.log(TAG, "onRemove()");
    }

    private function context_screenIDHandler(event:starling.events.Event, id:String):void
    {
        navigator.pushScreen(id);
    }

    private function context_applicationCompleteHandler(event:starling.events.Event):void
    {
        logger.log(TAG, "context_applicationCompleteHandler()");
        logger.log(TAG, "Show initial screen");

        uiModel.screenID = ApplicationScreens.SCREEN_MIXER;
    }

    private function context_backHandler(event:starling.events.Event):void
    {
        navigator.popScreen();
    }

    private function nativeWindow_closingHandler(event:flash.events.Event):void
    {

    }
}
}