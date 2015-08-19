/**
 * Created by Teoti on 4/17/2015.
 */
package touch4bitwig.ui.component.device
{

import feathers.controls.Button;
import feathers.controls.Label;
import feathers.controls.LayoutGroup;
import feathers.layout.HorizontalLayout;
import feathers.layout.HorizontalLayoutData;
import feathers.layout.VerticalLayout;
import feathers.skins.IStyleProvider;

import starling.events.Event;

public class DeviceNavigationControl extends LayoutGroup
{
    public static const EVENT_LEFT_TRIGGERED:String = "leftTriggered";
    public static const EVENT_RIGHT_TRIGGERED:String = "rightTriggered";

    public static var globalStyleProvider:IStyleProvider;

    private var _nameLabel:Label;
    private var _leftButton:Button;
    private var _rightButton:Button;

    private var _deviceName:String;
    private var _canSelectPrevious:Boolean;
    private var _canSelectNext:Boolean;

    override protected function get defaultStyleProvider():IStyleProvider
    {
        return DeviceNavigationControl.globalStyleProvider;
    }

    public function get deviceName():String
    {
        return _deviceName;
    }

    public function set deviceName(value:String):void
    {
        _deviceName = value;
        invalidate();
    }

    public function get canSelectPrevious():Boolean
    {
        return _canSelectPrevious;
    }

    public function set canSelectPrevious(value:Boolean):void
    {
        _canSelectPrevious = value;
        invalidate();
    }

    public function get canSelectNext():Boolean
    {
        return _canSelectNext;
    }

    public function set canSelectNext(value:Boolean):void
    {
        _canSelectNext = value;
        invalidate();
    }

    public function DeviceNavigationControl()
    {
    }

    override protected function initialize():void
    {
        var l:HorizontalLayout = new HorizontalLayout();
        l.verticalAlign = VerticalLayout.VERTICAL_ALIGN_MIDDLE;
        layout = l;
        super.initialize();

        _leftButton = new Button();
        _rightButton = new Button();
        _nameLabel = new Label();
        _nameLabel.layoutData = new HorizontalLayoutData(100);

        _leftButton.addEventListener(Event.TRIGGERED, leftButton_triggeredHandler);
        _rightButton.addEventListener(Event.TRIGGERED, rightButton_triggeredHandler);

        _leftButton.styleNameList.add("device-select-bar-left-button");
        _rightButton.styleNameList.add("device-select-bar-right-button");
        _nameLabel.styleNameList.add("device-select-bar-name-label");

        addChild(_leftButton);
        addChild(_rightButton);
        addChild(_nameLabel);
    }

    override protected function draw():void
    {
        super.draw();

        _leftButton.isEnabled = _isEnabled && _canSelectPrevious;
        _rightButton.isEnabled = _isEnabled && _canSelectNext;

        if (_isEnabled)
        {
            _nameLabel.text = _deviceName;
        }
        else
        {
            _nameLabel.text = "Please select device";
        }
    }

    private function leftButton_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_LEFT_TRIGGERED);
    }

    private function rightButton_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_RIGHT_TRIGGERED);
    }

}
}
