/**
 * Created by Teoti on 4/15/2015.
 */
package touch4bitwig.ui.component.transport
{

import com.teotigraphix.ui.theme.AssetMap;

import feathers.controls.Label;
import feathers.controls.LayoutGroup;
import feathers.controls.TabBar;
import feathers.data.ListCollection;
import feathers.layout.VerticalLayout;

import starling.events.Event;

public class TransportPopUp extends LayoutGroup
{
    public static const EVENT_AUTOMATION_WRITE_MODE_CHANGE:String = "autowriteChange";

    private var _tabBar:TabBar;
    private var _automationWriteLabel:Label;

    private var _autowriteIndex:int = -1;

    public function get autowriteIndex():int
    {
        return _autowriteIndex;
    }

    public function set autowriteIndex(value:int):void
    {
        _autowriteIndex = value;
        invalidate(INVALIDATION_FLAG_DATA);
    }

    public function TransportPopUp()
    {
    }

    override protected function initialize():void
    {
        var l:VerticalLayout = new VerticalLayout();
        l.padding = AssetMap.getSize(15);
        l.gap = AssetMap.getSize(8);
        layout = l;
        super.initialize();

        backgroundSkin = AssetMap.create9ScaleImage("popup-background-skin", 3, 3, 22, 22);

        _automationWriteLabel = new Label();
        _automationWriteLabel.text = " Automation Write";

        _tabBar = new TabBar();
        _tabBar.dataProvider = new ListCollection(
                [{label: "LATCH"}, {label: "TOUCH"}, {label: "WRITE"}]
        );
        _tabBar.addEventListener(Event.CHANGE, tabBar_changeHandler);

        addChild(_automationWriteLabel);
        addChild(_tabBar);
    }

    override protected function draw():void
    {
        super.draw();

        if (isInvalid(INVALIDATION_FLAG_DATA))
        {
            _tabBar.selectedIndex = _autowriteIndex;
        }
    }

    private function tabBar_changeHandler(event:Event):void
    {
        dispatchEventWith(EVENT_AUTOMATION_WRITE_MODE_CHANGE, false, _tabBar.selectedIndex);
    }
}
}
