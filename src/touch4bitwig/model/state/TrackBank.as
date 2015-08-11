/**
 * Created by Teoti on 4/5/2015.
 */
package touch4bitwig.model.state
{

import touch4bitwig.event.TrackModelEventType;
import touch4bitwig.service.IOSCService;

public class TrackBank extends AbstractBitwigState
{
    private var _tracks:Vector.<Track> = new Vector.<Track>(8, true);

    private var _scenes:Vector.<Scene> = new Vector.<Scene>(8, true);

    private var _canScrollTracksUp:Boolean;
    private var _canScrollTracksDown:Boolean;

    public function get canScrollTracksUp():Boolean
    {
        return _canScrollTracksUp;
    }

    public function set canScrollTracksUp(value:Boolean):void
    {
        if (isSame(_canScrollTracksUp, value))
            return;
        _canScrollTracksUp = value;
        dispatchValue(TrackModelEventType.CAN_SCROLL_TRACKS_UP, _canScrollTracksUp);
    }

    public function get canScrollTracksDown():Boolean
    {
        return _canScrollTracksDown;
    }

    public function set canScrollTracksDown(value:Boolean):void
    {
        if (isSame(_canScrollTracksDown, value))
            return;
        _canScrollTracksDown = value;
        dispatchValue(TrackModelEventType.CAN_SCROLL_TRACKS_DOWN, _canScrollTracksDown);
    }

    public function get selectedTrack():Track
    {
        for each (var track:Track in tracks)
        {
            if (track.isSelected)
                return track;
        }
        return null;
    }

    public function get tracks():Vector.<Track>
    {
        return _tracks;
    }

    public function set tracks(value:Vector.<Track>):void
    {
        _tracks = value;
    }

    public function get scenes():Vector.<Scene>
    {
        return _scenes;
    }

    public function set scenes(value:Vector.<Scene>):void
    {
        _scenes = value;
    }

    public function TrackBank(service:IOSCService)
    {
        super(service);
        for (var i:int = 0; i < _tracks.length; i++)
        {
            _tracks[i] = new Track(i + 1, service);
            _scenes[i] = new Scene(i + 1, service);
        }
    }

    public function previous():void
    {
        service.send("/track/-");
    }

    public function next():void
    {
        service.send("/track/+");
    }
}
}
