/**
 * Created by Teoti on 4/14/2015.
 */
package touch4bitwig.model.state
{

import touch4bitwig.event.FrameModelEventType;
import touch4bitwig.service.IOSCService;

public class Panes extends AbstractBitwigState
{
    private var _noteEditorVisible:Boolean;
    private var _automationEditorVisible:Boolean;
    private var _devicesVisible:Boolean;
    private var _mixerVisible:Boolean;
    private var _fullscreenVisible:Boolean;

    public function get noteEditorVisible():Boolean
    {
        return _noteEditorVisible;
    }

    public function set noteEditorVisible(value:Boolean):void
    {
        if (isSame(_noteEditorVisible, value))
            return;
        _noteEditorVisible = value;
        dispatchValue(FrameModelEventType.PANEL_NOTE_EDITOR_VISIBLE_CHANGE, _noteEditorVisible);
    }

    public function get automationEditorVisible():Boolean
    {
        return _automationEditorVisible;
    }

    public function set automationEditorVisible(value:Boolean):void
    {
        if (isSame(_automationEditorVisible, value))
            return;
        _automationEditorVisible = value;
        dispatchValue(FrameModelEventType.PANEL_AUTOMATION_EDITOR_VISIBLE_CHANGE, _automationEditorVisible);
    }

    public function get devicesVisible():Boolean
    {
        return _devicesVisible;
    }

    public function set devicesVisible(value:Boolean):void
    {
        if (isSame(_devicesVisible, value))
            return;
        _devicesVisible = value;
        dispatchValue(FrameModelEventType.PANEL_DEVICES_VISIBLE_CHANGE, _devicesVisible);
    }

    public function get mixerVisible():Boolean
    {
        return _mixerVisible;
    }

    public function set mixerVisible(value:Boolean):void
    {
        if (isSame(_mixerVisible, value))
            return;
        _mixerVisible = value;
        dispatchValue(FrameModelEventType.PANEL_MIXER_VISIBLE_CHANGE, _mixerVisible);
    }

    public function get fullscreenVisible():Boolean
    {
        return _fullscreenVisible;
    }

    public function set fullscreenVisible(value:Boolean):void
    {
        if (isSame(_fullscreenVisible, value))
            return;
        _fullscreenVisible = value;
        dispatchValue(FrameModelEventType.PANEL_FULL_SCREEN_VISIBLE_CHANGE, _fullscreenVisible);
    }

    public function Panes(service:IOSCService)
    {
        super(service);
    }
}
}
