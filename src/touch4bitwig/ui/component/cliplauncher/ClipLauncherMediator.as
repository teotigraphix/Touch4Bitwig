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

package touch4bitwig.ui.component.cliplauncher
{

import feathers.data.ListCollection;

import starling.animation.IAnimatable;
import starling.animation.Juggler;
import starling.events.Event;

import touch4bitwig.event.TrackModelEventType;
import touch4bitwig.event.TransportModelEventType;
import touch4bitwig.model.state.Clip;
import touch4bitwig.model.state.Scene;
import touch4bitwig.ui.AbstractUIMediator;
import touch4bitwig.ui.component.main.TrackNameHeaderItem;

public class ClipLauncherMediator extends AbstractUIMediator implements IAnimatable
{
    [Inject]
    public var juggler:Juggler;

    private var view:ClipLauncher;

    public function ClipLauncherMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();

        addViewListener(SceneList.EVENT_SCENE_TAP, view_sceneTapHandler);

        addViewListener(TrackNameHeaderItem.EVENT_HEADER_TAP, view_headerTapHandler);

        addViewListener(ClipLauncherGrid.EVENT_CLIP_TAP, view_clipTapHandler);
        addViewListener(ClipLauncher.EVENT_AUTOMATION_CHANGE, view_automationChangeHandler);
        addViewListener(ClipLauncher.EVENT_OVERDUB_CHANGE, view_overdubChangeHandler);

        addViewListener(ClipLauncherFooterItem.EVENT_STOP_BUTTON_TRIGGERED, view_stopButtonTriggeredHandler);
        addViewListener(ClipLauncherFooterItem.EVENT_RETURN_BUTTON_TRIGGERED, view_returnButtonTriggeredHandler);

        addContextListener(TransportModelEventType.IS_AUTOWRITE_LAUNCHER_CHANGE,
                           context_isAutowriteLaucherChangeHandler);
        addContextListener(TransportModelEventType.IS_OVERDUB_LAUNCHER_CHANGE,
                           context_isOverdubLauncherChangeHandler);

        addContextListener(TrackModelEventType.COLOR_CHANGE, context_updateTrack);
        addContextListener(TrackModelEventType.NAME_CHANGE, context_updateTrack);
        addContextListener(TrackModelEventType.SELECTED_CHANGE, context_updateTrack);

        //addContextListener(TrackModelEventType.CLIP_SELECTED_CHANGE, context_clipSelectedChange;

        juggler.add(this);

    }

    override public function onRegister():void
    {
        super.onRegister();
        // XXX TEMP

        var clipCollection:ListCollection = new ListCollection();
        var sceneCollection:ListCollection = new ListCollection();

        for (var scene:int = 0; scene < 8; scene++)
        {
            sceneCollection.addItem(oscModel.trackBank.scenes[scene]);

            for (var track:int = 0; track < 8; track++)
            {
                clipCollection.addItem(oscModel.trackBank.tracks[track].clips[scene]);
            }
        }

        for (var i:int = 0; i < 8; i++)
        {
            view.updateTrack(oscModel.trackBank.tracks[i]);
        }

        view.clipLauncherGrid.dataProvider = clipCollection;
        view.sceneList.dataProvider = sceneCollection;
    }

    override public function setViewComponent(viewComponent:Object):void
    {
        super.setViewComponent(viewComponent);
        view = ClipLauncher(viewComponent);
    }

    override public function preRemove():void
    {
        super.preRemove();

        juggler.remove(this);
    }

    public function advanceTime(time:Number):void
    {
        view.clipLauncherGrid.advanceTime();
        view.sceneList.advanceTime();
    }

    private function context_updateTrack(event:Event, data:Object):void
    {
        view.updateTrack(oscModel.trackBank.tracks[data.index - 1]);
    }

    private function context_clipSelectedChange(event:Event, data:Object):void
    {

    }

    private function context_isOverdubLauncherChangeHandler(event:Event, data:Object):void
    {
        view.setLauncherOverdub(oscModel.transport.isOverdubLauncher);
    }

    private function context_isAutowriteLaucherChangeHandler(event:Event, data:Object):void
    {
        view.setLauncherAutowrite(data.value);
    }

    private function view_headerTapHandler(event:Event, index:int):void
    {
        oscService.send("/track/" + (index + 1) + "/select");
    }

    private function view_stopButtonTriggeredHandler(event:Event, index:int):void
    {
        if (index < 8)
        {
            oscService.send("/track/" + index + "/clip/stop");
        }
        else
        {
            oscService.send("/track/stop");
        }
    }

    private function view_returnButtonTriggeredHandler(event:Event, index:int):void
    {
        if (index < 8)
        {
            oscService.send("/track/" + index + "/clip/returntoarrangement");
        }
        else
        {
            oscService.send("/track/returntoarrangement");
        }
    }

    private function view_sceneTapHandler(event:Event, scene:Scene):void
    {
        scene.launch();
    }

    private function view_clipTapHandler(event:Event, clip:Clip):void
    {
        clip.launch();
    }

    private function view_automationChangeHandler(event:Event):void
    {
        oscService.send("/autowrite/launcher");
    }

    private function view_overdubChangeHandler(event:Event):void
    {
        oscService.send("/overdub/launcher");
    }
}
}