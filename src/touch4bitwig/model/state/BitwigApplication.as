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

import com.teotigraphix.frameworks.osc.OSCMessage;

import touch4bitwig.model.IBitwigApplication;
import touch4bitwig.model.event.BitwigApplicationEventType;
import touch4bitwig.service.IOSCService;

public class BitwigApplication extends AbstractBitwigState implements IBitwigApplication
{
    //--------------------------------------------------------------------------
    // Constants
    //--------------------------------------------------------------------------

    public static const LAYOUT_ARRANGE:String = "arrange";
    public static const LAYOUT_MIX:String = "mix";
    public static const LAYOUT_EDIT:String = "edit";

    //--------------------------------------------------------------------------
    // Private :: Variables
    //--------------------------------------------------------------------------

    private var _layout:String = null;
    private var _active:Boolean;
    private var _projectName:String = "";

    //--------------------------------------------------------------------------
    // API :: Properties
    //--------------------------------------------------------------------------

    //----------------------------------
    // layout
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get layout():String
    {
        return _layout;
    }

    public function set layout(value:String):void
    {
        if (isSame(_layout, value))
            return;
        _layout = value;
        dispatchValue(BitwigApplicationEventType.PANEL_LAYOUT_CHANGE, _layout);
    }

    //----------------------------------
    // active
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get active():Boolean
    {
        return _active;
    }

    public function set active(value:Boolean):void
    {
        if (isSame(_active, value))
            return;
        _active = value;
        dispatchValue(BitwigApplicationEventType.ACTIVE_CHANGE, _active);
    }

    //----------------------------------
    // projectName
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get projectName():String
    {
        return _projectName;
    }

    public function set projectName(value:String):void
    {
        if (isSame(_projectName, value))
            return;
        _projectName = value;
        dispatchValue(BitwigApplicationEventType.PROJECT_NAME, _projectName);
    }

    //--------------------------------------------------------------------------
    // Constructor
    //--------------------------------------------------------------------------

    public function BitwigApplication(service:IOSCService)
    {
        super(service);
    }

    //--------------------------------------------------------------------------
    // Overridden :: Methods
    //--------------------------------------------------------------------------

    /**
     * @inheritDoc
     */
    override public function configure():void
    {
        _methods["/layout"] = handleLayout;
        _methods["/active"] = handleActivate;
        _methods["/flushComplete"] = handleFlushComplete;
        _methods["/project/name"] = handleProjectName;
    }

    /**
     * @inheritDoc
     */
    override public function dispose():void
    {
        _methods = [];
    }

    //--------------------------------------------------------------------------
    // API :: Methods
    //--------------------------------------------------------------------------

    /**
     * @inheritDoc
     */
    public function setActiveLayout(activeLayout:String):void
    {
        service.send("/layout/" + activeLayout);
    }

    /**
     * @inheritDoc
     */
    public function toggleBrowser():void
    {
        service.send("/panel/browser");
    }

    /**
     * @inheritDoc
     */
    public function toggleInspector():void
    {
        service.send("/panel/inspector");
    }

    //--------------------------------------------------------------------------
    // Private :: Methods
    //--------------------------------------------------------------------------

    /**
     * Signals a UI refresh.
     *
     * <p>Don not call.</p>
     */
    private function flushComplete():void
    {
        dispatchValue(BitwigApplicationEventType.FLUSH_COMPLETE, null);
    }

    //--------------------------------------------------------------------------
    // Private :: Handlers
    //--------------------------------------------------------------------------

    private function handleLayout(osc:OSCMessage):void
    {
        layout = osc.arguments[0];
    }

    private function handleActivate(osc:OSCMessage):void
    {
        active = osc.arguments[0];
    }

    private function handleFlushComplete(osc:OSCMessage):void
    {
        flushComplete();
    }

    private function handleProjectName(osc:OSCMessage):void
    {
        projectName = osc.arguments[0];
    }
}
}
