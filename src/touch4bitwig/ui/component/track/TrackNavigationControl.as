/**
 * Created by Teoti on 4/17/2015.
 */
package touch4bitwig.ui.component.track
{

import feathers.controls.Button;
import feathers.controls.Label;
import feathers.controls.LayoutGroup;
import feathers.layout.HorizontalLayout;
import feathers.layout.HorizontalLayoutData;
import feathers.layout.VerticalLayout;
import feathers.skins.IStyleProvider;

import starling.events.Event;

public class TrackNavigationControl extends LayoutGroup
{
    public static const EVENT_UP:String = "up";
    public static const EVENT_DOWN:String = "down";

    public static var globalStyleProvider:IStyleProvider;

    private var _upButton:Button;
    private var _downButton:Button;

    private var _canScrollTracksUp:Boolean;
    private var _canScrollTracksDown:Boolean;
    private var _trackName:String;

    public function get canScrollTracksUp():Boolean
    {
        return _canScrollTracksUp;
    }

    public function set canScrollTracksUp(value:Boolean):void
    {
        _canScrollTracksUp = value;
        invalidate();
    }

    public function get canScrollTracksDown():Boolean
    {
        return _canScrollTracksDown;
    }

    public function set canScrollTracksDown(value:Boolean):void
    {
        _canScrollTracksDown = value;
        invalidate();
    }

    public function get trackName():String
    {
        return _trackName;
    }

    public function set trackName(value:String):void
    {
        _trackName = value;
        invalidate();
    }

    override protected function get defaultStyleProvider():IStyleProvider
    {
        return TrackNavigationControl.globalStyleProvider;
    }

    public function TrackNavigationControl()
    {
    }

    private var _nameLabel:Label;

    override protected function initialize():void
    {
        var l:HorizontalLayout = new HorizontalLayout();
        l.verticalAlign = VerticalLayout.VERTICAL_ALIGN_MIDDLE;
        layout = l;
        super.initialize();

        _upButton = new Button();
        _upButton.addEventListener(Event.TRIGGERED, left_triggeredHandler);

        _downButton = new Button();
        _downButton.addEventListener(Event.TRIGGERED, right_triggeredHandler);

        _nameLabel = new Label();
        _nameLabel.layoutData = new HorizontalLayoutData(100);

        _upButton.styleNameList.add("track-navigation-up-button");
        _downButton.styleNameList.add("track-navigation-down-button");
        _downButton.styleNameList.add("track-navigation-name-label");

        addChild(_upButton);
        addChild(_downButton);
        addChild(_nameLabel);
    }

    override protected function draw():void
    {
        super.draw();

        _upButton.isEnabled = _canScrollTracksUp;
        _downButton.isEnabled = _canScrollTracksDown;
        _nameLabel.text = _trackName;
    }

    private function left_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_UP);
    }

    private function right_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_DOWN);
    }
}
}
