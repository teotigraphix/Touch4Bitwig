/**
 * Created by Teoti on 8/21/2015.
 */
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
}
}
