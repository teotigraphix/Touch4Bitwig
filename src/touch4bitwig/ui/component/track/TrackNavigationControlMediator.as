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

package touch4bitwig.ui.component.track
{

import starling.events.Event;

import touch4bitwig.event.TrackModelEventType;
import touch4bitwig.model.state.Track;
import touch4bitwig.ui.AbstractUIMediator;

public class TrackNavigationControlMediator extends AbstractUIMediator
{
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

        var track:Track = oscModel.trackBank.selectedTrack;
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
            view.trackName = oscModel.trackBank.selectedTrack.name;
        }
    }

    private function view_upHandler(event:Event):void
    {
        oscModel.trackBank.previous();
    }

    private function view_downHandler(event:Event):void
    {
        oscModel.trackBank.next();
    }
}
}
