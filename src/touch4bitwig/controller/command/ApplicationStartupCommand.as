/**
 * Created by Teoti on 4/3/2015.
 */
package touch4bitwig.controller.command
{

import touch4bitwig.controller.*;

import flash.net.InterfaceAddress;
import flash.net.NetworkInfo;
import flash.net.NetworkInterface;

import org.robotlegs.starling.mvcs.Command;

import starling.core.Starling;
import starling.events.Event;

import touch4bitwig.event.ApplicationEventType;

import touch4bitwig.model.state.GlobalModel;
import touch4bitwig.model.support.ConnectionInstance;
import touch4bitwig.service.IOSCService;

public class ApplicationStartupCommand extends Command
{
    [Inject]
    public var applicationController:ApplicationController;

    [Inject]
    public var event:Event;

    [Inject]
    public var model:GlobalModel;

    [Inject]
    public var oscService:IOSCService;

    override public function execute():void
    {
        trace("StartupCommand.execute()");

        var connection:ConnectionInstance = model.connection;
        connection.setup("192.168.1.3", 9000, "192.168.1.3", 8000);

        printAddresses();

        var bound:Boolean = connection.connect();
        if (!bound)
        {
            printAddresses();
            return;
        }

        oscService.start(model);

        Starling.juggler.delayCall(function ():void
                                   {
                                       dispatchWith(ApplicationEventType.APPLICATION_COMPLETE);
                                   }, 0.2);
    }

    private function printAddresses():void
    {
        var networkInterfaces:Vector.<NetworkInterface> = NetworkInfo.networkInfo.findInterfaces();
        for each (var ni:NetworkInterface in networkInterfaces)
        {
            trace("---------------------------------------------------");
            trace(">>> Name : " + ni.name);
            trace(">>> DisplayName : " + ni.displayName);
            trace(">>> Active : " + ni.active);
            trace(">>> MTU : " + ni.mtu);
            for each (var address:InterfaceAddress in ni.addresses)
            {
                trace(">>> !!!! Address: " + address.address);
                trace(">>> !!!! Broadcast: " + address.broadcast);
                trace(">>> !!!! IP Version: " + address.ipVersion);
                trace(">>> !!!! Prefix Length: " + address.prefixLength);
            }
        }
    }
}
}
