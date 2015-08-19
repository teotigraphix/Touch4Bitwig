/**
 * Created by Teoti on 4/17/2015.
 */
package touch4bitwig.ui.mediator.device
{

import com.teotigraphix.bitwig.event.DeviceModelEventType;
import com.teotigraphix.bitwig.model.DeviceModel;
import com.teotigraphix.bitwig.service.IOSCService;
import com.teotigraphix.bitwig.ui.component.device.DeviceBankPager;
import com.teotigraphix.bitwig.ui.mediator.BitwigTouchMediator;

import feathers.data.ListCollection;

import starling.events.Event;

public class DeviceBankPagerMediator extends BitwigTouchMediator
{
    [Inject]
    public var oscService:IOSCService;

    [Inject]
    public var deviceModel:DeviceModel;

    private var view:DeviceBankPager;

    public function DeviceBankPagerMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();

        addContextListener(DeviceModelEventType.MODE_CHANGE, context_modeChangeHandler);

        addContextListener(DeviceModelEventType.PARAM_PAGE_NAMES_CHANGE, context_pageNamesChangeHandler);
        addContextListener(DeviceModelEventType.SELECTED_PAGE_NAME_CHANGE, context_paramPageChangeHandler);

        addViewListener(DeviceBankPager.EVENT_DEVICE_BANK_PAGE, view_deviceBankPageHandler);
        addViewListener(DeviceBankPager.EVENT_DEVICE_BANK_SELECT, view_deviceBankSelectHandler);

        view.dataProvider = new ListCollection(deviceModel.device.pageNames);
        view.selectedIndex = getParamPageIndex(deviceModel.device.selectedPageName);
    }

    override public function setViewComponent(viewComponent:Object):void
    {
        super.setViewComponent(viewComponent);
        view = DeviceBankPager(viewComponent);
    }

    override public function preRemove():void
    {
        super.preRemove();
    }

    private function context_modeChangeHandler(event:Event, mode:String):void
    {
        view.isEnabled = mode == "param";
    }

    private function context_pageNamesChangeHandler(event:Event, data:Object):void
    {
        view.dataProvider = new ListCollection(data.value);
    }

    private function context_paramPageChangeHandler(event:Event, data:Object):void
    {
        view.selectedIndex = getParamPageIndex(data.value);
    }

    private function getParamPageIndex(name:String):int
    {
        var list:Array = deviceModel.device.pageNames;
        if (list == null)
            return -1;

        for (var i:int = 0; i < list.length; i++)
        {
            var item:String = list[i];
            if (item == name)
                return i;
        }
        return -1;
    }

    private function view_deviceBankPageHandler(event:Event, page:String):void
    {
        oscService.send("/device/param/" + page); // +/-
    }

    private function view_deviceBankSelectHandler(event:Event, index:int):void
    {
        oscService.send("/device/paramPage/" + index);
    }
}
}
