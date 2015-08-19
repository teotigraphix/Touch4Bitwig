/**
 * Created by Teoti on 4/6/2015.
 */
package touch4bitwig.ui.component.cliplauncher
{

import com.teotigraphix.ui.theme.AssetMap;

import feathers.controls.Button;
import feathers.controls.LayoutGroup;
import feathers.layout.HorizontalLayout;
import feathers.layout.HorizontalLayoutData;

import starling.events.Event;

public class ClipLauncherFooterItem extends LayoutGroup
{
    public static const EVENT_STOP_BUTTON_TRIGGERED:String = "stopButtonTriggered";
    public static const EVENT_RETURN_BUTTON_TRIGGERED:String = "returnButtonTriggered";

    private var _stopButton:Button;
    private var _returnButton:Button;

    private var _index:int;

    public function get index():int
    {
        return _index;
    }

    public function set index(value:int):void
    {
        _index = value;
    }

    public function ClipLauncherFooterItem()
    {
    }

    override protected function initialize():void
    {
        var hl:HorizontalLayout = new HorizontalLayout();
        hl.gap = 2;
        layout = hl;
        super.initialize();

        _stopButton = new Button();
        _stopButton.defaultIcon = AssetMap.createImage("clip-launcher-stop-button-icon-skin");
        _stopButton.defaultIcon.width = 20;
        _stopButton.defaultIcon.height = 20;
        _stopButton.layoutData = new HorizontalLayoutData(100, 100);
        _stopButton.addEventListener(Event.TRIGGERED, stopButton_triggeredHandler);

        _returnButton = new Button();
        _returnButton.defaultIcon = AssetMap.createImage("clip-launcher-return-button-icon-skin");
        _returnButton.defaultIcon.width = 20;
        _returnButton.defaultIcon.height = 20;
        _returnButton.layoutData = new HorizontalLayoutData(100, 100);
        _returnButton.addEventListener(Event.TRIGGERED, returnButton_triggeredHandler);

        addChild(_stopButton);
        addChild(_returnButton);
    }

    override protected function draw():void
    {
        super.draw();
    }

    private function stopButton_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_STOP_BUTTON_TRIGGERED, true, _index);
    }

    private function returnButton_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_RETURN_BUTTON_TRIGGERED, true, _index);
    }
}
}
