/**
 * Created by Teoti on 4/14/2015.
 */
package touch4bitwig.ui.component.frame
{

import com.teotigraphix.ui.component.UIToggleButton;
import com.teotigraphix.ui.theme.AssetMap;

import feathers.controls.Button;
import feathers.data.ListCollection;

import starling.events.Event;

import touch4bitwig.event.ApplicationModelEventType;
import touch4bitwig.event.FrameModelEventType;
import touch4bitwig.model.state.Application;
import touch4bitwig.ui.AbstractUIMediator;

public class PanelSubToggleGroupMediator extends AbstractUIMediator
{
    private var view:PanelSubToggleGroup;

    private var _arrangeDataProvider:ListCollection;
    private var _mixDataProvider:ListCollection;
    private var _editDataProvider:ListCollection;

    public function PanelSubToggleGroupMediator()
    {

    }

    override public function preRegister():void
    {
        super.preRegister();

        addContextListener(ApplicationModelEventType.PANEL_LAYOUT_CHANGE, context_panelLayoutChange);

        addContextListener(FrameModelEventType.ARRANGER_CLIP_LAUNCHER_VISIBLE_CHANGE, context_arrangerChangeHandler);
        addContextListener(FrameModelEventType.ARRANGER_CUE_MARKER_VISIBLE_CHANGE, context_arrangerChangeHandler);
        addContextListener(FrameModelEventType.ARRANGER_EFFECTS_TRACKS_VISIBLE_CHANGE, context_arrangerChangeHandler);
        addContextListener(FrameModelEventType.ARRANGER_IO_VISIBLE_CHANGE, context_arrangerChangeHandler);
        addContextListener(FrameModelEventType.ARRANGER_PLAYBACK_FOLLOW_VISIBLE_CHANGE, context_arrangerChangeHandler);
        addContextListener(FrameModelEventType.ARRANGER_TIME_LINE_VISIBLE_CHANGE, context_arrangerChangeHandler);
        addContextListener(FrameModelEventType.ARRANGER_TRACK_ROW_HEIGHT_VISIBLE_CHANGE, context_arrangerChangeHandler);

        addContextListener(FrameModelEventType.MIXER_CLIP_LAUNCHER_VISIBLE_CHANGE, context_mixerChangeHandler);
        addContextListener(FrameModelEventType.MIXER_CROSS_FADE_VISIBLE_CHANGE, context_mixerChangeHandler);
        addContextListener(FrameModelEventType.MIXER_DEVICE_VISIBLE_CHANGE, context_mixerChangeHandler);
        addContextListener(FrameModelEventType.MIXER_IO_VISIBLE_CHANGE, context_mixerChangeHandler);
        addContextListener(FrameModelEventType.MIXER_METER_VISIBLE_CHANGE, context_mixerChangeHandler);
        addContextListener(FrameModelEventType.MIXER_SENDS_VISIBLE_CHANGE, context_mixerChangeHandler);

        addViewListener(Event.CHANGE, view_changeHandler);
        // Arrange; ClipLauncher, Timeline, IO, , EffectTracks, TrackHeight, ActivateTracks
        // Mix;     ClipLauncher, Meters, DeviceChain, Sends, IO, EffectTracks, ActivateTracks, Crossfade
        // Edit;    N/A

        view.buttonFactory = buttonFactory;

        _arrangeDataProvider = new ListCollection([
            {
                type: FrameModelEventType.ARRANGER_CLIP_LAUNCHER_VISIBLE_CHANGE,
                label: "ClipLauncher",
                defaultIcon: AssetMap.createImage("icon-clip-launcher-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-clip-launcher-selected-skin"),
                isToggle: true,
                isSelected: oscModel.arranger.clipLauncherVisible,
                address: "/arranger/clipLauncherSectionVisibility",
                change: view_changeHandler
            },
            {
                type: FrameModelEventType.ARRANGER_TIME_LINE_VISIBLE_CHANGE,
                label: "Timeline",
                defaultIcon: AssetMap.createImage("icon-timeline-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-timeline-selected-skin"),
                isToggle: true,
                isSelected: oscModel.arranger.timelineVisible,
                address: "/arranger/timeLineVisibility",
                change: view_changeHandler
            },
            {
                type: FrameModelEventType.ARRANGER_IO_VISIBLE_CHANGE,
                label: "IO",
                defaultIcon: AssetMap.createImage("icon-io-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-io-selected-skin"),
                isToggle: true,
                isSelected: oscModel.arranger.ioVisible,
                address: "/arranger/ioSectionVisibility",
                change: view_changeHandler
            },
            {
                type: FrameModelEventType.ARRANGER_EFFECTS_TRACKS_VISIBLE_CHANGE,
                label: "EffectTracks",
                defaultIcon: AssetMap.createImage("icon-effect-tracks-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-effect-tracks-selected-skin"),
                isToggle: true,
                isSelected: oscModel.arranger.effectTracksVisible,
                address: "/arranger/effectTracksVisibility",
                change: view_changeHandler
            },
            {
                type: FrameModelEventType.ARRANGER_TRACK_ROW_HEIGHT_VISIBLE_CHANGE,
                label: "TrackHeight",
                defaultIcon: AssetMap.createImage("icon-track-height-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-track-height-selected-skin"),
                isToggle: true,
                isSelected: oscModel.arranger.trackRowHeightVisible,
                address: "/arranger/trackRowHeight",
                change: view_changeHandler
            },
            {
                type: null,
                label: "ActivateTracks",
                defaultIcon: AssetMap.createImage("icon-track-activate-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-track-activate-selected-skin"),
                isToggle: true,
                //isSelected: oscModel.arranger.activeTracks,
                address: null,
                isEnabled: false,
                change: view_changeHandler
            }
        ]);

        _mixDataProvider = new ListCollection([
            {
                type: FrameModelEventType.MIXER_CLIP_LAUNCHER_VISIBLE_CHANGE,
                label: "ClipLauncher",
                defaultIcon: AssetMap.createImage("icon-clip-launcher-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-clip-launcher-selected-skin"),
                isToggle: true,
                isSelected: oscModel.mixer.clipLauncherVisible,
                address: "/mixer/clipLauncherSectionVisibility",
                change: view_changeHandler
            },
            {
                type: FrameModelEventType.MIXER_METER_VISIBLE_CHANGE,
                label: "Meters",
                defaultIcon: AssetMap.createImage("icon-meters-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-meters-selected-skin"),
                isToggle: true,
                isSelected: oscModel.mixer.meterVisible,
                address: "/mixer/meterSectionVisibility",
                change: view_changeHandler
            },
            {
                type: FrameModelEventType.MIXER_DEVICE_VISIBLE_CHANGE,
                label: "DeviceChain",
                defaultIcon: AssetMap.createImage("icon-device-chain-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-device-chain-selected-skin"),
                isToggle: true,
                isSelected: oscModel.mixer.deviceVisible,
                address: "/mixer/deviceSectionVisibility",
                change: view_changeHandler
            },
            {
                type: FrameModelEventType.MIXER_SENDS_VISIBLE_CHANGE,
                label: "Sends",
                defaultIcon: AssetMap.createImage("icon-sends-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-sends-selected-skin"),
                isToggle: true,
                isSelected: oscModel.mixer.sendsVisible,
                address: "/mixer/sendsSectionVisibility",
                change: view_changeHandler
            },
            {
                type: FrameModelEventType.MIXER_IO_VISIBLE_CHANGE,
                label: "IO",
                defaultIcon: AssetMap.createImage("icon-io-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-io-selected-skin"),
                isToggle: true,
                isSelected: oscModel.mixer.ioVisible,
                address: "/mixer/ioSectionVisibility",
                change: view_changeHandler
            },
            {
                type: null,
                label: "EffectTracks",
                defaultIcon: AssetMap.createImage("icon-effect-tracks-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-effect-tracks-selected-skin"),
                isToggle: true,
                //isSelected: oscModel.mixer.effectTracksVisible,
                address: "/mixer/clipLauncherSectionVisibility",
                change: view_changeHandler,
                isEnabled: false
            },
            {
                type: null,
                label: "ActivateTracks",
                defaultIcon: AssetMap.createImage("icon-track-activate-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-track-activate-selected-skin"),
                isToggle: true,
                //isSelected: oscModel.mixer.activeTracks,
                address: null,
                change: view_changeHandler,
                isEnabled: false
            },
            {
                type: FrameModelEventType.MIXER_CROSS_FADE_VISIBLE_CHANGE,
                label: "Crossfade",
                defaultIcon: AssetMap.createImage("icon-crossfade-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-crossfade-selected-skin"),
                isToggle: true,
                isSelected: oscModel.mixer.crossFadeVisible,
                address: "/mixer/crossFadeSectionVisibility",
                change: view_changeHandler
            }
        ]);

        _editDataProvider = new ListCollection([]);

        context_panelLayoutChange(null, {value: oscModel.application.layout});
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
        view = PanelSubToggleGroup(viewComponent);
    }

    override public function preRemove():void
    {
        super.preRemove();
        view = null;
    }

    private function context_mixerChangeHandler(event:Event, data:Object):void
    {
        if (oscModel.application.layout != Application.LAYOUT_MIX)
            return;

        var item:Object = getMixerItem(event.type);
        if (item == null)
            return;

        trace("context_mixerChangeHandler() " + event.type + ' : ' + data.value);
        item.isSelected = data.value;
        //view.dataProvider.updateItemAt(_mixDataProvider.getItemIndex(item));
        view.dataProvider = null;
        view.dataProvider = _mixDataProvider;
    }

    private function context_arrangerChangeHandler(event:Event, data:Object):void
    {
        if (oscModel.application.layout != Application.LAYOUT_ARRANGE)
            return;

        var item:Object = getArrangerItem(event.type);
        if (item == null)
            return;

        trace("context_arrangerChangeHandler() " + event.type + ' : ' + data.value);
        item.isSelected = data.value;
        //view.dataProvider.updateItemAt(_arrangeDataProvider.getItemIndex(item));
        view.dataProvider = null;
        view.dataProvider = _arrangeDataProvider;
    }

    private function getMixerItem(type:String):Object
    {
        for (var i:int = 0; i < _mixDataProvider.length; i++)
        {
            var item:Object = _mixDataProvider.getItemAt(i);
            if (item.type == type)
                return item;
        }
        return null;
    }

    private function getArrangerItem(type:String):Object
    {
        for (var i:int = 0; i < _arrangeDataProvider.length; i++)
        {
            var item:Object = _arrangeDataProvider.getItemAt(i);
            if (item.type == type)
                return item;
        }
        return null;
    }//#D36E0E, gray #DADADA

    private function view_changeHandler(event:Event, data:Object):void
    {
        var button:UIToggleButton = UIToggleButton(event.currentTarget);
        oscService.sendBoolean(data.address, button.isSelected);
    }

    private function buttonFactory():UIToggleButton
    {
        var button:UIToggleButton = new UIToggleButton();
        button.iconPosition = Button.ICON_POSITION_TOP;
        button.styleNameList.add("panels-button");
        return button;
    }

    private function context_panelLayoutChange(event:Event, data:Object):void
    {
        switch (data.value)
        {
            case Application.LAYOUT_ARRANGE :
                view.dataProvider = null;
                view.dataProvider = _arrangeDataProvider;
                break;

            case Application.LAYOUT_MIX :
                view.dataProvider = null;
                view.dataProvider = _mixDataProvider;
                break;

            case Application.LAYOUT_EDIT :
                view.dataProvider = null;//_editDataProvider;
                break;
        }
    }
}
}
