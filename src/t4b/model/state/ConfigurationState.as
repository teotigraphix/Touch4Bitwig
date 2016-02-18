package t4b.model.state
{
public class ConfigurationState
{
    // output
    public var dawPort:int = 8000; // Device to DAW
    public var dawIP:String = "127.0.0.1";
    
    // input
    public var devicePort:int = 9000; // DAW to Device
    public var deviceIP:String = "127.0.0.1";
    
    public function ConfigurationState()
    {
    }
    
    public function setup(dawPort:int, dawIP:String, devicePort:int, deviceIP:String):void
    {
        this.deviceIP = deviceIP;
        this.devicePort = devicePort;
        this.dawIP = dawIP;
        this.dawPort = dawPort;
    }
}
}