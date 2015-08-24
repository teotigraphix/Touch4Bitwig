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

import starling.events.Event;

import touch4bitwig.event.TransportModelEventType;
import touch4bitwig.ui.AbstractUIMediator;

public class TransportDisplayMediator extends AbstractUIMediator
{
    [Inject]
    public var view:TransportDisplay;

    public function TransportDisplayMediator()
    {
    }

    override public function onRegister():void
    {
        super.onRegister();

        addContextListener(TransportModelEventType.TEMPO_RAW_CHANGE, context_tempoRawChangeHandler);
        addContextListener(TransportModelEventType.NUMERATOR_CHANGE, context_numeratorChangeHandler);
        addContextListener(TransportModelEventType.DENOMINATOR_CHANGE, context_denonminatorChangeHandler);
        addContextListener(TransportModelEventType.POSITION_STRING_CHANGE, context_positionChangeHandler);

        addViewListener(TransportDisplay.EVENT_TAP, view_tapHandler);

        view.setTempo(oscModel.transport.tempoRaw);
        view.setTimeSignature(getTimeSignatureString());
        view.setPosition(oscModel.transport.positionString);
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    private function context_tempoRawChangeHandler(event:Event, data:Object):void
    {
        view.setTempo(data.value);
    }

    private function context_numeratorChangeHandler(event:Event, data:Object):void
    {
        view.setTimeSignature(getTimeSignatureString());
    }

    private function context_denonminatorChangeHandler(event:Event, data:Object):void
    {
        view.setTimeSignature(getTimeSignatureString());
    }

    private function context_positionChangeHandler(event:Event, data:Object):void
    {
        view.setPosition(data.value);
    }

    private function getTimeSignatureString():String
    {
        return oscModel.transport.numerator + "/" + oscModel.transport.denominator;
    }

    private function view_tapHandler(event:Event):void
    {
        oscModel.transport.tapTempo();
    }
}
}
