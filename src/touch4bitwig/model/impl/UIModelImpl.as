////////////////////////////////////////////////////////////////////////////////
// Copyright 2015 Michael Schmalle - Teoti Graphix, LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License
//
// Author: Michael Schmalle, Principal Architect
// mschmalle at teotigraphix dot com
////////////////////////////////////////////////////////////////////////////////

package touch4bitwig.model.impl
{

import com.teotigraphix.model.AbstractModel;
import com.teotigraphix.ui.component.UIToggleButton;
import com.teotigraphix.ui.theme.AssetMap;

import feathers.data.ListCollection;

import starling.events.Event;

import touch4bitwig.model.IApplicationModel;
import touch4bitwig.model.IOSCModel;
import touch4bitwig.model.IUIModel;
import touch4bitwig.model.event.BitwigPanelEventType;
import touch4bitwig.service.IOSCService;
import touch4bitwig.view.ApplicationScreens;

public class UIModelImpl extends AbstractModel implements IUIModel
{
    [Inject]
    public var oscModel:IOSCModel;

    [Inject]
    public var oscService:IOSCService;

    [Inject]
    public var model:IApplicationModel;

    private var _screenDataProvider:ListCollection;

    private var _transportTempoWholeDataProvider:ListCollection;
    private var _transportTempoFractionDataProvider:ListCollection;

    private var _panelsLayoutDataProvider:ListCollection;
    private var _panelsArrangeDataProvider:ListCollection;
    private var _panelsMixDataProvider:ListCollection;
    private var _panelsEditDataProvider:ListCollection;

    public function get screenDataProvider():ListCollection
    {
        return _screenDataProvider;
    }

    //----------------------------------
    // Panels
    //----------------------------------

    public function get panelsLayoutDataProvider():ListCollection
    {
        return _panelsLayoutDataProvider;
    }

    public function get panelsArrangeDataProvider():ListCollection
    {
        return _panelsArrangeDataProvider;
    }

    public function get panelsMixDataProvider():ListCollection
    {
        return _panelsMixDataProvider;
    }

    public function get panelsEditDataProvider():ListCollection
    {
        return _panelsEditDataProvider;
    }

    //----------------------------------
    // Transport
    //----------------------------------

    public function get transportTempoWholeDataProvider():ListCollection
    {
        return _transportTempoWholeDataProvider;
    }

    public function get transportTempoFractionDataProvider():ListCollection
    {
        return _transportTempoFractionDataProvider;
    }

    public function get screenIndex():int
    {
        for each (var object:Object in screenDataProvider.data)
        {
            if (object.id == model.screens.applicationScreenID)
                return object.index;
        }
        return -1;
    }

    public function UIModelImpl()
    {
    }

    override protected function onRegister():void
    {
        super.onRegister();

        _screenDataProvider = new ListCollection();

        _screenDataProvider.addItem({
            index: 0, id: ApplicationScreens.SCREEN_MIXER, label: "Mixer", action: function ():void
            {
                model.screens.goToMixer();
            }
        });
        _screenDataProvider.addItem({
            index: 1, id: ApplicationScreens.SCREEN_CLIPS, label: "Clips", action: function ():void
            {
                model.screens.goToClips();
            }
        });
        _screenDataProvider.addItem({
            index: 2, id: ApplicationScreens.SCREEN_TRANSPORT, label: "Transport", action: function ():void
            {
                model.screens.goToTransport();
            }
        });
        _screenDataProvider.addItem({
            index: 3, id: ApplicationScreens.SCREEN_DEVICE, label: "Device", action: function ():void
            {
                model.screens.goToDevice();
            }
        });
        _screenDataProvider.addItem({
            index: 4, id: ApplicationScreens.SCREEN_PANEL, label: "Panels", action: function ():void
            {
                model.screens.goToPanels();
            }
        });

        setupPanels();

        // Transport

        _transportTempoWholeDataProvider = new ListCollection();
        _transportTempoFractionDataProvider = new ListCollection();

        var i:int;
        var value:int = 20;
        for (i = 0; i < 667 - 20; i++)
        {
            _transportTempoWholeDataProvider.addItem({label: value, index: i, bpm: value});
            value++;
        }

        value = 0;

        for (i = 0; i < 100; i++)
        {
            _transportTempoFractionDataProvider.addItem({label: i, index: i, bpm: value});
            value++;
        }

    }

    public function refresh():void
    {
        setupPanels();
    }

    private function setupPanels():void
    {
        _panelsLayoutDataProvider = new ListCollection([
            {label: "ARRANGE"},
            {label: "MIX"},
            {label: "EDIT"}
        ]);

        _panelsArrangeDataProvider = new ListCollection([
            {
                type: BitwigPanelEventType.ARRANGER_CLIP_LAUNCHER_VISIBLE_CHANGE,
                label: "ClipLauncher",
                defaultIcon: AssetMap.createImage("icon-clip-launcher-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-clip-launcher-selected-skin"),
                isToggle: true,
                isSelected: oscModel.arranger.clipLauncherVisible,
                address: "/arranger/clipLauncherSectionVisibility",
                change: view_changeHandler
            },
            {
                type: BitwigPanelEventType.ARRANGER_TIME_LINE_VISIBLE_CHANGE,
                label: "Timeline",
                defaultIcon: AssetMap.createImage("icon-timeline-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-timeline-selected-skin"),
                isToggle: true,
                isSelected: oscModel.arranger.timelineVisible,
                address: "/arranger/timeLineVisibility",
                change: view_changeHandler
            },
            {
                type: BitwigPanelEventType.ARRANGER_IO_VISIBLE_CHANGE,
                label: "IO",
                defaultIcon: AssetMap.createImage("icon-io-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-io-selected-skin"),
                isToggle: true,
                isSelected: oscModel.arranger.ioVisible,
                address: "/arranger/ioSectionVisibility",
                change: view_changeHandler
            },
            {
                type: BitwigPanelEventType.ARRANGER_EFFECTS_TRACKS_VISIBLE_CHANGE,
                label: "EffectTracks",
                defaultIcon: AssetMap.createImage("icon-effect-tracks-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-effect-tracks-selected-skin"),
                isToggle: true,
                isSelected: oscModel.arranger.effectTracksVisible,
                address: "/arranger/effectTracksVisibility",
                change: view_changeHandler
            },
            {
                type: BitwigPanelEventType.ARRANGER_TRACK_ROW_HEIGHT_VISIBLE_CHANGE,
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

        _panelsMixDataProvider = new ListCollection([
            {
                type: BitwigPanelEventType.MIXER_CLIP_LAUNCHER_VISIBLE_CHANGE,
                label: "ClipLauncher",
                defaultIcon: AssetMap.createImage("icon-clip-launcher-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-clip-launcher-selected-skin"),
                isToggle: true,
                isSelected: oscModel.mixer.clipLauncherVisible,
                address: "/mixer/clipLauncherSectionVisibility",
                change: view_changeHandler
            },
            {
                type: BitwigPanelEventType.MIXER_METER_VISIBLE_CHANGE,
                label: "Meters",
                defaultIcon: AssetMap.createImage("icon-meters-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-meters-selected-skin"),
                isToggle: true,
                isSelected: oscModel.mixer.meterVisible,
                address: "/mixer/meterSectionVisibility",
                change: view_changeHandler
            },
            {
                type: BitwigPanelEventType.MIXER_DEVICE_VISIBLE_CHANGE,
                label: "DeviceChain",
                defaultIcon: AssetMap.createImage("icon-device-chain-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-device-chain-selected-skin"),
                isToggle: true,
                isSelected: oscModel.mixer.deviceVisible,
                address: "/mixer/deviceSectionVisibility",
                change: view_changeHandler
            },
            {
                type: BitwigPanelEventType.MIXER_SENDS_VISIBLE_CHANGE,
                label: "Sends",
                defaultIcon: AssetMap.createImage("icon-sends-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-sends-selected-skin"),
                isToggle: true,
                isSelected: oscModel.mixer.sendsVisible,
                address: "/mixer/sendsSectionVisibility",
                change: view_changeHandler
            },
            {
                type: BitwigPanelEventType.MIXER_IO_VISIBLE_CHANGE,
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
                type: BitwigPanelEventType.MIXER_CROSS_FADE_VISIBLE_CHANGE,
                label: "Crossfade",
                defaultIcon: AssetMap.createImage("icon-crossfade-up-skin"),
                defaultSelectedIcon: AssetMap.createImage("icon-crossfade-selected-skin"),
                isToggle: true,
                isSelected: oscModel.mixer.crossFadeVisible,
                address: "/mixer/crossFadeSectionVisibility",
                change: view_changeHandler
            }
        ]);

        _panelsEditDataProvider = new ListCollection([]);
    }

    private function view_changeHandler(event:Event, data:Object):void
    {
        var button:UIToggleButton = UIToggleButton(event.currentTarget);
        oscService.sendBoolean(data.address, button.isSelected);
    }
}
}
