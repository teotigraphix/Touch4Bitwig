////////////////////////////////////////////////////////////////////////////////
// Copyright 2016 Michael Schmalle - Teoti Graphix, LLC
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
package t4b.view.ui.transport._mediators
{

import feathers.controls.Callout;

import starling.animation.Juggler;
import starling.events.Event;

import t4b.model.event.BitwigTransportEventType;
import t4b.view.core.AbstractMediator;
import t4b.view.ui.transport.TransportBar;
import t4b.view.ui.transport.TransportPopUp;

public class TransportBarMediator extends AbstractMediator
{
    [Inject]
    public var juggler:Juggler;

    [Inject]
    public var view:TransportBar;

    private var _popUp:TransportPopUp;
    private var _instance:*;
    private var _callout:Callout;

    //--------------------------------------------------------------------------
    // Methods
    //--------------------------------------------------------------------------
    
    override protected function initializeView():void
    {
        view.playButton.isSelected = model.osc.transport.isPlaying;
        view.recordButton.isSelected = model.osc.transport.isRecording;
        view.autowriteButton.isSelected = model.osc.transport.isAutoWrite;
    }
    
    override protected function setupViewListeners():void
    {
        addViewListener(TransportBar.EVENT_STOP_TRIGGERED, view_stopTriggeredHandler);
        addViewListener(TransportBar.EVENT_PLAY_TRIGGERED, view_playChangeHandler);
        addViewListener(TransportBar.EVENT_RECORD_TRIGGERED, view_recordChangeHandler);
        addViewListener(TransportBar.EVENT_AUTOWRITE_TRIGGERED, view_automationChangeHandler);
        addViewListener(TransportBar.EVENT_POPUP_TRIGGERED, view_popupTriggeredHandler);
    }
    
    override protected function setupContextListeners():void
    {
        addContextListener(BitwigTransportEventType.IS_PLAYING, context_transportPlayChangeHandler);
        addContextListener(BitwigTransportEventType.IS_RECORDING, context_transportRecordChangeHandler);
        addContextListener(BitwigTransportEventType.IS_AUTO_WRITE, context_transportAutomationChangeHandler);
    }

    //--------------------------------------------------------------------------
    // View
    //--------------------------------------------------------------------------
    
    private function view_playChangeHandler(event:Event, selected:Boolean):void
    {
        model.osc.transport.togglePlay();
    }

    private function view_recordChangeHandler(event:Event, selected:Boolean):void
    {
        model.osc.transport.toggleRecord();
    }

    private function view_automationChangeHandler(event:Event, selected:Boolean):void
    {
        model.osc.transport.toggleAutoWrite();
    }

    private function view_stopTriggeredHandler(event:Event):void
    {
        model.osc.transport.stop();
    }

    private function view_popupTriggeredHandler(event:Event):void
    {
        //if (_popUp != null)
        //{
        //    PopUpManagerTransitioner.removePopUp(_popUp, 1);
        //    ApplicationContext(eventDispatcher).getMediatorMap().removeMediator(_instance);
        //    _instance = null;
        //    _popUp = null;
        //    return;
        //}
        //var p:Point = new Point(view.x, view.y);
        //p = view.parent.localToGlobal(p);
        //_popUp = new TransportPopUp();
        //
        //PopUpManager.addPopUp(_popUp, false, false, function ():DisplayObject
        //{
        //    var quad:Quad = new Quad(100, 100, 0x000000);
        //    quad.alpha = 0.1;
        //    return quad;
        //});
        //
        //_popUp.validate();
        //
        //_popUp.x = p.x;
        //_popUp.y = p.y + view.height + 1;

        _popUp = new TransportPopUp();
        _callout = Callout.show(_popUp, view.popupButton);
        _callout.addEventListener(Event.CLOSE, callout_closeHandler);

        _instance = mediatorMap.createMediator(_popUp);
    }
    
    //--------------------------------------------------------------------------
    // Context
    //--------------------------------------------------------------------------
    
    private function context_transportPlayChangeHandler(event:Event, data:Object):void
    {
        view.playButton.isSelected = data.value;
    }
    
    private function context_transportRecordChangeHandler(event:Event, data:Object):void
    {
        view.recordButton.isSelected = data.value;
    }
    
    private function context_transportAutomationChangeHandler(event:Event, data:Object):void
    {
        view.autowriteButton.isSelected = data.value;
    }

    //--------------------------------------------------------------------------
    // Internal
    //--------------------------------------------------------------------------
    
    private function callout_closeHandler(event:Event):void
    {
        view.popupButton.isSelected = false;
        _callout.removeEventListener(Event.CLOSE, callout_closeHandler);
        _callout = null;
        mediatorMap.removeMediator(_instance);
        _instance = null;
    }
}
}
