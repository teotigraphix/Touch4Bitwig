/**
 * Created by Teoti on 8/15/2015.
 */
package touch4bitwig.app.config
{

/*

src/config.xml

<?xml version="1.0" encoding="utf-8"?>
<configuration>
    <connection>
        <server port="9000" ip="192.168.1.3"/>
        <client port="8000" ip="192.168.1.3"/>
    </connection>
</configuration>

 */

public class ApplicationConfiguration
{
    public var serverPort:int;
    public var clientPort:int;
    public var serverIP:String;
    public var clientIP:String;

    public function ApplicationConfiguration(data:String)
    {
        var xml:XML = new XML(data);
        serverPort = xml.connection[0].server.@port;
        serverIP = xml.connection[0].server.@ip;
        clientPort = xml.connection[0].client.@port;
        clientIP = xml.connection[0].client.@ip;
    }
}
}
