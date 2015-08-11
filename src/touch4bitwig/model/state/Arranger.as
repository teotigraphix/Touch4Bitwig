/**
 * Created by Teoti on 4/14/2015.
 */
package touch4bitwig.model.state
{

import touch4bitwig.event.FrameModelEventType;
import touch4bitwig.service.IOSCService;

public class Arranger extends AbstractBitwigState
{
    private var _cueMarkerVisible:Boolean;
    private var _playbackFollowVisible:Boolean;
    private var _trackRowHeightVisible:Boolean;
    private var _clipLauncherVisible:Boolean;
    private var _timelineVisible:Boolean;
    private var _ioVisible:Boolean;
    private var _effectTracksVisible:Boolean;

    public function get cueMarkerVisible():Boolean
    {
        return _cueMarkerVisible;
    }

    public function set cueMarkerVisible(value:Boolean):void
    {
        if (isSame(_cueMarkerVisible, value))
            return;
        _cueMarkerVisible = value;
        dispatchValue(FrameModelEventType.ARRANGER_CUE_MARKER_VISIBLE_CHANGE, _cueMarkerVisible);
    }

    public function get playbackFollowVisible():Boolean
    {
        return _playbackFollowVisible;
    }

    public function set playbackFollowVisible(value:Boolean):void
    {
        if (isSame(_playbackFollowVisible, value))
            return;
        _playbackFollowVisible = value;
        dispatchValue(FrameModelEventType.ARRANGER_PLAYBACK_FOLLOW_VISIBLE_CHANGE, _playbackFollowVisible);
    }

    public function get trackRowHeightVisible():Boolean
    {
        return _trackRowHeightVisible;
    }

    public function set trackRowHeightVisible(value:Boolean):void
    {
        if (isSame(_trackRowHeightVisible, value))
            return;
        _trackRowHeightVisible = value;
        dispatchValue(FrameModelEventType.ARRANGER_TRACK_ROW_HEIGHT_VISIBLE_CHANGE, _trackRowHeightVisible);
    }

    public function get clipLauncherVisible():Boolean
    {
        return _clipLauncherVisible;
    }

    public function set clipLauncherVisible(value:Boolean):void
    {
        if (isSame(_clipLauncherVisible, value))
            return;
        _clipLauncherVisible = value;
        dispatchValue(FrameModelEventType.ARRANGER_CLIP_LAUNCHER_VISIBLE_CHANGE, _clipLauncherVisible);
    }

    public function get timelineVisible():Boolean
    {
        return _timelineVisible;
    }

    public function set timelineVisible(value:Boolean):void
    {
        if (isSame(_timelineVisible, value))
            return;
        _timelineVisible = value;
        dispatchValue(FrameModelEventType.ARRANGER_TIME_LINE_VISIBLE_CHANGE, _timelineVisible);
    }

    public function get ioVisible():Boolean
    {
        return _ioVisible;
    }

    public function set ioVisible(value:Boolean):void
    {
        if (isSame(_ioVisible, value))
            return;
        _ioVisible = value;
        dispatchValue(FrameModelEventType.ARRANGER_IO_VISIBLE_CHANGE, _ioVisible);
    }

    public function get effectTracksVisible():Boolean
    {
        return _effectTracksVisible;
    }

    public function set effectTracksVisible(value:Boolean):void
    {
        if (isSame(_effectTracksVisible, value))
            return;
        _effectTracksVisible = value;
        dispatchValue(FrameModelEventType.ARRANGER_EFFECTS_TRACKS_VISIBLE_CHANGE, _effectTracksVisible);
    }

    public function Arranger(service:IOSCService)
    {
        super(service);
    }
}
}
