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
package t4b.controller
{

import com.teotigraphix.ui.core.AbstractUIController;

public class UIController extends AbstractUIController
{
    //--------------------------------------------------------------------------
    // IMPL
    //--------------------------------------------------------------------------
        
    public function get factory():UIFactory
    {
        return _factory as UIFactory;
    }
    
    public function get state():UIState
    {
        return _state as UIState;
    }
    
    //--------------------------------------------------------------------------
    // API :: Properties
    //--------------------------------------------------------------------------
    
    public function UIController()
    {
    }

    override protected function onRegister():void
    {
        super.onRegister();
    }
}
}
