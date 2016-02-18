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
package t4b.model.osc
{

import com.teotigraphix.frameworks.osc.OSCMessage;

/**
 * The IBitwigStateListener handles native OSCMessage's that are sent from Bitwig.
 */
public interface IBitwigStateListener
{
    //--------------------------------------------------------------------------
    // Methods
    //--------------------------------------------------------------------------

    /**
     * Configures the listener, usually called when the listener is added to the controller.
     */
    function configure():void;

    /**
     * Disposes the listener, usually called when the listener is removed from the controller.
     */
    function dispose():void;

    /**
     * Returns whether the state can handle the OSC message.
     *
     * @param message the OSCMessage.
     */
    function isHandled(message:OSCMessage):Boolean;

    /**
     * Handles the OSCMessage.
     *
     * @param message the OSCMessage.
     */
    function handle(message:OSCMessage):void;
}
}
