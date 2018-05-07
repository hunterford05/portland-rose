# Portland Rose

![](https://img.shields.io/badge/version-0.0.1-green.svg)

## Introduction

Portland Rose, named for the **[portland class](
https://en.wikipedia.org/wiki/Garden_roses#Portland)** of rose, is the 
native iOS app for **[Compass Rose](
https://github.com/nggonzalez/Compass-Rose)**.

* Changelog: **[CHANGELOG.md](/docs/CHANGELOG.md)**
* Documentation: **[DOCS.md](/docs/DOCS.md)**

## Project Setup

Portland Rose requires **[Xcode][1]** (version 9.3). To build and 
run Portland Rose, open `Portland\ Rose/Portland Rose.xcodeproj`,
choose the desired build scheme and simulator, and press the 
build and run button.

### Schemes

Portland Rose can be built using one of four different "schemes": 
Demo, Development, Staging, and Production. 

* **Demo** — this scheme is used for building and testing  
  individual application components.  The app will use
  `Demo.storyboard` instead of `Main.storyboard`.
* **Development** — this scheme is for integration work. A.P.I. 
  requests will return mock objects.
* **Staging** — this scheme is for testing integration work.  A.P.I.
  requests are directed to a staging endpoint.
* **Production** — this scheme is used to create release-ready 
  archives for distribution on the app store. 

## Releasing A New Version

1. Update `docs/CHANGELOG.md`.
2. Update the current version number in `README.md`.
3. Update the version number and build number in `Info.plist`.

[1]: https://developer.apple.com/xcode/

<!--
 vim:tw=72:bk
-->
