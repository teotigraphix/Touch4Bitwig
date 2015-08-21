/**
 * Created by Teoti on 8/21/2015.
 */
package touch4bitwig.ui.component.main
{

import feathers.controls.LayoutGroup;

public class TransportBarSkinBase extends LayoutGroup implements ITransportBar
{
    public var owner:TransportBar;

    private var _isPlaying:Boolean;
    private var _isRecording:Boolean;
    private var _isAutomating:Boolean;

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

    public function get isAutomating():Boolean
    {
        return _isAutomating;
    }

    public function set isAutomating(value:Boolean):void
    {
        _isAutomating = value;
    }

    public function TransportBarSkinBase()
    {
    }
}
}
