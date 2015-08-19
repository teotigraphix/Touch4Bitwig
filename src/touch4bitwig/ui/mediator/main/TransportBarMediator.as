/**
 * Created by Teoti on 4/5/2015.
 */
package touch4bitwig.ui.mediator.main
{

import com.teotigraphix.bitwig.app.AppContext;
import com.teotigraphix.bitwig.event.TransportModelEventType;
import com.teotigraphix.bitwig.model.TransportModel;
import com.teotigraphix.bitwig.service.IOSCService;
import com.teotigraphix.bitwig.ui.component.main.TransportBar;
import com.teotigraphix.bitwig.ui.component.transport.TransportPopUp;
import com.teotigraphix.bitwig.ui.mediator.BitwigTouchMediator;
import com.teotigraphix.ui.component.PopUpManagerTransitioner;

import feathers.core.PopUpManager;

import flash.geom.Point;

import org.robotlegs.starling.core.IInjector;

import starling.animation.Juggler;
import starling.display.DisplayObject;
import starling.display.Quad;
import starling.events.Event;

public class TransportBarMediator extends BitwigTouchMediator
{
    [Inject]
    public var juggler:Juggler;

    [Inject]
    public var injector:IInjector;

    [Inject]
    public var oscService:IOSCService;

    [Inject]
    public var transportModel:TransportModel;

    private var view:TransportBar;
    private var _popUp:TransportPopUp;
    private var _instance:*;

    public function TransportBarMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();

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

        view.setPlaySelected(transportModel.transport.isPlaying);
        view.setRecordSelected(transportModel.transport.isRecording);
        view.setAutomationSelected(transportModel.transport.isAutowrite);
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    override public function setViewComponent(viewComponent:Object):void
    {
        super.setViewComponent(viewComponent);
        view = TransportBar(viewComponent);
    }

    override public function preRemove():void
    {
        super.preRemove();
        view = null;
    }

    private function context_transportPlayChangeHandler(event:Event, data:Object):void
    {
        view.setPlaySelected(data.value);
    }

    private function context_transportRecordChangeHandler(event:Event, data:Object):void
    {
        view.setRecordSelected(data.value);
    }

    private function context_transportAutomationChangeHandler(event:Event, data:Object):void
    {
        view.setAutomationSelected(data.value);
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
            AppContext(eventDispatcher).getMediatorMap().removeMediator(_instance);
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
        _popUp.x = p.x;
        _popUp.y = p.y + view.height + 1;

        _instance = AppContext(eventDispatcher).getMediatorMap().createMediator(_popUp);
        //_instance.setViewComponent(_popUp);
        //_instance.onRegister();
    }
}
}
