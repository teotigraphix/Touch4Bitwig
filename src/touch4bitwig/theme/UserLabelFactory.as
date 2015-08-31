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

package touch4bitwig.theme
{

import com.teotigraphix.ui.theme.AbstractTheme;
import com.teotigraphix.ui.theme.LabelFactory;

import feathers.controls.Label;

import flash.text.engine.ElementFormat;

public class UserLabelFactory extends LabelFactory
{
    public var veryLargeUILightElementFormat:ElementFormat;

    public function UserLabelFactory(theme:AbstractTheme)
    {
        super(theme);
    }

    override public function initializeStyleProviders():void
    {
        super.initializeStyleProviders();

        setStyle(Label, setTrackHeaderLabelStyles, "track-header-label");

        setStyle(Label, setTransportDisplayPositionLabelStyles, StyleNames.TRANSPORT_DISPLAY_POSITION);
        setStyle(Label, setTransportDisplayPositionLabelStyles, StyleNames.TRANSPORT_DISPLAY_TEMPO);
        setStyle(Label, setTransportDisplayPositionLabelStyles, StyleNames.TRANSPORT_DISPLAY_TIME);
        setStyle(Label, setTransportDisplayPositionLabelStyles, StyleNames.TRANSPORT_DISPLAY_TIME_SIGNATURE);

        setStyle(Label, setHeaderTitleLabelStyles, StyleNames.HEADER_TITLE_LABEL);
    }

    override public function initializeFonts():void
    {
        super.initializeFonts();

        veryLargeUILightElementFormat = new ElementFormat(theme.fonts.boldFontDescription, 75,
                                                          StyleNames.FONT_COLOR_BITWIG_BLUE);
    }

    private function setTrackHeaderLabelStyles(label:Label):void
    {
        label.textRendererProperties.elementFormat = theme.fonts.largeUILightElementFormat;
        label.textRendererProperties.disabledElementFormat = theme.fonts.largeUILightDisabledElementFormat;
    }

    private function setTransportDisplayPositionLabelStyles(label:Label):void
    {
        label.textRendererProperties.elementFormat = veryLargeUILightElementFormat;
        label.textRendererProperties.disabledElementFormat = veryLargeUILightElementFormat;
    }

    private function setHeaderTitleLabelStyles(label:Label):void
    {
        label.textRendererProperties.elementFormat = theme.fonts.headerElementFormat;
    }
}
}
