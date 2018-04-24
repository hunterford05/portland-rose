# Portland Rose

![](https://img.shields.io/badge/version-0.0.0-green.svg)

## Introduction

Portland Rose, named for the **[portland class](https://
en.wikipedia.org/wiki/Garden_roses#Portland)** of rose, is the native 
iOS app for Compass Rose.

* Changelog: **[CHANGELOG.md](/CHANGELOG.md)**
* Documentation: **[DOCS.md](/DOCS.md)**

## Xcode Project Structure

```
.
|-- App
|   |-- Controllers
|   |-- Helpers
|   |-- Models
|   |-- Views
|   |   |-- LaunchScreen.storyboard
|   |-- AppDelegate.h
|   |-- AppDelegate.m
|   |-- Assets.xcassets
|   |-- Main.storyboard
|-- demo
|   |-- Helpers
|   |-- Mocks
|   |-- Models
|   |-- Views
|   |-- PORDemosViewController.h
|   |-- PORDemosViewController.m
|   |-- Demo.storyboard
|-- Config
|   |-- Info.plist
```

### App

`App` organizes Portland Rose's applicaiton components. 

* **Controllers** — The `Controllers` subdirectory contains the 
  application's `ViewController`s.
* **Helpers** — The `Helpers` subdirectory contains Objective-C
  category source files and other helper classes used to assist the 
  application's model, view, and controller classes.
* **Models** — The `Models` subdirectory contains the application's 
  model classes.
* **Views** — The `views` subdirectory contains the application's view 
  classes and `.xib` nib files.

### Demo

`Demo` contains view controllers and other components used to demo 
application components outside of the context of the app itself.

* **Helpers** - the `Helpers`subdirectory contains helper classes used
  for testing purposes
* **Mocks** - The `Mocks` subdirectory contains categories used to 
  generate randomized instances of models for testing purposes
* **Models** — The `Models` subdirectory contains view controller 
  classes designed to demo model classes.
* **Views** — The `Views` subdirectory contains view controller 
  classes designed to demo specific view classes.
* **PORDemosViewController.m** and **PORDemosViewController.h** — 
  These are the source files for the demo index scene.
* **Demo.storyboard** — `Demo.storyboard` is the interface builder for 
  demo view controllers.

### Config

`Config` contains app configuration and build files, such as 
`info.plist`.

## Building

### Preprocessor Macros

* **Demo** — the `DEMO` preprocessor macro indicates whether or not the 
  app should run in "Demo" mode. In "Demo" mode, `Demo.storyboard` is 
  the root storyboard.

### Schemes

Portland Rose can be built using one of three different "schemes": 
Development, Staging, and Production. 

* **Development** — This scheme is used for building and testing 
  individual application components. The `DEMO` preprocessor macro is 
  set to `1`.
* **Staging** — this scheme is used for staging the application.
* **Production** — this scheme is used to build production-ready 
  releases.

