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

package touch4bitwig.service.support
{

import com.teotigraphix.service.IFileService;
import com.teotigraphix.service.async.IStepCommand;

import flash.filesystem.File;

import org.robotlegs.starling.core.IInjector;

import touch4bitwig.app.config.ApplicationConfiguration;
import touch4bitwig.service.IConfigurationService;

public class ConfigurationService implements IConfigurationService
{
    [Inject]
    public var injector:IInjector;

    [Inject]
    public var fileService:IFileService;

    public function ConfigurationService()
    {
    }

    public function loadLastConfigurationFile():ApplicationConfiguration
    {
        var configuration:ApplicationConfiguration;
        var file:File = File.applicationDirectory.resolvePath("config.xml");
        if (file.exists)
        {
            configuration = load(file);
        }
        return configuration;
    }

    public function loadIPsAsync():IStepCommand
    {
        return injector.instantiate(LoadIPsStep);
    }

    private function load(configFile:File):ApplicationConfiguration
    {
        var data:String = fileService.readString(configFile);
        var config:ApplicationConfiguration = new ApplicationConfiguration(data);
        return config;
    }

}
}

import com.teotigraphix.service.async.StepCommand;

import feathers.data.HierarchicalCollection;

import flash.net.InterfaceAddress;
import flash.net.NetworkInfo;
import flash.net.NetworkInterface;

/*


var groceryList:HierarchicalCollection = new HierarchicalCollection(
[
    {
        header: { text: "Dairy" },
        children:
        [
            { text: "Milk", thumbnail: textureAtlas.getTexture( "milk" ) },
            { text: "Cheese", thumbnail: textureAtlas.getTexture( "cheese" ) },
        ]
    },
    {
        header: { text: "Bakery" },
        children:
        [
            { text: "Bread", thumbnail: textureAtlas.getTexture( "bread" ) },
        ]
    },
    {
        header: { text: "Produce" },
        children:
        [
            { text: "Bananas", thumbnail: textureAtlas.getTexture( "bananas" ) },
            { text: "Lettuce", thumbnail: textureAtlas.getTexture( "lettuce" ) },
            { text: "Onion", thumbnail: textureAtlas.getTexture( "onion" ) },
        ]
    },
]);
list.dataProvider = groceryList;

---------------------------------------------------
>>> Name : {474887B4-FF4B-4974-9233-EF49DF700EBE}
>>> DisplayName : Wireless Network Connection
>>> Active : true
>>> MTU : 1492
===========================
>>> !!!! Address: 192.168.1.2
>>> !!!! Broadcast: 192.168.1.255
>>> !!!! IP Version: IPv4
>>> !!!! Prefix Length: 24
---------------------------------------------------
>>> Name : {E2E0A300-A8CA-46F9-8570-6F081F609F5C}
>>> DisplayName : LAN
>>> Active : false
>>> MTU : 1500
===========================
>>> !!!! Address: 169.254.94.25
>>> !!!! Broadcast: 169.254.255.255
>>> !!!! IP Version: IPv4
>>> !!!! Prefix Length: 16
===========================
>>> !!!! Address: 192.168.137.1
>>> !!!! Broadcast: 192.168.137.255
>>> !!!! IP Version: IPv4
>>> !!!! Prefix Length: 24
---------------------------------------------------
>>> Name : {846EE342-7039-11DE-9D20-806E6F6E6963}
>>> DisplayName : Loopback Pseudo-Interface 1
>>> Active : true
>>> MTU : -1
===========================
>>> !!!! Address: ::1
>>> !!!! Broadcast:
>>> !!!! IP Version: IPv6
>>> !!!! Prefix Length: 128
===========================
>>> !!!! Address: 127.0.0.1
>>> !!!! Broadcast:
>>> !!!! IP Version: IPv4
>>> !!!! Prefix Length: 8

 */

class LoadIPsStep extends StepCommand
{

    override public function commit():*
    {
        var result:Array = [];

        var networkInterfaces:Vector.<NetworkInterface> = NetworkInfo.networkInfo.findInterfaces();
        for each (var ni:NetworkInterface in networkInterfaces)
        {
            var obj:Object = {header: {text: ni.displayName}, children: []};

            trace("---------------------------------------------------");
            trace(">>> Name : " + ni.name);
            trace(">>> DisplayName : " + ni.displayName);
            trace(">>> Active : " + ni.active);
            trace(">>> MTU : " + ni.mtu);
            for each (var address:InterfaceAddress in ni.addresses)
            {
                trace("===========================");
                trace(">>> !!!! Address: " + address.address);
                trace(">>> !!!! Broadcast: " + address.broadcast);
                trace(">>> !!!! IP Version: " + address.ipVersion);
                trace(">>> !!!! Prefix Length: " + address.prefixLength);

                obj.children.push({text: address.address});
            }

            result.push(obj);
        }

        return new HierarchicalCollection(result);
    }

    override public function execute():*
    {
        var result:HierarchicalCollection = commit();

        complete(result);

        return result;
    }
}
