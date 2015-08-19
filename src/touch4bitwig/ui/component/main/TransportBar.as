/**
 * Created by Teoti on 4/5/2015.
 */
package touch4bitwig.ui.component.main
{

import com.teotigraphix.ui.component.UIToggleButton;

import feathers.controls.Button;
import feathers.controls.LayoutGroup;
import feathers.layout.HorizontalLayout;
import feathers.layout.HorizontalLayoutData;

import starling.events.Event;

public class TransportBar extends LayoutGroup
{
    public static const EVENT_STOP_TRIGGERED:String = "stopTriggered";
    public static const EVENT_PLAY_CHANGE:String = "playChange";
    public static const EVENT_RECORD_CHANGE:String = "recordChange";
    public static const EVENT_AUTOMATION_CHANGE:String = "automationChange";
    public static const EVENT_POPUP_TRIGGERED:String = "popupTriggered";

    private var _stopButton:Button;
    private var _playButton:UIToggleButton;
    private var _recordButton:UIToggleButton;
    private var _automationButton:UIToggleButton;
    private var _popupButton:UIToggleButton;

    public function TransportBar()
    {
    }

    override protected function initialize():void
    {
        var hl:HorizontalLayout = new HorizontalLayout();
        layout = hl;

        super.initialize();

        _stopButton = new Button();
        _playButton = new UIToggleButton();
        _recordButton = new UIToggleButton();
        _automationButton = new UIToggleButton();
        _popupButton = new UIToggleButton();

        _stopButton.styleNameList.add("stop-button");
        _playButton.styleNameList.add("play-button");
        _recordButton.styleNameList.add("record-button");
        _automationButton.styleNameList.add("automation-button");
        _popupButton.styleNameList.add("transport-bar-popup-button");

        _stopButton.addEventListener(Event.TRIGGERED, stop_triggeredHandler);
        _playButton.addEventListener(Event.CHANGE, play_changedHandler);
        _recordButton.addEventListener(Event.CHANGE, record_changedHandler);
        _automationButton.addEventListener(Event.CHANGE, automation_changedHandler);
        _popupButton.addEventListener(Event.TRIGGERED, popup_triggeredHandler);
        _popupButton.layoutData = new HorizontalLayoutData(NaN, 100);

        addChild(_stopButton);
        addChild(_playButton);
        addChild(_recordButton);
        addChild(_automationButton);
        addChild(_popupButton);
    }

    override protected function draw():void
    {
        super.draw();
    }

    public function setPlaySelected(value:Boolean):void
    {
        _playButton.setIsSelected(value);
    }

    public function setRecordSelected(value:Boolean):void
    {
        _recordButton.setIsSelected(value);
    }

    public function setAutomationSelected(value:Boolean):void
    {
        _automationButton.setIsSelected(value);
    }

    private function automation_changedHandler(event:Event):void
    {
        dispatchEventWith(EVENT_AUTOMATION_CHANGE, false, _automationButton.isSelected);
    }

    private function record_changedHandler(event:Event):void
    {
        dispatchEventWith(EVENT_RECORD_CHANGE, false, _recordButton.isSelected);
    }

    private function play_changedHandler(event:Event):void
    {
        dispatchEventWith(EVENT_PLAY_CHANGE, false, _playButton.isSelected);
    }

    private function stop_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_STOP_TRIGGERED);
    }

    private function popup_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_POPUP_TRIGGERED);
    }
}
}
