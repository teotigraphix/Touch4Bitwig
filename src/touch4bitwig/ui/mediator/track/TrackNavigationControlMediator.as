/**
 * Created by Teoti on 4/17/2015.
 */
package touch4bitwig.ui.mediator.track
{

import com.teotigraphix.bitwig.event.TrackModelEventType;
import com.teotigraphix.bitwig.model.TrackModel;
import com.teotigraphix.bitwig.model.state.Track;
import com.teotigraphix.bitwig.ui.component.track.TrackNavigationControl;
import com.teotigraphix.bitwig.ui.mediator.BitwigTouchMediator;

import starling.events.Event;

public class TrackNavigationControlMediator extends BitwigTouchMediator
{
    [Inject]
    public var trackModel:TrackModel;

    private var view:TrackNavigationControl;

    public function TrackNavigationControlMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();

        addContextListener(TrackModelEventType.SELECTED_CHANGE, context_selectedChangeHandler);

        addContextListener(TrackModelEventType.CAN_SCROLL_TRACKS_UP, context_canScrollTracksUpHandler);
        addContextListener(TrackModelEventType.CAN_SCROLL_TRACKS_DOWN, context_canScrollTracksDownHandler);

        addViewListener(TrackNavigationControl.EVENT_UP, view_upHandler);
        addViewListener(TrackNavigationControl.EVENT_DOWN, view_downHandler);

        //view.canScrollTracksUp = trackModel.bank.canScrollTracksUp;
        //view.canScrollTracksDown = trackModel.bank.canScrollTracksDown;

        view.canScrollTracksUp = true;
        view.canScrollTracksDown = true;

        var track:Track = trackModel.bank.selectedTrack;
        if (track != null)
        {
            view.trackName = track.name;
        }
    }

    override public function setViewComponent(viewComponent:Object):void
    {
        super.setViewComponent(viewComponent);
        view = TrackNavigationControl(viewComponent);
    }

    override public function preRemove():void
    {
        super.preRemove();
    }

    private function context_canScrollTracksUpHandler(event:Event, data:Object):void
    {
        //view.canScrollTracksUp = data.value;
    }

    private function context_canScrollTracksDownHandler(event:Event, data:Object):void
    {
        //view.canScrollTracksDown = data.value;
    }

    private function context_selectedChangeHandler(event:Event, data:Object):void
    {
        if (data.value)
        {
            view.trackName = trackModel.bank.selectedTrack.name;
        }
    }

    private function view_upHandler(event:Event):void
    {
        trackModel.bank.previous();
    }

    private function view_downHandler(event:Event):void
    {
        trackModel.bank.next();
    }
}
}
