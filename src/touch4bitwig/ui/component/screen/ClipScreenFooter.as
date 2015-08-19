/**
 * Created by Teoti on 4/6/2015.
 */
package touch4bitwig.ui.component.screen
{

import feathers.controls.Button;
import feathers.controls.LayoutGroup;
import feathers.layout.HorizontalLayout;

import starling.events.Event;

public class ClipScreenFooter extends LayoutGroup
{
    public static const EVENT_LEFT_TAP:String = "leftTap";
    public static const EVENT_UP_TAP:String = "upTap";
    public static const EVENT_DOWN_TAP:String = "downTap";
    public static const EVENT_RIGHT_TAP:String = "rightTap";

    public static const DIRECTION_LEFT:String = "left";
    public static const DIRECTION_UP:String = "up";
    public static const DIRECTION_DOWN:String = "down";
    public static const DIRECTION_RIGHT:String = "right";

    private var _leftButton:Button;
    private var _upButton:Button;
    private var _downButton:Button;
    private var _rightButton:Button;

    public function ClipScreenFooter()
    {
    }

    override protected function initialize():void
    {
        var hl:HorizontalLayout = new HorizontalLayout();
        hl.horizontalAlign = HorizontalLayout.HORIZONTAL_ALIGN_CENTER;
        layout = hl;

        super.initialize();

        _leftButton = new Button();
        _leftButton.label = "Left";
        _leftButton.addEventListener(Event.TRIGGERED, left_triggeredHandler);

        _upButton = new Button();
        _upButton.label = "Up";
        _upButton.addEventListener(Event.TRIGGERED, up_triggeredHandler);

        _downButton = new Button();
        _downButton.label = "Down";
        _downButton.addEventListener(Event.TRIGGERED, down_triggeredHandler);

        _rightButton = new Button();
        _rightButton.label = "Right";
        _rightButton.addEventListener(Event.TRIGGERED, right_triggeredHandler);

        _leftButton.setSize(75, 40);
        _upButton.setSize(75, 40);
        _downButton.setSize(75, 40);
        _rightButton.setSize(75, 40);

        addChild(_leftButton);
        addChild(_upButton);
        addChild(_downButton);
        addChild(_rightButton);
    }

    override protected function draw():void
    {
        super.draw();
    }

    private function left_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_LEFT_TAP, true, DIRECTION_LEFT);
    }

    private function up_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_UP_TAP, true, DIRECTION_UP);
    }

    private function down_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_DOWN_TAP, true, DIRECTION_DOWN);
    }

    private function right_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_RIGHT_TAP, true, DIRECTION_RIGHT);
    }
}
}
