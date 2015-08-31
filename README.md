# Touch4Bitwig
Mobile implementation of Bitwig Studio's controller API.

Original thread on KVR; http://www.kvraudio.com/forum/viewtopic.php?f=259&t=435857&start=15

This is an Adobe AIR, Feathers UI GPU mobile application. It's developed with ActionScript and
uses an IOC(Inversion of Control) application framework to manage runtime dependency injection.

The data transport layer is OSC messages over WIFI to and from Bitwig Studio and a mobile device/s.

The AIR FeathersUI SDK for user interface components;

* http://feathersui.com/sdk/

There are 2 repositories that are built to create the app;

* https://github.com/teotigraphix/FeathersExtensions
* https://github.com/teotigraphix/Touch4Bitwig

There is 1 repository that is the Bitwig Studio controller script that needs to be installed for the application
to communicate with Bitwig.

* https://github.com/teotigraphix/Touch4BitwigOSC

We use IntelliJ IDEA for ActionScript and MXML development and building.

## Status

Alpha 0.1

Currently the UI and usability is still being designed. The application is built around components
and screens so in the end, any number of views can be created reusing existing component
building blocks.

## Development

The master branch is always in a working state, where tags and releases are merged from develop.
The develop branch is the bleeding edge alpha code where there could be times it breaks.

The master will hold the binary releases when at a non beta stage.