/**
 * Created by Teoti on 3/1/2015.
 */
package touch4bitwig.util
{

import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.utils.ByteArray;

public final class Files
{
    public static function getBaseName(file:File):String
    {
        if (file.isDirectory)
            return file.name;
        return file.name.substr(0, file.name.lastIndexOf('.'));
    }

    public static function sort(list:Vector.<File>, directoryIsTop:Boolean = true):Vector.<File>
    {
        var result:Vector.<File> = new <File>[];

        if (directoryIsTop)
        {
            var directories:Array = [];
            var files:Array = [];

            for (var i:int = 0; i < list.length; i++)
            {
                var current:File = File(list[i]);
                if (current.isDirectory)
                    directories[directories.length] = current;
                else
                    files[files.length] = current;
            }

            for (var j:int = 0; j < directories.length; j++)
            {
                result[result.length] = directories[j];
            }

            for (var k:int = 0; k < files.length; k++)
            {
                result[result.length] = files[k];
            }
        }

        return result;
    }

    public static function listDirectories(directory:File, recursive:Boolean = false):Vector.<File>
    {
        var result:Vector.<File> = getDirectoryListing(directory, null, true);
        // TODO impl listDirectories() recursive
        return result;
    }

    /**
     *
     * @param directory
     * @param filter file extension filters, pass null for all files.
     * @param recursive
     * @param directoriesOnTop
     * @param excludeDirectories
     * @return
     */
    public static function listFiles(directory:File,
                                     filter:Array = null,
                                     recursive:Boolean = false,
                                     directoriesOnTop:Boolean = true,
                                     excludeDirectories:Boolean = false):Vector.<File>
    {
        var result:Vector.<File> = new <File>[];

        if (!recursive)
            result = getDirectoryListing(directory, filter, excludeDirectories);
        else
            recursiveDirectoryListing(directory, result, filter, excludeDirectories);

        if (directoriesOnTop)
            result = sort(result);

        return result;
    }

    public static function getDirectoryListing(directory:File,
                                               filter:Array = null,
                                               directoriesOnly:Boolean = false,
                                               excludeDirectories:Boolean = false):Vector.<File>
    {
        var result:Vector.<File> = new <File>[];
        const listing:Array = directory.getDirectoryListing();
        var file:File;
        const len:int = listing.length;
        var i:int;
        if (directoriesOnly)
        {
            for (i = 0; i < len; i++)
            {
                file = File(listing[i]);
                if (file.isDirectory)
                {
                    result[result.length] = file;
                }
            }
        }
        else
        {
            for (i = 0; i < len; i++)
            {
                file = File(listing[i]);
                if (filter != null)
                {
                    for (var j:int = 0; j < filter.length; j++)
                    {
                        if (excludeDirectories && file.isDirectory)
                            continue;

                        if (file.isDirectory)
                        {
                            result[result.length] = file;
                            break;
                        }
                        else if (file.extension != null && file.extension.lastIndexOf(filter[j]) != -1)
                        {
                            result[result.length] = file;
                            break;
                        }
                    }
                }
                else
                {
                    result[result.length] = file;
                }
            }
        }
        return result;
    }

    public static function writeXMLFile(destination:File, data:String):void
    {
        data = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n" + data;
        data.replace(/\n/g, File.lineEnding);
        writeUTF8File(destination, data);
    }

    public static function readXMLFile(source:File):XML
    {
        return new XML(readUTF8File(source));
    }

    public static function writeUTF8File(destination:File, data:String):void
    {
        var stream:FileStream = new FileStream();
        stream.open(destination, FileMode.WRITE);
        stream.writeUTFBytes(data);
        stream.close();
    }

    public static function appendUTF8File(destination:File, data:String):void
    {
        var stream:FileStream = new FileStream();
        stream.open(destination, FileMode.APPEND);
        stream.writeUTFBytes(data);
        stream.close();
    }

    public static function readUTF8File(source:File):String
    {
        var stream:FileStream = new FileStream();
        stream.open(source, FileMode.READ);
        var result:String = stream.readUTFBytes(stream.bytesAvailable);
        stream.close();
        return result;
    }

    /**
     *
     * @param data
     * @param file
     * @throws CausticException
     */
    public static function serialize(data:Object, file:File):void
    {
        const bytes:ByteArray = new ByteArray();
        try
        {
            bytes.writeObject(data);
        }
        catch (e:Error)
        {
            trace(e.getStackTrace());
            throw new Error("Serialization failed:" + file.nativePath);
        }

        Files.writeBinaryFile(file, bytes);
    }

    public static function copy(data:Object):*
    {
        const bytes:ByteArray = new ByteArray();
        try
        {
            bytes.writeObject(data);
        }
        catch (e:Error)
        {
            trace(e.getStackTrace());
            throw new Error("Copy failed:");
        }
        bytes.position = 0;
        return bytes.readObject();
    }

    public static function deserialize(file:File):*
    {
        const data:ByteArray = Files.readBinaryFile(file);
        var instance:* = data.readObject();
        return instance;
    }

    public static function writeBinaryFile(destination:File, data:ByteArray, endian:String = null):void
    {
        var stream:FileStream = new FileStream();
        if (endian != null)
        {
            stream.endian = endian;
        }
        stream.open(destination, FileMode.WRITE);
        stream.writeBytes(data);
        stream.close();
    }

    public static function readBinaryFile(source:File, endian:String = null):ByteArray
    {
        var stream:FileStream = new FileStream();
        if (endian != null)
        {
            stream.endian = endian;
        }
        stream.open(source, FileMode.READ);
        var result:ByteArray = new ByteArray();
        stream.readBytes(result);
        stream.close();
        return result;
    }

    public static function contains(directories:Vector.<File>, fileOrDirectory:File):Boolean
    {
        if (directories == null)
            return false;

        const len:int = directories.length;
        for (var i:int = 0; i < len; i++)
        {
            if (directories[i].nativePath == fileOrDirectory.nativePath)
                return true;
        }
        return false;
    }

    public static function containsExtensions(directory:File, extensions:Array):Vector.<File>
    {
        var result:Vector.<File> = new <File>[];

        if (directory == null)
            return result;

        recursiveDirectoryListing(directory, result, extensions, true);

        return result;
    }

    /**
     * Checks whether the fileOrDirectory is contained within the directories
     * collection's sourceDirectory tree.
     *
     * @param directories The source directory collection.
     * @param fileOrDirectory The possible child of the parent directory.
     */
    public static function directoriesContain(directories:Vector.<File>, fileOrDirectory:File):Boolean
    {
        if (contains(directories, fileOrDirectory))
            return true;

        for (var i:int = 0; i < directories.length; i++)
        {
            if (isInSubDirectory(File(directories[i]), fileOrDirectory))
                return true;
        }

        return false;
    }

    /**
     * Checks whether the fileOrDirectory is contained within the
     * sourceDirectory tree.
     *
     * @param directory The parent directory.
     * @param fileOrDirectory The possible child of the parent directory.
     */
    public static function isInSubDirectory(directory:File, fileOrDirectory:File):Boolean
    {
        if (fileOrDirectory == null)
            return false;

        if (fileOrDirectory.nativePath == directory.nativePath)
            return true;

        return isInSubDirectory(directory, fileOrDirectory.parent);
    }

    public static function deleteFile(file:File):void
    {
        try
        {
            file.deleteFileAsync();
        }
        catch (e:SecurityError)
        {
            trace(e.getStackTrace());
        }
    }

    private static function recursiveDirectoryListing(directory:File,
                                                      result:Vector.<File>,
                                                      filter:Array = null,
                                                      excludeDirectories:Boolean = false):void
    {
        if (directory.isDirectory)
        {
            var files:Vector.<File> = getDirectoryListing(directory, filter, false, excludeDirectories);
            for (var i:int = 0; i < files.length; i++)
            {
                result[result.length] = files[i];
                if (files[i].isDirectory)
                {
                    recursiveDirectoryListing(files[i], result, filter, excludeDirectories);
                }
            }
        }
    }
}
}
