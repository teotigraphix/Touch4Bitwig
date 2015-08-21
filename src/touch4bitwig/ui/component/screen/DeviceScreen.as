/**
 * Created by Teoti on 4/5/2015.
 */
package touch4bitwig.ui.component.screen
{

import feathers.controls.ButtonGroup;
import feathers.controls.LayoutGroup;
import feathers.controls.Screen;
import feathers.data.ListCollection;
import feathers.layout.HorizontalLayout;
import feathers.layout.HorizontalLayoutData;
import feathers.layout.VerticalLayout;
import feathers.layout.VerticalLayoutData;

import starling.events.Event;

import touch4bitwig.model.support.DeviceModel;
import touch4bitwig.ui.component.device.DeviceBankPager;
import touch4bitwig.ui.component.device.DeviceNavigationControl;
import touch4bitwig.ui.component.device.DeviceSelectBar;
import touch4bitwig.ui.component.main.MainHeader;
import touch4bitwig.ui.component.track.TrackChannelBank;
import touch4bitwig.ui.component.track.TrackNavigationControl;
import touch4bitwig.ui.component.track.channel.DeviceBankSelector;

public class DeviceScreen extends Screen
{
    public static const EVENT_DEVICE_BANK_SELECTOR_CHANGE:String = "deviceBankSelectorChange";

    private var _deviceBankSelector:DeviceBankSelector;
    private var _deviceBankPager:DeviceBankPager;
    private var _deviceSelectBar:DeviceSelectBar;
    private var _deviceNavigationControl:DeviceNavigationControl;
    private var _trackNavigationControl:TrackNavigationControl;

    public function DeviceScreen()
    {
    }

    override protected function initialize():void
    {
        var vl:VerticalLayout = new VerticalLayout();
        layout = vl;

        super.initialize();

        var header:MainHeader = new MainHeader();
        header.layoutData = new VerticalLayoutData(100);
        addChild(header);

        var bar1:LayoutGroup = new LayoutGroup();
        bar1.layout = new HorizontalLayout();
        bar1.layoutData = new VerticalLayoutData(NaN, NaN);
        bar1.width = 700;

        _trackNavigationControl = new TrackNavigationControl();
        _trackNavigationControl.layoutData = new HorizontalLayoutData(100);
        //_trackNavigationControl.width = 650;
        bar1.addChild(_trackNavigationControl);

        _deviceNavigationControl = new DeviceNavigationControl();
        _deviceNavigationControl.layoutData = new HorizontalLayoutData(100);
        //_deviceNavigationControl.width = 650;
        bar1.addChild(_deviceNavigationControl);
        addChild(bar1);

        _deviceSelectBar = new DeviceSelectBar();
        _deviceSelectBar.layoutData = new VerticalLayoutData(NaN, NaN);
        _deviceSelectBar.width = 700;
        addChild(_deviceSelectBar);

        _deviceBankSelector = new DeviceBankSelector();
        _deviceBankSelector.direction = ButtonGroup.DIRECTION_HORIZONTAL;

        _deviceBankSelector.dataProvider = new ListCollection(
                [
                    {label: "Param", mode: DeviceModel.MODE_PARAM},
                    {label: "Common", mode: DeviceModel.MODE_COMMON},
                    {label: "Envelope", mode: DeviceModel.MODE_ENVELOPE},
                    {label: "Macro", mode: DeviceModel.MODE_MACRO}
                ]);
        _deviceBankSelector.addEventListener(Event.CHANGE, deviceBankSelector_changeHandler);
        _deviceBankSelector.layoutData = new VerticalLayoutData(NaN, NaN);
        _deviceBankSelector.width = 700;
        addChild(_deviceBankSelector);

        _deviceBankPager = new DeviceBankPager();
        _deviceBankPager.layoutData = new VerticalLayoutData(NaN, NaN);
        _deviceBankPager.width = 700;
        addChild(_deviceBankPager);

        var trackChannelBank:TrackChannelBank = new TrackChannelBank();
        trackChannelBank.layout = new HorizontalLayout();
        trackChannelBank.layoutData = new VerticalLayoutData(NaN, 100);
        trackChannelBank.width = 700;
        addChild(trackChannelBank);
    }

    override protected function draw():void
    {
        super.draw();
    }

    private function deviceBankSelector_changeHandler(event:Event):void
    {
        dispatchEventWith(EVENT_DEVICE_BANK_SELECTOR_CHANGE, false, _deviceBankSelector.selectedItem.mode);
    }

}
}
