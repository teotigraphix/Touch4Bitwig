/**
 * Created by Teoti on 4/5/2015.
 */
package touch4bitwig.model.state
{

import touch4bitwig.event.TransportModelEventType;
import touch4bitwig.service.IOSCService;

public class Transport extends AbstractBitwigState
{
    private var _isClick:Boolean;
    private var _isPlaying:Boolean;
    private var _isRecording:Boolean;
    private var _isRepeat:Boolean;
    private var _isPreroll:Boolean;
    private var _isOverdubLauncher:Boolean;
    private var _isOverdub:Boolean;
    private var _isCrossfade:Boolean;
    private var _isAutowriteLauncher:Boolean;
    private var _isAutowrite:Boolean;
    private var _automationWriteMode:String;

    public function get isClick():Boolean
    {
        return _isClick;
    }

    public function set isClick(value:Boolean):void
    {
        if (isSame(_isClick, value))
            return;
        _isClick = value;
        dispatchValue(TransportModelEventType.IS_CLICK_CHANGE, _isClick);
    }

    public function get isPlaying():Boolean
    {
        return _isPlaying;
    }

    public function set isPlaying(value:Boolean):void
    {
        if (isSame(_isPlaying, value))
            return;
        _isPlaying = value;
        dispatchValue(TransportModelEventType.IS_PLAYING_CHANGE, _isPlaying);
    }

    public function get isRecording():Boolean
    {
        return _isRecording;
    }

    public function set isRecording(value:Boolean):void
    {
        if (isSame(_isRecording, value))
            return;
        _isRecording = value;
        dispatchValue(TransportModelEventType.IS_RECORDING_CHANGE, _isRecording);
    }

    public function get isRepeat():Boolean
    {
        return _isRepeat;
    }

    public function set isRepeat(value:Boolean):void
    {
        if (isSame(_isRepeat, value))
            return;
        _isRepeat = value;
        dispatchValue(TransportModelEventType.IS_REPEAT_CHANGE, _isRepeat);
    }

    public function get isPreroll():Boolean
    {
        return _isPreroll;
    }

    public function set isPreroll(value:Boolean):void
    {
        if (isSame(_isPreroll, value))
            return;
        _isPreroll = value;
        dispatchValue(TransportModelEventType.IS_PRE_ROLL_CHANGE, _isPreroll);
    }

    public function get isOverdubLauncher():Boolean
    {
        return _isOverdubLauncher;
    }

    public function set isOverdubLauncher(value:Boolean):void
    {
        if (isSame(_isOverdubLauncher, value))
            return;
        _isOverdubLauncher = value;
        dispatchValue(TransportModelEventType.IS_OVERDUB_LAUNCHER_CHANGE, _isOverdubLauncher);
    }

    public function get isOverdub():Boolean
    {
        return _isOverdub;
    }

    public function set isOverdub(value:Boolean):void
    {
        if (isSame(_isOverdub, value))
            return;
        _isOverdub = value;
        dispatchValue(TransportModelEventType.IS_OVERDUB_CHANGE, _isOverdub);
    }

    public function get isCrossfade():Boolean
    {
        return _isCrossfade;
    }

    public function set isCrossfade(value:Boolean):void
    {
        if (isSame(_isCrossfade, value))
            return;
        _isCrossfade = value;
        dispatchValue(TransportModelEventType.IS_CROSSFADE_CHANGE, _isCrossfade);
    }

    public function get isAutowriteLauncher():Boolean
    {
        return _isAutowriteLauncher;
    }

    public function set isAutowriteLauncher(value:Boolean):void
    {
        if (isSame(_isAutowriteLauncher, value))
            return;
        _isAutowriteLauncher = value;
        dispatchValue(TransportModelEventType.IS_AUTOWRITE_LAUNCHER_CHANGE, _isAutowriteLauncher);
    }

    public function get isAutowrite():Boolean
    {
        return _isAutowrite;
    }

    public function set isAutowrite(value:Boolean):void
    {
        if (isSame(_isAutowrite, value))
            return;
        _isAutowrite = value;
        dispatchValue(TransportModelEventType.IS_AUTOWRITE_CHANGE, _isAutowrite);
    }

    public function get automationWriteMode():String
    {
        return _automationWriteMode;
    }

    public function set automationWriteMode(value:String):void
    {
        if (isSame(_automationWriteMode, value))
            return;
        _automationWriteMode = value;
        dispatchValue(TransportModelEventType.AUTOMATION_WRITE_MODE_CHANGE, _automationWriteMode);
    }

    public function get automationWriteModeIndex():int
    {
        switch (_automationWriteMode)
        {
            case "latch":
                return 0;
            case "touch":
                return 1;
            case "write":
                return 2;
        }
        return -1;
    }

    public function Transport(service:IOSCService)
    {
        super(service);
    }

}
}
