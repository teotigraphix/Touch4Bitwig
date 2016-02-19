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
package t4b.view.ui.transport._mediators
{

import starling.events.Event;

import t4b.model.event.BitwigTransportEventType;
import t4b.view.core.AbstractMediator;
import t4b.view.ui.transport.TransportDisplay;

public class TransportDisplayMediator extends AbstractMediator
{
    [Inject]
    public var view:TransportDisplay;

    public function TransportDisplayMediator()
    {
    }
    
    override protected function initializeView():void
    {
        view.wholeDataProvider = model.ui.state.transportTempoWholeDataProvider;
        view.fractionDataProvider = model.ui.state.transportTempoFractionDataProvider;
        
        view.setTempo(model.osc.transport.tempoRaw.toString());
        view.setTimeSignature(model.osc.transport.timeSignature);
        view.setPosition(model.osc.transport.positionString);
    }
    
    override protected function setupViewListeners():void
    {
        addViewListener(TransportDisplay.EVENT_TAP, view_tapHandler);
        addViewListener(TransportDisplay.EVENT_TEMPO, view_tempoHandler);
    }
    
    override protected function setupContextListeners():void
    {
        addContextListener(BitwigTransportEventType.TEMPO_RAW, context_tempoRawChangeHandler);
        addContextListener(BitwigTransportEventType.NUMERATOR, context_numeratorChangeHandler);
        addContextListener(BitwigTransportEventType.DENOMINATOR, context_denonminatorChangeHandler);
        addContextListener(BitwigTransportEventType.POSITION_STRING, context_positionChangeHandler);
    }

    private function context_tempoRawChangeHandler(event:Event, data:Object):void
    {
        view.setTempo(data.value);
    }

    private function context_numeratorChangeHandler(event:Event, data:Object):void
    {
        view.setTimeSignature(model.osc.transport.timeSignature);
    }

    private function context_denonminatorChangeHandler(event:Event, data:Object):void
    {
        view.setTimeSignature(model.osc.transport.timeSignature);
    }

    private function context_positionChangeHandler(event:Event, data:Object):void
    {
        view.setPosition(data.value);
    }

    private function view_tempoHandler(event:Event, tempoRaw:Number):void
    {
        model.osc.transport.tempoRaw = tempoRaw;
    }

    private function view_tapHandler(event:Event):void
    {
        model.osc.transport.tapTempo();
    }
}
}
