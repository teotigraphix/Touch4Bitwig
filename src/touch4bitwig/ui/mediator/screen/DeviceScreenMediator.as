/**
 * Created by Teoti on 4/5/2015.
 */
package touch4bitwig.ui.mediator.screen
{

import com.teotigraphix.bitwig.event.DeviceModelEventType;
import com.teotigraphix.bitwig.model.DeviceModel;
import com.teotigraphix.bitwig.service.IOSCService;
import com.teotigraphix.bitwig.ui.component.screen.DeviceScreen;
import com.teotigraphix.bitwig.ui.mediator.BitwigTouchMediator;

import starling.events.Event;

public class DeviceScreenMediator extends BitwigTouchMediator
{
    [Inject]
    public var oscService:IOSCService;

    [Inject]
    public var deviceModel:DeviceModel;

    private var view:DeviceScreen;

    public function DeviceScreenMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();
        addContextListener(DeviceModelEventType.MODE_CHANGE, context_modeChangeHandler);
        addViewListener(DeviceScreen.EVENT_DEVICE_BANK_SELECTOR_CHANGE, ssdsd);

    }

    override public function onRegister():void
    {
        super.onRegister();

    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    override public function setViewComponent(viewComponent:Object):void
    {
        super.setViewComponent(viewComponent);
        view = DeviceScreen(viewComponent);
    }

    override public function preRemove():void
    {
        super.preRemove();
        view = null;
    }


    private function ssdsd(event:Event, mode:String):void
    {
        deviceModel.mode = mode;
    }

    private function context_modeChangeHandler(event:Event, mode:String):void
    {
        oscService.sendInt("/device/indicate/param", 0);
        oscService.sendInt("/device/indicate/common", 0);
        oscService.sendInt("/device/indicate/envelope", 0);
        oscService.sendInt("/device/indicate/macro", 0);
        oscService.sendInt("/device/indicate/modulation", 0);

        oscService.sendInt("/device/indicate/" + mode, 1);

        if (mode != "param")
        {

        }
        // /device/param/+
    }

}
}
