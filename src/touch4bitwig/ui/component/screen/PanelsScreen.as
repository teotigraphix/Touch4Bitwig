/**
 * Created by Teoti on 4/5/2015.
 */
package touch4bitwig.ui.component.screen
{

import com.teotigraphix.bitwig.ui.component.frame.PanelLayoutGroup;
import com.teotigraphix.bitwig.ui.component.frame.PanelSubToggleGroup;
import com.teotigraphix.bitwig.ui.component.frame.PanelToggleGroup;
import com.teotigraphix.bitwig.ui.component.main.MainHeader;
import com.teotigraphix.ui.component.UIKnob;

import feathers.controls.Header;
import feathers.controls.LayoutGroup;
import feathers.controls.Screen;
import feathers.layout.VerticalLayout;
import feathers.layout.VerticalLayoutData;

public class PanelsScreen extends Screen
{
    private var _uiKnob1:UIKnob;
    private var _panelLayoutGroup:PanelLayoutGroup;
    private var _panelToggleGroup:PanelToggleGroup;
    private var _panelSubToggleGroup:PanelSubToggleGroup;

    public function PanelsScreen()
    {
    }

    override protected function initialize():void
    {
        var vl:VerticalLayout = new VerticalLayout();
        layout = vl;

        super.initialize();

        var header:Header = new MainHeader();
        header.layoutData = new VerticalLayoutData(100);
        addChild(header);

        // Arrange, Mix Edit
        _panelLayoutGroup = createPanelLayoutGroup();
        _panelLayoutGroup.layoutData = new VerticalLayoutData(100);
        addChild(_panelLayoutGroup);

        // Arrange; CueMarkers, PlaybackFollow

        // Toggles;      NoteEditor, Automation, Device, Mixer, Browser, Inspector
        _panelToggleGroup = createPanelToggleGroup();
        _panelToggleGroup.layoutData = new VerticalLayoutData(100);
        addChild(_panelToggleGroup);

        // Arrange;      Notes, Automation, Device, Mixer
        // Mix;          Notes, Automation, Device
        // Edit;         Device, Mixer

        // Arrange; ClipLauncher, Timeline, IO, , EffectTracks, TrackHeight, ActivateTracks
        // Mix;     ClipLauncher, Meters, DeviceChain, Sends, IO, EffectTracks, ActivateTracks, Crossfade
        // Edit;    N/A

        _panelSubToggleGroup = createPanelSubToggleGroup();
        _panelSubToggleGroup.layoutData = new VerticalLayoutData(100);
        addChild(_panelSubToggleGroup);

        // Application;

        var spacer:LayoutGroup = new LayoutGroup();
        spacer.layoutData = new VerticalLayoutData(100, 100);
        addChild(spacer);
    }

    override protected function draw():void
    {
        super.draw();
    }

    private function createPanelLayoutGroup():PanelLayoutGroup
    {
        var group:PanelLayoutGroup = new PanelLayoutGroup();
        return group;
    }

    private function createPanelToggleGroup():PanelToggleGroup
    {
        var group:PanelToggleGroup = new PanelToggleGroup();
        return group;
    }

    private function createPanelSubToggleGroup():PanelSubToggleGroup
    {
        var group:PanelSubToggleGroup = new PanelSubToggleGroup();
        return group;
    }
}
}
