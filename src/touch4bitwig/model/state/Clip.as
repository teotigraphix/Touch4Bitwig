/**
 * Created by Teoti on 4/5/2015.
 */
package touch4bitwig.model.state
{

import touch4bitwig.event.TrackModelEventType;
import touch4bitwig.service.IOSCService;

public class Clip extends AbstractBitwigState
{
    private var _index:int;
    private var _track:Track;

    private var _name:String;
    private var _isSelected:Boolean;
    private var _hasContent:Boolean;
    private var _color:uint = 0x393939;
    private var _isPlaying:Boolean;
    private var _isRecording:Boolean;
    private var _isQueued:Boolean;

    public function get index():int
    {
        return _index;
    }

    public function get track():Track
    {
        return _track;
    }

    public function get name():String
    {
        return _name;
    }

    public function set name(value:String):void
    {
        _name = value;
    }

    public function get isSelected():Boolean
    {
        return _isSelected;
    }

    public function set isSelected(value:Boolean):void
    {
        _isSelected = value;
        dispatch(TrackModelEventType.CLIP_SELECTED_CHANGE,
                {trackIndex: track.index, index: _index, value: _isSelected});
    }

    public function get hasContent():Boolean
    {
        return _hasContent;
    }

    public function set hasContent(value:Boolean):void
    {
        _hasContent = value;
    }

    public function get color():uint
    {
        return _color;
    }

    public function set color(value:uint):void
    {
        if (value == 0)
            _color = 0x393939;
        else
            _color = value;
    }

    public function get isPlaying():Boolean
    {
        return _isPlaying;
    }

    public function set isPlaying(value:Boolean):void
    {
        _isPlaying = value;
    }

    public function get isRecording():Boolean
    {
        return _isRecording;
    }

    public function set isRecording(value:Boolean):void
    {
        _isRecording = value;
    }

    public function get isQueued():Boolean
    {
        return _isQueued;
    }

    public function set isQueued(value:Boolean):void
    {
        _isQueued = value;
    }

    public function Clip(index:int, track:Track, service:IOSCService)
    {
        super(service);
        _index = index;
        _track = track;
    }

    public function launch():void
    {
        service.send("/track/" + _track.index + "/clip/" + _index + "/launch");
    }
}
}
