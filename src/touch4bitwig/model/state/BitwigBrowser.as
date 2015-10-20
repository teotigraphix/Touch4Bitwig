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

import touch4bitwig.model.IBitwigBrowser;
import touch4bitwig.service.IOSCService;

public class BitwigBrowser extends AbstractBitwigState implements IBitwigBrowser
{
    private var numFilterColumns:int = 6;
    private var numFilterColumnEntries:int = 16;
    private var numResults:int = 16;

    private var _filters:Vector.<BitwigBrowserFilterItem> = new <BitwigBrowserFilterItem>[];

    //--------------------------------------------------------------------------
    // Constructor
    //--------------------------------------------------------------------------

    public function BitwigBrowser(service:IOSCService)
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
        /*

        /browser/isActive
        /browser/filter/[i]/exists
        /browser/filter/[i]/name

        /browser/filter/[i]/item/[j]/exists
        /browser/filter/[i]/item/[j]/name
        /browser/filter/[i]/item/[j]/hits
        /browser/filter/[i]/item/[j]/isSelected

        /browser/preset/[i]/exists
        /browser/preset/[i]/name
        /browser/preset/[i]/hits
        /browser/preset/[i]/isSelected

         */

        var i:int;
        var j:int;

        _methods["/browser/isActive"] = handleIsActive;
        _methods["/browserComplete"] = handleBrowserComplete;


        for (i = 1; i <= numFilterColumns; i++)
        {
            _methods["/browser/filter/" + i + "/exists"] = handleFilterExists;
            _methods["/browser/filter/" + i + "/name"] = handleFilterName;

            for (j = 1; j <= numFilterColumnEntries; j++)
            {
                _methods["/browser/filter/" + i + "/item/" + j + "/exists"] = handleItemExists;
                _methods["/browser/filter/" + i + "/item/" + j + "/name"] = handleItemName;
                _methods["/browser/filter/" + i + "/item/" + j + "/hits"] = handleItemHits;
                _methods["/browser/filter/" + i + "/item/" + j + "/isSelected"] = handleItemIsSelected;
            }
        }

        for (i = 1; i <= numResults; i++)
        {
            _methods["/browser/preset" + i + "/exists"] = handlePresetExists;
            _methods["/browser/preset" + i + "/name"] = handlePresetName;
            _methods["/browser/preset" + i + "/hits"] = handlePresetHits;
            _methods["/browser/preset" + i + "/isSelected"] = handlePresetIsSelcted;
        }
    }

    /**
     * @inheritDoc
     */
    override public function dispose():void
    {
        _methods = [];
    }

    private static function toIndex(osc:OSCMessage):int
    {
        var split:Array = osc.address.split("/");
        return int(split[2]) - 1;
    }

    private static function toItemIndex(osc:OSCMessage):int
    {
        var split:Array = osc.address.split("/");
        return int(split[4]) - 1;
    }

    public function handleBrowserComplete(osc:OSCMessage):void
    {
        trace("BitwigBrowser.handleBrowserComplete()");
    }

    public function handleIsActive(osc:OSCMessage):void
    {
        trace("BitwigBrowser.handleIsActive( ) " + osc.toString());

        var i:int;
        var j:int;

        _filters = new <BitwigBrowserFilterItem>[];
        for (i = 1; i <= numFilterColumns; i++)
        {
            var item:BitwigBrowserFilterItem = new BitwigBrowserFilterItem(i);
            _filters.push(item);
        }
    }

    public function handleFilterExists(osc:OSCMessage):void
    {
        var index:int = toIndex(osc);
        _filters[index + 1].exists = osc.arguments[0] == 1;
        trace("BitwigBrowser.handleFilterExists( ) " + osc.toString());
    }

    public function handleFilterName(osc:OSCMessage):void
    {
        var index:int = toIndex(osc);
        _filters[index + 1].name = osc.arguments[0];
        trace("BitwigBrowser.handleFilterName( ) " + osc.toString());
    }

    public function handleItemExists(osc:OSCMessage):void
    {

    }

    public function handleItemName(osc:OSCMessage):void
    {

    }

    public function handleItemHits(osc:OSCMessage):void
    {

    }

    public function handleItemIsSelected(osc:OSCMessage):void
    {

    }

    public function handlePresetExists(osc:OSCMessage):void
    {

    }

    public function handlePresetName(osc:OSCMessage):void
    {

    }

    public function handlePresetIsSelcted(osc:OSCMessage):void
    {

    }

    public function handlePresetHits(osc:OSCMessage):void
    {

    }

    //--------------------------------------------------------------------------
    // API :: Methods
    //--------------------------------------------------------------------------

    /**
     * @inheritDoc
     */
    public function browseForPresets():void
    {
        service.send("/browser/presets");
    }

    /**
     * @inheritDoc
     */
    public function browseForDevices():void
    {
        service.send("/browser/devices");
    }

    /**
     * @inheritDoc
     */
    public function commit():void
    {
        service.send("/browser/commit");
    }

    /**
     * @inheritDoc
     */
    public function cancel():void
    {
        service.send("/browser/cancel");
    }

    /**
     * @inheritDoc
     */
    public function selectNextFilterItem(column:int):void
    {
        service.send("/browser/filter/" + column + "/+");
    }

    /**
     * @inheritDoc
     */
    public function selectPreviousFilterItem(column:int):void
    {
        service.send("/browser/filter/" + column + "/-");
    }

    /**
     * @inheritDoc
     */
    public function selectNextResult():void
    {
        service.send("/browser/preset/+");
    }

    /**
     * @inheritDoc
     */
    public function selectPreviousResult():void
    {
        service.send("/browser/preset/-");
    }
}
}

/*

/browser/presets
/browser/devices
/browser/commit
/browser/cancel

/browser/filter/[column]/+
/browser/filter/[column]/-

/browser/preset/+
/browser/preset/-

 */