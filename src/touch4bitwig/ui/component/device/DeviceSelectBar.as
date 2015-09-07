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

package touch4bitwig.ui.component.device
{

import com.teotigraphix.ui.component.UIToggleButton;

import feathers.controls.LayoutGroup;
import feathers.layout.HorizontalLayout;
import feathers.layout.VerticalLayout;
import feathers.skins.IStyleProvider;

import starling.events.Event;

public class DeviceSelectBar extends LayoutGroup
{
    public static const EVENT_BYPASS_CHANGE:String = "bypassChange";
    public static const EVENT_EXPAND_CHANGE:String = "expandChange";
    public static const EVENT_WINDOW_CHANGE:String = "windowChange";
    public static const EVENT_MACRO_PAGE_CHANGE:String = "macroPageChange";
    public static const EVENT_PARAM_PAGE_CHANGE:String = "paramPageChange";

    public static var globalStyleProvider:IStyleProvider;

    private var _bypassButton:UIToggleButton;
    private var _expandButton:UIToggleButton;

    private var _windowButton:UIToggleButton;
    private var _macroPageButton:UIToggleButton;
    private var _paramPageButton:UIToggleButton;

    private var _isWindowVisible:Boolean;
    private var _isBypass:Boolean;
    private var _isMacroPageVisible:Boolean;
    private var _isParamPageVisible:Boolean;
    private var _isExpanded:Boolean;

    override protected function get defaultStyleProvider():IStyleProvider
    {
        return DeviceSelectBar.globalStyleProvider;
    }

    public function get isWindowVisible():Boolean
    {
        return _isWindowVisible;
    }

    public function set isWindowVisible(value:Boolean):void
    {
        _isWindowVisible = value;
        invalidate();
    }

    public function get isBypass():Boolean
    {
        return _isBypass;
    }

    public function set isBypass(value:Boolean):void
    {
        _isBypass = value;
        invalidate();
    }

    public function get isMacroPageVisible():Boolean
    {
        return _isMacroPageVisible;
    }

    public function set isMacroPageVisible(value:Boolean):void
    {
        _isMacroPageVisible = value;
        invalidate();
    }

    public function get isParamPageVisible():Boolean
    {
        return _isParamPageVisible;
    }

    public function set isParamPageVisible(value:Boolean):void
    {
        _isParamPageVisible = value;
        invalidate();
    }

    public function get isExpanded():Boolean
    {
        return _isExpanded;
    }

    public function set isExpanded(value:Boolean):void
    {
        _isExpanded = value;
        invalidate();
    }

    public function DeviceSelectBar()
    {
    }

    override protected function initialize():void
    {
        var l:VerticalLayout = new VerticalLayout();
        l.verticalAlign = VerticalLayout.HORIZONTAL_ALIGN_CENTER;
        layout = l;
        super.initialize();

        _bypassButton = new UIToggleButton();
        _expandButton = new UIToggleButton();
        _windowButton = new UIToggleButton();
        _macroPageButton = new UIToggleButton();
        _paramPageButton = new UIToggleButton();

        _bypassButton.styleNameList.add("device-select-bar-bypass-button");
        _expandButton.styleNameList.add("device-select-bar-expand-button");
        _windowButton.styleNameList.add("device-select-bar-window-button");
        _macroPageButton.styleNameList.add("device-select-bar-macro-page-button");
        _paramPageButton.styleNameList.add("device-select-bar-param-page-button");

        _bypassButton.addEventListener(Event.CHANGE, bypassButton_triggeredHandler);
        _expandButton.addEventListener(Event.CHANGE, expandButton_triggeredHandler);
        _windowButton.addEventListener(Event.CHANGE, windowButton_triggeredHandler);
        _macroPageButton.addEventListener(Event.CHANGE, macroPageButton_triggeredHandler);
        _paramPageButton.addEventListener(Event.CHANGE, paramPageButton_triggeredHandler);

        addChild(_bypassButton);
        addChild(_expandButton);

        addChild(_windowButton);
        addChild(_macroPageButton);
        addChild(_paramPageButton);
    }

    override protected function draw():void
    {
        super.draw();

        _expandButton.isEnabled = _isEnabled;
        _windowButton.isEnabled = _isEnabled;
        _bypassButton.isEnabled = _isEnabled;
        _macroPageButton.isEnabled = _isEnabled;
        _paramPageButton.isEnabled = _isEnabled;

        if (_isEnabled)
        {
            _expandButton.setIsSelected(!_isExpanded);
            _windowButton.setIsSelected(_isWindowVisible);
            _bypassButton.setIsSelected(!_isBypass);
            _macroPageButton.setIsSelected(_isMacroPageVisible);
            _paramPageButton.setIsSelected(_isParamPageVisible);
        }
        else
        {
            _expandButton.setIsSelected(false);
            _windowButton.setIsSelected(false);
            _bypassButton.setIsSelected(false);
            _macroPageButton.setIsSelected(false);
            _paramPageButton.setIsSelected(false);
        }

    }

    private function expandButton_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_EXPAND_CHANGE, false, _expandButton.isSelected);
    }

    private function windowButton_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_WINDOW_CHANGE, false, _windowButton.isSelected);
    }

    private function macroPageButton_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_MACRO_PAGE_CHANGE, false, _macroPageButton.isSelected);
    }

    private function paramPageButton_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_PARAM_PAGE_CHANGE, false, _paramPageButton.isSelected);
    }

    private function bypassButton_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_BYPASS_CHANGE, false, _bypassButton.isSelected);
    }
}
}
