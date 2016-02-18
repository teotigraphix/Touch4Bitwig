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
package t4b.view.core
{

import com.teotigraphix.ui.core.AbstractMediator;

import t4b.model.IApplicationModel;

public class AbstractMediator extends com.teotigraphix.ui.core.AbstractMediator
{
    //--------------------------------------------------------------------------
    // Inject
    //--------------------------------------------------------------------------

    [Inject]
    public var model:IApplicationModel;

    //--------------------------------------------------------------------------
    // Constructor
    //--------------------------------------------------------------------------

    public function AbstractMediator()
    {
    }

    override public function onRegister():void
    {
        super.onRegister();
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    override protected function onOrientationChange(isLandscape:Boolean, isTablet:Boolean):void
    {
        super.onOrientationChange(isLandscape, isTablet);
    }
}
}
