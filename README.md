# Portland Rose

![](https://img.shields.io/badge/version-1.0.0-red.svg)

## Introduction

Portland Rose, named for the **[portland class](https://en.wikipedia.org/wiki/Garden_roses#Portland)** of rose, is the native iOS app for Compass Rose.

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

* **Controllers** — The `Controllers` subdirectory contains the application's `ViewController`s.
* **Helpers** — The `Helpers` subdirectory contains Objective-C category source files and other helper classes used to assist the application's model, view, and controller classes.
* **Models** — The `Models` subdirectory contains the application's model classes.
* **Views** — The `views` subdirectory contains the application's view classes and `.xib` nib files.

### Demo

`Demo` contains view controllers and other components used to demo application components outside of the context of the app itself.

* **Views** — The `Views` subdirectory contains view controller classes designed to demo specific view classes.
* **Models** — The `Models` subdirectory contains view controller classes designed to demo model classes.
* **PORDemosViewController.m** and **PORDemosViewController.h** — These are the source files for the demo index scene.
* **Demo.storyboard** — `Demo.storyboard` is the interface builder for demo view controllers.

### Config

`Config` contains app configuration and build files, such as `info.plist`.


# Models

## Palette

The `PORPalette` model stores Portland Rose's custom colors. These colors are organized by function (e.g. color for dividers) rather than by visual color (e.g. "red"). 

* **Background Color** — `colorBackground` contains the default background color used for the app's scenes and content views.
* **Divider Color** — `colorDivider` is the default color for the thin divider lines between views.
* **Primary Color** — `colorPrimary` is the primary theme color for 'branded' elements and prominent controls.
* **Secondary Color** — `colorSecondary` is a variant of `colorPrimary` used along with the former in gradients.
* **Text Color** — `colorText` is the default color of application text.
* **Text Color (Inverted)** — `colorTextInverted` is the default color for text displayed on a dark color background.
* **Text Color (Loud)** — `colorTextLoud` is the default color for emphasized text.

### Usage

1. Import `"PORPalette.h"`
2. create a pointer to the shared `PORPalette` singleton: 
  ```objective-c
  PORPalette * palette = PORPalette.sharedPalette;
  ```
3. Access the palette's colors like this: 
  ```objective-c
  UIColor * color = palette.colorText;
  ```

### Customization

**Adding New Colors**

To add a new color by hex value and update one or more of the palette's color properties to use that new color:

1. Add the new color's hex value as a `static NSString *` in `PORPalette.m`
  ```objective-c
  // PORPalette.m
  static NSString * const HEX_NEW_COLOR = @"EAEAEA";
  ```
2. Update the `init` function to set one or more of the palette's color properties equal to the new color:
  ```objective-c
  - (id) init {
    if (self = [super init]){
      // ...
      _colorText = [UIColor colorWithHexString: HEX_NEW_COLOR];
    }
    return self;
  }
  ```

**Adding New Palette Color Properties**

Let's say you want to add a new palette color for all warning text. Here's how you would go about it:

1. Update `PORPalette.h` 
  ```objective-c
  // PORPalette.h
  // ...
  @interface PORPalette : NSObject
  // ...
  @property UIColor * colorTextWarning;
  // ...
  ```
2. Update `init`:
  ```objective-c
  // PORPalette.m
  - (id) init {
    if (self = [super init]){
      // ...
      _colorTextWarning = [UIColor colorWithHexString: HEX_THULIAN_PINK];
    }
    return self;
  }
  ```

## TypeLibrary

The `PORTypeLibrary` model organizes the application's fonts by function.

* **Body Font** — `fontBody` is the default font for body text.
* **Headline Font** — `fontHeadline` is the default font for headline text, viz. a title that is placed among body text (cf. the title of a book as it appears on the title page and the title of a chapter as it appears on a page alongside regular text).
* **Subtitle Font** — `fontSubtitle` is the default font for subtitle text, e.g. the author's name on the title page of a book or a "Part One" page.
* **Title Font** — `fontTitle` is the default font for title text, e.g. the title of a book as it appears on the title page.

### Usage

1. Import `"PORTypeLibrary.h"`
2. Create a pointer to the shared `PORTypeLibrary` singleton: 
  ```objective-c
  PORTypeLibrary * typeLibrary = PORTypeLibrary.sharedTypeLibrary;
  ```
3. Access the the library's fonts like this: 
  ```objective-c
  UIFont * font = typeLibrary.fontBody;
  ```

# Views

## ImageCardView

`PORImageCardView` displays a single image on an attractive card. 

### Usage

1. First, create a `UIview` instance either in a `.xib` file or in
   a storyboard interface builder.
2. Select the `UIView` instance and Set the `UIView`'s class to 
   `PORImageCardView` in the Identity Inspector 
   ![](1804091339.png)
3. Set the `PORImageCardView`'s "Image" property in the Attributesi
   Inspector, or set the image at runtime by creating a reference
   outlet for the `PORImageCardView` instance and calling 
   `setImage:`
   ![](1804091340.png)

### Customization

`PORImageCardView` can be customized either programmatically or via the interface builder. `PORImageCardView` can be customized in these ways:

* **Blur Radius** — `setRadiusBlur:` sets the image card's shadow
  radius
* **Blur Offset (Y)** — `setOffsetYBlur:` sets the vertical offset of the image card's shadow 
* **Corner Radius** — `setRadiusCorner:` sets the image card's corner radius


## ImageCarouselView

`PORImageCarouselView` renders a horizontal carousel containing image cards (see `PORImageCardView`). 

### Usage

1. First, drag a container view onto the interface builder
   ![](1804091345.png)
2. Next, set its child view controller's class to 
   `PORImageCarouselView` 
   ![](1804091347.png)
3. Create a reference outlet for the **container view**, e.g:
   ```objective-c
   @property (weak, nonatomic) IBOutlet UIView *container;
   ```
4. create a reference to the `PORImageCarouselView` by accessing
   the view controller's `childViewControllers` property, e.g:
   ```objective-c
   // ExampleViewController.m
   // ...
   - (void) viewDidLoad{
     [super viewDidLoad];
     PORImageCarouselView * carousel = self.view.childViewControllers.firstObject;
   }
   ```
5. Set the carousel's image(s) by calling `setImages:`, e.g:
   ```
   // ExampleViewController.m
   // ...
   - (void) viewDidLoad{
     // ...
     NSMutableArray * imgs = (NSMutableArray *) @[[UIImage imageNamed: @"example"]];
     [carousel setImages: imgs];
   }
   ```

## TabBarView

`PORTabBarView` renders a custom tab bar control that can be used with a `UITabBarController`. 

![](docs/figs/1804051558.png)

### Usage

1. in the storyboard, drag a `UIView` onto the bar above a tab bar controller scene.
  ![](docs/figs/1804051533.png)
2. Set the `UIView`'s class to `PORTabBarView`.
3. Create reference outlets in the tab bar controller `.m` file for this `PORTabBarView` *as well as* for the built-in `UITabBar` .
4. In the tab bar controller's `viewDidLoad` method, add the `PORTabBarView` as a subview.
  ```objective-c
  - (void) viewDidLoad {
    // ...
   [self.view addSubview: customTabBarView];
  }
  ```
5. In the tab bar controller's `viewDidLayoutSubviews` method, set the `PORTabBarView`'s frame equal to the `UITabBar`'s frame.
  ```objective-c
  - (void) viewDidLayoutSubviews { 
    // ...
    [self.customTabBarView setFrame: self.systemTabBarView.frame];
  } 
  ``` 
6. In the storyboard, set the `UITabBar`'s `Hidden` property to `YES`.
7. drag the `PORTabBarView`'s "Value Changed" event to an action outlet in the tab bar controller. There, set the tab bar controller's `selectedIndex` property to equal the `PORTabBarView`'s `selectedIndex` property. 
  ```objective-c
  - (IBAction) handleTabBarSelectedIndexChange: (PORTabBarView *) tabBarView  {
    self.selectedIndex = tabBarView.selectedIndex;
  }
  ```
 
### Customization

**Changing A Button Image**

1. Add a new icon image to `Assets.xcassets`. It must be 100px in size and have an `@2x` suffix.
2. In `PORTabBarView.xib`, change the image of the corresponding button

**Adding A Button**

1. In `PORTabBarView.xib`, copy and paste one of the button views; *this ensures that the necessary constraints are copied as well.* 
2. Follow the steps above for changing the new button's image.
