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
package touch4bitwig.controller
{

import com.teotigraphix.core.sdk_internal;
import com.teotigraphix.ui.screen.IScreenNavigator;
import com.teotigraphix.ui.screen.core.AbstractScreenLauncher;

import touch4bitwig.view.ApplicationScreens;
import touch4bitwig.view.screen.ClipsScreen;
import touch4bitwig.view.screen.ClipsScreenMediator;
import touch4bitwig.view.screen.ConfigurationScreen;
import touch4bitwig.view.screen.ConfigurationScreenMediator;
import touch4bitwig.view.screen.DeviceScreen;
import touch4bitwig.view.screen.DeviceScreenMediator;
import touch4bitwig.view.screen.MixerScreen;
import touch4bitwig.view.screen.MixerScreenMediator;
import touch4bitwig.view.screen.PanelsScreen;
import touch4bitwig.view.screen.PanelsScreenMediator;
import touch4bitwig.view.screen.TransportScreen;

public class ScreenLauncher extends AbstractScreenLauncher
{
    public function ScreenLauncher()
    {
        super();
    }

    override protected function configure(navigator:IScreenNavigator):void
    {
        super.configure(navigator);

        navigator.addScreen(ApplicationScreens.SCREEN_CONFIGURATION,
                            create(ConfigurationScreen, ConfigurationScreenMediator));
        navigator.addScreen(ApplicationScreens.SCREEN_MIXER,
                            create(MixerScreen, MixerScreenMediator));
        navigator.addScreen(ApplicationScreens.SCREEN_TRANSPORT,
                            create(TransportScreen, null));
        navigator.addScreen(ApplicationScreens.SCREEN_PANEL,
                            create(PanelsScreen, PanelsScreenMediator));
        navigator.addScreen(ApplicationScreens.SCREEN_CLIPS,
                            create(ClipsScreen, ClipsScreenMediator));
        navigator.addScreen(ApplicationScreens.SCREEN_DEVICE,
                            create(DeviceScreen, DeviceScreenMediator));
    }

    public function goToConfiguration():void
    {
        sdk_internal::setApplicationScreen(ApplicationScreens.SCREEN_CONFIGURATION, {});
    }

    public function goToMixer():void
    {
        back();
        sdk_internal::setApplicationScreen(ApplicationScreens.SCREEN_MIXER, {});
    }

    public function goToTransport():void
    {
        back();
        sdk_internal::setApplicationScreen(ApplicationScreens.SCREEN_TRANSPORT, {});
    }

    public function goToPanels():void
    {
        back();
        sdk_internal::setApplicationScreen(ApplicationScreens.SCREEN_PANEL, {});
    }

    public function goToClips():void
    {
        back();
        sdk_internal::setApplicationScreen(ApplicationScreens.SCREEN_CLIPS, {});
    }

    public function goToDevice():void
    {
        back();
        sdk_internal::setApplicationScreen(ApplicationScreens.SCREEN_DEVICE, {});
    }
}
}
