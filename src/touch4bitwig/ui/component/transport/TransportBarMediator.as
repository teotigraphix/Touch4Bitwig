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

package touch4bitwig.ui.component.transport
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
import touch4bitwig.model.event.BitwigTransportEventType;
import touch4bitwig.ui.AbstractUIMediator;

public class TransportBarMediator extends AbstractUIMediator
{
    [Inject]
    public var juggler:Juggler;

    [Inject]
    public var injector:IInjector;

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

        addContextListener(BitwigTransportEventType.POSITION_STRING_CHANGE, context_positionChangeHandler);
        addContextListener(BitwigTransportEventType.NUMERATOR_CHANGE, context_numeratorChangeHandler);
        addContextListener(BitwigTransportEventType.DENOMINATOR_CHANGE, context_denominatorChangeHandler);
        addContextListener(BitwigTransportEventType.TEMPO_RAW_CHANGE, context_tempoRawChangeHandler);

        addContextListener(BitwigTransportEventType.IS_PLAYING_CHANGE, context_transportPlayChangeHandler);
        addContextListener(BitwigTransportEventType.IS_RECORDING_CHANGE, context_transportRecordChangeHandler);
        addContextListener(BitwigTransportEventType.IS_AUTO_WRITE_CHANGE, context_transportAutomationChangeHandler);
    }

    override public function onRegister():void
    {
        super.onRegister();

        addViewListener(TransportBar.EVENT_STOP_TRIGGERED, view_stopTriggeredHandler);
        addViewListener(TransportBar.EVENT_PLAY_CHANGE, view_playChangeHandler);
        addViewListener(TransportBar.EVENT_RECORD_CHANGE, view_recordChangeHandler);
        addViewListener(TransportBar.EVENT_AUTOWRITE_CHANGE, view_automationChangeHandler);
        addViewListener(TransportBar.EVENT_POPUP_TRIGGERED, view_popupTriggeredHandler);

        view.isPlaying = oscModel.transport.isPlaying;
        view.isRecording = oscModel.transport.isRecording;
        view.isAutowrite = oscModel.transport.isAutoWrite;
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
        view.isAutowrite = data.value;
    }

    private function view_playChangeHandler(event:Event, selected:Boolean):void
    {
        oscModel.transport.togglePlay();
    }

    private function view_recordChangeHandler(event:Event, selected:Boolean):void
    {
        oscModel.transport.toggleRecord();
    }

    private function view_automationChangeHandler(event:Event, selected:Boolean):void
    {
        oscModel.transport.toggleAutoWrite();
    }

    private function view_stopTriggeredHandler(event:Event):void
    {
        oscModel.transport.stop();
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
