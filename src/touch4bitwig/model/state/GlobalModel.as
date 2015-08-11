/**
 * Created by Teoti on 4/17/2015.
 */
package touch4bitwig.model.state
{

import touch4bitwig.model.support.AbstractModel;
import touch4bitwig.model.support.ApplicationModel;
import touch4bitwig.model.support.ConnectionInstance;
import touch4bitwig.model.support.DeviceModel;
import touch4bitwig.model.support.FrameModel;
import touch4bitwig.model.support.TrackModel;
import touch4bitwig.model.support.TransportModel;

public class GlobalModel extends AbstractModel
{
    [Inject]
    public var connection:ConnectionInstance;

    [Inject]
    public var trackModel:TrackModel;

    [Inject]
    public var transportModel:TransportModel;

    [Inject]
    public var deviceModel:DeviceModel;

    [Inject]
    public var userInterfaceModel:FrameModel;

    [Inject]
    public var applicationModel:ApplicationModel;

    public function GlobalModel()
    {
    }
}
}
