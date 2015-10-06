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

package touch4bitwig.model.event
{

public class BitwigDeviceEventType
{
    public static const CAN_SELECT_PREVIOUS:String = "canSelectPrevious";
    public static const CAN_SELECT_NEXT:String = "canSelectNext";
    public static const SELECTED_PAGE_NAME_CHANGE:String = "selectedPageNameChange";
    public static const PARAM_PAGE_NAMES_CHANGE:String = "pageNamesChange";

    public static const NAME_CHANGE:String = "nameChange";
    public static const BYPASS_CHANGE:String = "bypassChange";
    public static const EXPAND_CHANGE:String = "expandChange";
    public static const WINDOW_CHANGE:String = "windowChange";
    public static const MACRO_PAGE_CHANGE:String = "macroPageChange";
    public static const PARAM_PAGE_CHANGE:String = "paramPageChange";
    public static const CATEGORY_CHANGE:String = "categoryChange";
    public static const CREATOR_CHANGE:String = "creatorChange";
    public static const PRESET_CHANGE:String = "presetChange";

    // {index, mode, value}
    public static const PARAM_NAME_CHANGE:String = "paramNameChange";
    public static const PARAM_VALUE_CHANGE:String = "paramValueChange";
    public static const PARAM_VALUE_STRING_CHANGE:String = "paramValueStringChange";

    public static const MODE_CHANGE:String = "DeviceModelEventType/modeChange";
}
}
