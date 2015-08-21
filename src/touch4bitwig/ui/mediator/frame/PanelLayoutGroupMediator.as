/**
 * Created by Teoti on 4/14/2015.
 */
package touch4bitwig.ui.mediator.frame
{

import com.teotigraphix.ui.component.UIToggleButton;
import com.teotigraphix.ui.theme.AssetMap;

import feathers.data.ListCollection;

import starling.events.Event;

import touch4bitwig.event.ApplicationModelEventType;
import touch4bitwig.model.state.Application;
import touch4bitwig.model.support.ApplicationModel;
import touch4bitwig.model.support.FrameModel;
import touch4bitwig.service.IOSCService;
import touch4bitwig.ui.component.frame.PanelLayoutGroup;
import touch4bitwig.ui.mediator.AbstractUIMediator;

public class PanelLayoutGroupMediator extends AbstractUIMediator
{
    [Inject]
    public var oscService:IOSCService;

    [Inject]
    public var frameModel:FrameModel;

    [Inject]
    public var applicationModel:ApplicationModel;

    private var view:PanelLayoutGroup;

    public function PanelLayoutGroupMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();
        addContextListener(ApplicationModelEventType.PANEL_LAYOUT_CHANGE, context_panelLayoutChange);
        addViewListener(PanelLayoutGroup.EVENT_LAYOUT_CHANGE, view_layoutChangeHandler);
    }

    override public function onRegister():void
    {
        super.onRegister();

        view.dataProvider = new ListCollection([
            {label: "ARRANGE"},
            {label: "MIX"},
            {label: "EDIT"}
        ]);
        view.minHeight = AssetMap.getSize(150);
        view.selectedIndex = getIndex(applicationModel.application.layout);
        view.tabFactory = tabFactory;
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    override public function setViewComponent(viewComponent:Object):void
    {
        super.setViewComponent(viewComponent);
        view = PanelLayoutGroup(viewComponent);
    }

    override public function preRemove():void
    {
        super.preRemove();
        view = null;
    }

    private function tabFactory():UIToggleButton
    {
        var button:UIToggleButton = new UIToggleButton();
        button.styleNameList.add("panels-layout-button");
        return button;
    }

    private function context_panelLayoutChange(event:Event, data:Object):void
    {
        view.selectedIndex = getIndex(data.value);
    }

    private function getIndex(layout:String):int
    {
        switch (layout)
        {
            case Application.LAYOUT_ARRANGE :
                return 0;

            case Application.LAYOUT_MIX :
                return 1;

            case Application.LAYOUT_EDIT :
                return 2;
        }
        return -1;
    }

    private function view_layoutChangeHandler(event:Event, layout:String):void
    {
        oscService.send("/layout/" + layout);
    }
}
}
