# Portland Rose Changelog 

## [0.0.0] — Apr 20, 2018

Version `0.0.0` of Portland Rose is the first release. It adds an 
interactive mockup / prototype that allows users to navigate through 
the application and view randomly generated mock content.

**Features**

* **Demo Setup** (#AI038D) — Add a separate demo storyboard.
* **Palette** (#AI038B) — `PORPalette` stores Portland Rose's U.I. 
  colors.
* **Type Library** (#AI038C) — `PORTypeLibrary` stores Portland Rose's
  U.I. fonts.
* **Action Button View** (#AI038A) — `PORActionButtonView` renders a 
  pill-shaped action button with a gradient background.
* **Temporary App Icon** (#AI041B) — Add a temporary app icon.
* **Divider Color** (#AI042B) — Add a new palette color for dividers.
* **Tab Bar View** (#AI041A) — `PORTabBarView` renders a custom tab 
  bar with an animated highlight bar.
* **Palette Documentation** (#AI045A) — Add documentation for 
  `PORPalette` class.
* **Type Library Documentation** (#AI045B) — Add documentation for 
  `PORTypeLibrary` class.
* **POR Prefix** (#AI048A) — Add `POR` prefix to all source files and 
  classes.
* **Image Card Carousel** (#AI045C) — Add `PORImageCardView` (renders 
  an image card with rounded corners and a blurred drop shadow), 
  `PORImageCarouselView` (renders a carousel of image cards), and
  `PORImageCarouselImageView`. 
* **Floating Action Button** (#AI058A) — `PORFloatingActionButtonView` 
  renders a circular button with a gradient background and a centered 
  icon.
* **Muted Text Color** (#AI060A) — Add a color for muted text to the 
  palette.
* **Itinerary Model** (#AI058C) — `PORItinerary` models date 
  itineraries.
* **Itinerary Summary View** (#AI059A) — `PORItinerarySummaryCellView` 
  renders an itinerary summary. Add mocks for itineraries and itinerary 
  badges.
* **Activity Cell View** (#AI061A) — `PORActivityCellView` renders an 
  activity summary cell. `PORLabeledIconView` renders an icon and a 
  label. Add mocks for activities.
* **Itinerary Header Cell View** (#AI083A) —
  `PORItineraryHeaderCellView` renders an itinerary header cell 
  containing the itinerary title, estimated duration, estimated cost, 
  and a carousel of itinerary images. Rebuild `PORImageCarouselView` 
  as a `UIView` subclass instead of a `UIPageViewController` subclass. 
  Remove the `PORImageCarouselImageView` class.
* **Navigation Bar** (#AI083B) — `PORNavigationController` renders a 
  custom navigation bar.
* **Multiple Build Schemes** (#AI085A) — Add new build configurations 
  for development, staging, and production.
* **Prototype View Controllers** (#AI085B) — Add prototype view 
  controllers and storyboard scenes. 


**Fixes**

* **Constants Scope** (#AI042A) — Fix global constant scope.
* **Xcode Warnings** (#AI056A) — Fix misc. Xcode warnings.
* **View Background Colors** (#AI065A) — Fix white background color on 
  views.
