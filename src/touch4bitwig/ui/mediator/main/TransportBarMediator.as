/**
 * Created by Teoti on 4/5/2015.
 */
package touch4bitwig.ui.mediator.main
{

import com.teotigraphix.ui.component.PopUpManagerTransitioner;

import feathers.core.PopUpManager;

import flash.geom.Point;

import org.robotlegs.starling.core.IInjector;

import starling.animation.Juggler;
import starling.display.DisplayObject;
import starling.display.Quad;
import starling.events.Event;

import touch4bitwig.app.config.ApplicationContext;
import touch4bitwig.event.TransportModelEventType;
import touch4bitwig.model.support.TransportModel;
import touch4bitwig.service.IOSCService;
import touch4bitwig.ui.component.main.TransportBar;
import touch4bitwig.ui.component.transport.TransportPopUp;
import touch4bitwig.ui.mediator.AbstractUIMediator;

public class TransportBarMediator extends AbstractUIMediator
{
    [Inject]
    public var juggler:Juggler;

    [Inject]
    public var injector:IInjector;

    [Inject]
    public var oscService:IOSCService;

    [Inject]
    public var transportModel:TransportModel;

    [Inject]
    public var view:TransportBar;

    private var _popUp:TransportPopUp;
    private var _instance:*;

    public function TransportBarMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();

        addContextListener(TransportModelEventType.POSITION_STRING_CHANGE, context_positionChangeHandler);
        addContextListener(TransportModelEventType.NUMERATOR_CHANGE, context_numeratorChangeHandler);
        addContextListener(TransportModelEventType.DENOMINATOR_CHANGE, context_denominatorChangeHandler);
        addContextListener(TransportModelEventType.TEMPO_RAW_CHANGE, context_tempoRawChangeHandler);

        addContextListener(TransportModelEventType.IS_PLAYING_CHANGE, context_transportPlayChangeHandler);
        addContextListener(TransportModelEventType.IS_RECORDING_CHANGE, context_transportRecordChangeHandler);
        addContextListener(TransportModelEventType.IS_AUTOWRITE_CHANGE, context_transportAutomationChangeHandler);
    }

    override public function onRegister():void
    {
        super.onRegister();

        addViewListener(TransportBar.EVENT_STOP_TRIGGERED, view_stopTriggeredHandler);
        addViewListener(TransportBar.EVENT_PLAY_CHANGE, view_playChangeHandler);
        addViewListener(TransportBar.EVENT_RECORD_CHANGE, view_recordChangeHandler);
        addViewListener(TransportBar.EVENT_AUTOMATION_CHANGE, view_automationChangeHandler);
        addViewListener(TransportBar.EVENT_POPUP_TRIGGERED, view_popupTriggeredHandler);

        //view.setPlaySelected(transportModel.transport.isPlaying);
        //view.setRecordSelected(transportModel.transport.isRecording);
        //view.setAutomationSelected(transportModel.transport.isAutowrite);
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    private function context_positionChangeHandler(event:Event, data:Object):void
    {
        trace(data.value);
    }

    private function context_numeratorChangeHandler(event:Event, data:Object):void
    {
        trace(data.value);
    }

    private function context_denominatorChangeHandler(event:Event, data:Object):void
    {
        trace(data.value);
    }

    private function context_tempoRawChangeHandler(event:Event, data:Object):void
    {
        trace(data.value);
    }

    private function context_transportPlayChangeHandler(event:Event, data:Object):void
    {
        view.isPlaying = data.value;
    }

    private function context_transportRecordChangeHandler(event:Event, data:Object):void
    {
        view.isRecording = data.value;
    }

    private function context_transportAutomationChangeHandler(event:Event, data:Object):void
    {
        view.isAutomating = data.value;
    }

    private function view_playChangeHandler(event:Event, selected:Boolean):void
    {
        oscService.send("/play");
    }

    private function view_recordChangeHandler(event:Event, selected:Boolean):void
    {
        oscService.send("/record");
    }

    private function view_automationChangeHandler(event:Event, selected:Boolean):void
    {
        oscService.send("/autowrite");
    }

    private function view_stopTriggeredHandler(event:Event):void
    {
        oscService.sendInt("/stop", 1);
    }

    private function view_popupTriggeredHandler(event:Event):void
    {
        if (_popUp != null)
        {
            PopUpManagerTransitioner.removePopUp(_popUp, 1);
            ApplicationContext(eventDispatcher).getMediatorMap().removeMediator(_instance);
            _instance = null;
            _popUp = null;
            return;
        }
        var p:Point = new Point(view.x, view.y);
        p = view.parent.localToGlobal(p);
        _popUp = new TransportPopUp();


        PopUpManager.addPopUp(_popUp, false, false, function ():DisplayObject
        {
            var quad:Quad = new Quad(100, 100, 0x000000);
            quad.alpha = 0.1;
            return quad;
        });

        _popUp.validate();

        _popUp.x = p.x;
        _popUp.y = p.y + view.height + 1;

        _instance = ApplicationContext(eventDispatcher).getMediatorMap().createMediator(_popUp);
    }
}
}
