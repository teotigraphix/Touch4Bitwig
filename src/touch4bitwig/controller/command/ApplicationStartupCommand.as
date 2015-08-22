/**
 * Created by Teoti on 4/3/2015.
 */
package touch4bitwig.controller.command
{

import flash.net.InterfaceAddress;
import flash.net.NetworkInfo;
import flash.net.NetworkInterface;

import org.robotlegs.starling.mvcs.Command;

import starling.core.Starling;
import starling.events.Event;

import touch4bitwig.app.config.ApplicationConfiguration;
import touch4bitwig.controller.*;
import touch4bitwig.event.ApplicationEventType;
import touch4bitwig.model.IOSCModel;
import touch4bitwig.model.support.ConnectionInstance;
import touch4bitwig.service.IOSCService;

public class ApplicationStartupCommand extends Command
{
    [Inject]
    public var applicationController:ApplicationController;

    [Inject]
    public var event:Event;

    [Inject]
    public var oscModel:IOSCModel;

    [Inject]
    public var oscService:IOSCService;

    override public function execute():void
    {
        trace("StartupCommand.execute()");

        // TODO this will ne asnyc, right now it's reading from the file system which is sync
        oscModel.setup();

        var config:ApplicationConfiguration = oscModel.configuration;

        var connection:ConnectionInstance = oscModel.connection;
        connection.setup(config.serverIP, config.serverPort, config.clientIP, config.clientPort);

        printAddresses();

        var bound:Boolean = connection.connect();
        if (!bound)
        {
            printAddresses();
            return;
        }

        oscService.start(oscModel);

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
