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
package t4b.configuration
{
import com.teotigraphix.app.command.IStartupFactory;
import com.teotigraphix.app.command.UncaughtErrorCommand;
import com.teotigraphix.app.configuration.ApplicationDescriptor;
import com.teotigraphix.app.configuration.ApplicationPermissions;
import com.teotigraphix.app.configuration.IApplicationPermissions;
import com.teotigraphix.app.ui.BootstrapNavigator;
import com.teotigraphix.app.ui.IBootstrapApplication;
import com.teotigraphix.controller.ICommandLauncher;
import com.teotigraphix.model.IApplicationSettings;
import com.teotigraphix.model.IDeviceModel;
import com.teotigraphix.model.impl.AbstractApplicationSettings;
import com.teotigraphix.model.impl.DeviceModelImpl;
import com.teotigraphix.service.IFileService;
import com.teotigraphix.service.ILogger;
import com.teotigraphix.service.impl.FileServiceImpl;
import com.teotigraphix.service.impl.LoggerImpl;
import com.teotigraphix.ui.IScreenLauncher;
import com.teotigraphix.ui.IUIController;
import com.teotigraphix.ui.IUIFactory;
import com.teotigraphix.ui.IUIState;
import com.teotigraphix.ui.component.IScreenNavigator;

import flash.display.LoaderInfo;
import flash.events.UncaughtErrorEvent;

import org.robotlegs.starling.base.ContextEventType;
import org.robotlegs.starling.mvcs.Context;

import starling.animation.Juggler;
import starling.core.Starling;

import t4b.controller.ApplicationController;
import t4b.controller.UIFactory;
import t4b.controller.UIState;

public class ApplicationContext extends Context
{
    //----------------------------------
    // Minimal Impl
    //----------------------------------
    
    public var applicationDescriptorClass:Class = ApplicationDescriptor;
    public var applicationSettingsClass:Class = AbstractApplicationSettings; // IFileService, ApplicationDescriptor
    public var $loggerClass:Class = LoggerImpl; // NO DEPS
    public var _fileServiceClass:Class = FileServiceImpl; // ApplicationDescriptor DEP
    public var $deviceModelClass:Class = DeviceModelImpl; // NO DEPS
    public var startupCommand:Class;
    
    public var applicationClass:Class;
    public var applicationMediatorClass:Class;
    
    public var applicationModelAPI:Class;
    public var applicationModelClass:Class;
    
    //----------------------------------
    // App Controller
    //----------------------------------
    
    public var screenLauncherClass:Class;
    public var commandLauncherClass:Class;
    public var uiControllerClass:Class;
    
    //----------------------------------
    // App UI
    //----------------------------------
    
    private var _navigator:IScreenNavigator;
    
    public function get navigator():IScreenNavigator
    {
        return _navigator;
    }
    
    public function set navigator(value:IScreenNavigator):void
    {
        _navigator = value;
        if (_navigator is BootstrapNavigator)
        {
            BootstrapNavigator(_navigator).eventDispatcher = this;
        }
    }
    
    //--------------------------------------------------------------------------
    // Constructor
    //--------------------------------------------------------------------------
    
    public function ApplicationContext()
    {
        super(null, false);
    }
    
    // Called in the constructor
    override protected function mapInjections():void
    {
        //injector.mapValue(IReflector, reflector);
        //injector.mapValue(IInjector, injector);
        //injector.mapValue(EventDispatcher, eventDispatcher);
        //injector.mapValue(DisplayObjectContainer, contextView);
        //injector.mapValue(ICommandMap, commandMap);
        //injector.mapValue(IMediatorMap, mediatorMap);
        //injector.mapValue(IViewMap, viewMap);
        //injector.mapClass(IEventMap, EventMap)
        
        trace("ApplicationContext.mapInjections()");
        
        super.mapInjections();
    }
    
    /**
     * Template startup method.
     *
     * - #configureCore()
     * - #configureApplication()
     * - #startupComplete()
     */
    override public function startup():void
    {
        trace("    ApplicationContext.configureDescriptor()");
        injector.mapSingletonOf(ApplicationDescriptor, applicationDescriptorClass);
        injector.mapSingletonOf(IApplicationPermissions, ApplicationPermissions);
        
        trace("    ApplicationContext.configureCoreNonDependencies()");
        configureCoreNonDependencies();
        
        trace("    ApplicationContext.configureCore()");
        configureCore();
        
        injector.mapValue(IScreenNavigator, navigator);
        
        trace("    ApplicationContext.configureApplication()");
        configureApplication();

        mediatorMap.mapView(applicationClass, applicationMediatorClass);
        
        trace("    ApplicationContext.startupComplete()");
        startupComplete();
    }
    
    protected function configureCoreNonDependencies():void
    {
        injector.mapValue(Juggler, Starling.juggler);
        injector.mapValue(IBootstrapApplication, contextView); 
        
        injector.mapSingletonOf(ILogger, $loggerClass);
        injector.mapSingletonOf(IFileService, _fileServiceClass);
        injector.mapSingletonOf(IApplicationSettings, applicationSettingsClass);
        injector.mapSingletonOf(IDeviceModel, $deviceModelClass);
        
        if (Starling.current != null)
        {
            var loaderInfo:LoaderInfo = Starling.current.nativeStage.loaderInfo
            Starling.current.nativeStage.loaderInfo.content.loaderInfo.uncaughtErrorEvents.addEventListener(
                UncaughtErrorEvent.UNCAUGHT_ERROR, uncaughtErrorEvents_uncaughtErrorEventHandler);
            
            commandMap.mapEvent(UncaughtErrorEvent.UNCAUGHT_ERROR, UncaughtErrorCommand);
        }
    }
    
    protected function configureCore():void
    {
        injector.mapSingletonOf(IStartupFactory, StartupFactory);
        injector.mapSingletonOf(IScreenLauncher, screenLauncherClass);
        injector.mapSingletonOf(ICommandLauncher, commandLauncherClass);
        injector.mapSingletonOf(IUIController, uiControllerClass);
    }
    
    protected function configureApplication():void
    {
        trace("    ApplicationContext.configureService()");
        configureService();
        
        trace("    ApplicationContext.configureModel()");
        configureModel();
        
        trace("    ApplicationContext Configure StartupCommand Class");
        commandMap.mapEvent(ContextEventType.STARTUP, startupCommand);
        
        trace("    ApplicationContext.configureController()");
        configureController();
        
        trace("    ApplicationContext.configureApplicationModel()");
        if (applicationModelClass != null)
        {
            var model:Object = injector.instantiate(applicationModelClass);

            if (applicationModelAPI != null) 
            {
                injector.mapValue(applicationModelAPI, model);
            }
        }
        
        trace("    ApplicationContext.configureView()");
        configureView();
    }
    
    
    /**
     * Map all services.
     *
     * Services only listen to their own operation/external service events.
     *
     * Return values should always be IStepCommand or IStepSequence so clients can chain calls.
     */
    protected function configureService():void
    {
    }
    
    /**
     * Map all models.
     *
     * Models never listen to outside events, only to their internal operations.
     *
     * Models dispatch context level events for global application messaging.
     *
     * Models generally act as a proxy to internal state that could be serialized and deserialized
     * during the application's runtime.
     */
    protected function configureModel():void
    {
        injector.mapSingletonOf(IUIState, UIState);
        injector.mapSingletonOf(IUIFactory, UIFactory);
    }
    
    /**
     * Map all controllers and executable Commands in the application.
     *
     * Controllers handle context events that may be sent by UI, model or service operations.
     *
     * Controllers are the mediator to non-view/screen model changes.
     *
     * Controllers also can call commands and/or have public API that set off app actions.
     */
    protected function configureController():void
    {
        injector.mapSingleton(ApplicationController);
    }
    
    /**
     * Map all UI view/mediator relationships.
     */
    protected function configureView():void
    {
    }
    
    protected function startupComplete():void
    {
        trace("    ApplicationContext.dispatchEventWith(STARTUP)");
        // launches the startupCommandClass
        dispatchEventWith(ContextEventType.STARTUP);
    }
    
    private function uncaughtErrorEvents_uncaughtErrorEventHandler(event:UncaughtErrorEvent):void
    {
        event.preventDefault();
        trace("    ApplicationContext.uncaughtErrorEvents_uncaughtErrorEventHandler()", event);
        var error:* = event.error;
        if(error is Error)
        {
            var errorError:Error = Error(error);
            dispatchEventWith(UncaughtErrorEvent.UNCAUGHT_ERROR, false, errorError.message);
        }
        else
        {
            dispatchEventWith(UncaughtErrorEvent.UNCAUGHT_ERROR, false, error);
        }
    }
}
}