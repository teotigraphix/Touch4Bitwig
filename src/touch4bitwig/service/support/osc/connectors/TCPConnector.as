package touch4bitwig.service.support.osc.connectors
{

import com.teotigraphix.frameworks.osc.IOSCConnector;
import com.teotigraphix.frameworks.osc.IOSCConnectorListener;
import com.teotigraphix.frameworks.osc.OSCBundle;
import com.teotigraphix.frameworks.osc.OSCEvent;
import com.teotigraphix.frameworks.osc.OSCMessage;
import com.teotigraphix.frameworks.osc.OSCPacket;
import com.teotigraphix.frameworks.osc.connectors.tcp.OSCSocket;

import flash.utils.ByteArray;

/**
 * An implementation of the <code>IOSCConnector</code> using TCP.
 * Note that the <code>TuioConnector</code> only works with bridges and trackers tht send TUIO in binary form via
 * TCP i.e. <b>not XML</b>
 */
public class TCPConnector implements IOSCConnector
{

    private var host:String;
    private var port:int;

    private var connection:OSCSocket;

    private var listeners:Array;

    /**
     * Creates a new instance of the TCPConnector
     * @param    host The IP of the tracker or bridge.
     * @param    port The port on which the tracker or bridge sends the TUIO tracking data.
     */
    public function TCPConnector(host:String = "127.0.0.1", port:int = 3333)
    {

        this.listeners = new Array();

        this.host = host;
        this.port = port;

        this.connection = new OSCSocket();
        this.connection.addEventListener(OSCEvent.OSC_DATA, receiveOscData);

        this.connection.connect(host, port);
    }

    /**
     * @inheritDoc
     */
    public function addListener(listener:IOSCConnectorListener):void
    {

        if (this.listeners.indexOf(listener) > -1) return;

        this.listeners.push(listener);

    }

    /**
     * @inheritDoc
     */
    public function removeListener(listener:IOSCConnectorListener):void
    {

        var tmp:Array = this.listeners.concat();
        var newList:Array = [];

        var item:Object = tmp.pop();
        while (item != null)
        {
            if (item != listener) newList.push(item);
        }

        this.listeners = newList;

    }

    /**
     * <b>not implemented</b>
     * @inheritDoc
     */
    public function sendOSCPacket(oscPacket:OSCPacket):void
    {
        // Not Implemented
    }

    /**
     * @inheritDoc
     */
    public function close():void
    {
        if (this.connection.connected) this.connection.close();
    }

    private function debug(msg:String):void
    {
        trace(msg);
    }

    /**
     * @private
     */
    public function receiveOscData(e:OSCEvent):void
    {
        var packet:ByteArray = new ByteArray();
        packet.writeBytes(e.data, 4);
        packet.position = 0;
        if (packet != null)
        {
            if (this.listeners.length > 0)
            {
                //call receive listeners and push the received messages
                for each(var l:IOSCConnectorListener in this.listeners)
                {
                    if (OSCBundle.isBundle(packet))
                    {
                        l.acceptOSCPacket(new OSCBundle(packet));
                    }
                    else if (OSCMessage.isMessage(packet))
                    {
                        l.acceptOSCPacket(new OSCMessage(packet));
                    }
                    else
                    {
                        this.debug("\nreceived: invalid osc packet.");
                    }
                }
            }
        }
    }

}

}
	