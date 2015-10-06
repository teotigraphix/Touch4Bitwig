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

package touch4bitwig.model.state
{

import touch4bitwig.model.event.BitwigDeviceEventType;
import touch4bitwig.service.IOSCService;

public class BitwigDevice extends AbstractBitwigState
{
    private var _id:String;
    private var _bank:BitwigDeviceBank;

    private var _canSelectPrevious:Boolean;
    private var _canSelectNext:Boolean;
    private var _selectedPageName:String;
    private var _pageNames:Array = [];

    private var _name:String;
    private var _bypass:Boolean;
    private var _expanded:Boolean;
    private var _windowVisible:Boolean;
    private var _macroPageVisible:Boolean;
    private var _paramPageVisible:Boolean;
    private var _category:String;
    private var _creator:String;
    private var _preset:String;

    public function get bank():BitwigDeviceBank
    {
        return _bank;
    }

    public function get exists():Boolean
    {
        return _name != null && _name != "None";
    }

    public function get canSelectPrevious():Boolean
    {
        return _canSelectPrevious;
    }

    public function set canSelectPrevious(value:Boolean):void
    {
        if (isSame(_canSelectPrevious, value))
            return;
        _canSelectPrevious = value;
        dispatchValue(BitwigDeviceEventType.CAN_SELECT_PREVIOUS, _canSelectPrevious);
    }

    public function get canSelectNext():Boolean
    {
        return _canSelectNext;
    }

    public function set canSelectNext(value:Boolean):void
    {
        if (isSame(_canSelectNext, value))
            return;
        _canSelectNext = value;
        dispatchValue(BitwigDeviceEventType.CAN_SELECT_NEXT, _canSelectNext);
    }

    public function get selectedPageName():String
    {
        return _selectedPageName;
    }

    public function set selectedPageName(value:String):void
    {
        if (isSame(_selectedPageName, value))
            return;
        _selectedPageName = value;
        dispatchValue(BitwigDeviceEventType.SELECTED_PAGE_NAME_CHANGE, _selectedPageName);
    }

    public function get pageNames():Array
    {
        return _pageNames;
    }

    public function set pageNames(value:Array):void
    {
        if (isSame(_pageNames, value))
            return;
        _pageNames = value;
        dispatchValue(BitwigDeviceEventType.PARAM_PAGE_NAMES_CHANGE, _pageNames);
    }

    public function get name():String
    {
        return _name;
    }

    public function set name(value:String):void
    {
        if (isSame(_name, value))
            return;
        _name = value;
        dispatchValue(BitwigDeviceEventType.NAME_CHANGE, _name);
    }

    public function get bypass():Boolean
    {
        return _bypass;
    }

    public function set bypass(value:Boolean):void
    {
        if (isSame(_bypass, value))
            return;
        _bypass = value;
        dispatchValue(BitwigDeviceEventType.BYPASS_CHANGE, _bypass);
    }

    public function get expanded():Boolean
    {
        return _expanded;
    }

    public function set expanded(value:Boolean):void
    {
        if (isSame(_expanded, value))
            return;
        _expanded = value;
        dispatchValue(BitwigDeviceEventType.EXPAND_CHANGE, _expanded);
    }

    public function get windowVisible():Boolean
    {
        return _windowVisible;
    }

    public function set windowVisible(value:Boolean):void
    {
        if (isSame(_windowVisible, value))
            return;
        _windowVisible = value;
        dispatchValue(BitwigDeviceEventType.WINDOW_CHANGE, _windowVisible);
    }

    public function get macroPageVisible():Boolean
    {
        return _macroPageVisible;
    }

    public function set macroPageVisible(value:Boolean):void
    {
        if (isSame(_macroPageVisible, value))
            return;
        _macroPageVisible = value;
        dispatchValue(BitwigDeviceEventType.MACRO_PAGE_CHANGE, _macroPageVisible);
    }

    public function get paramPageVisible():Boolean
    {
        return _paramPageVisible;
    }

    public function set paramPageVisible(value:Boolean):void
    {
        if (isSame(_paramPageVisible, value))
            return;
        _paramPageVisible = value;
        dispatchValue(BitwigDeviceEventType.PARAM_PAGE_CHANGE, _paramPageVisible);
    }

    public function get category():String
    {
        return _category;
    }

    public function set category(value:String):void
    {
        if (isSame(_category, value))
            return;
        _category = value;
        dispatchValue(BitwigDeviceEventType.CATEGORY_CHANGE, _category);
    }

    public function get creator():String
    {
        return _creator;
    }

    public function set creator(value:String):void
    {
        if (isSame(_creator, value))
            return;
        _creator = value;
        dispatchValue(BitwigDeviceEventType.CREATOR_CHANGE, _creator);
    }

    public function get preset():String
    {
        return _preset;
    }

    public function set preset(value:String):void
    {
        if (isSame(_preset, value))
            return;
        _preset = value;
        dispatchValue(BitwigDeviceEventType.PRESET_CHANGE, _name);
    }

    public function BitwigDevice(service:IOSCService, id:String)
    {
        super(service);
        _id = id;
        _bank = new BitwigDeviceBank(service);
    }

    public function previous():void
    {
        service.send("/" + _id + "/-");
    }

    public function next():void
    {
        service.send("/" + _id + "/+");
    }

    public function toggleBypass():void
    {
        service.send("/" + _id + "/bypass");
    }

    public function toggleExpand():void
    {
        service.send("/" + _id + "/expand");
    }

    public function toggleWindow():void
    {
        service.send("/" + _id + "/window");
    }

    public function toggleMacroVisible():void
    {
        service.send("/" + _id + "/macroVisible");
    }

    //public function toggleParamVisible():void
    //{
    //    service.send("/" + _id + "/paramVisible");
    //}

    public function toggleBrowser():void
    {
        service.send("/" + _id + "/browser");
    }
}
}
