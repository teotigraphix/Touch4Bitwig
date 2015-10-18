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
package touch4bitwig.model
{

public interface IBitwigApplication extends IBitwigState
{
    //--------------------------------------------------------------------------
    // Properties
    //--------------------------------------------------------------------------

    /**
     * The active layout of the Application (ARRANGE, MIX, EDIT).
     */
    function get layout():String;

    /**
     * Whether the current project's audio engine is active.
     */
    function get active():Boolean;

    /**
     * The current project name.
     */
    function get projectName():String;

    //--------------------------------------------------------------------------
    // Methods
    //--------------------------------------------------------------------------

    /**
     * Sets the active layout of Bitwig.
     *
     * @param activeLayout The active layout (arrange, mix, edit).
     */
    function setActiveLayout(activeLayout:String):void;

    /**
     * Toggles the side browser visibility.
     */
    function toggleBrowser():void;

    /**
     * Toggles the side inspector visibility.
     */
    function toggleInspector():void;
}
}
