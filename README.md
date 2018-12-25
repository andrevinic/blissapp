# Bliss

This is an example of iOS app using swift 4

iOS project has the following configuration:

## Project Configuration
* Swift 4
* Objective-C

### There are few libraries

- RxMoya for network layer
- Codable with swift 4
- SDWebImage to download images
- R.Swift to routing
- Lottie for animations
- Snapkit & Masonry to auto-layout
- Reachability to check internet connection
- SwiftMessages to pop up messages
- Architecture: MVVM

### MVVM: 
- Its know as Model-View-ViewModel, 
- Its a good pattern to split very well the layers and responsibilities. 
- Also, fits very well with RxSwift, just like I've done in this project.

### SDWebImage:
- It is a lightweight, pure-Swift library for downloading and caching images from the web.
- It has view extensions for UIView, NSImage, NSButton, UIButton to directly set an image from an URL
- Fine control on cache behavior. Customizable expiration date and size limit.
-  Loading image from either URLSession-based networking or local provided data.

### RxMoya
- basic idea of Moya is that we want some network abstraction layer that sufficiently encapsulates actually calling Alamofire directly. It should be simple enough that common things are easy, but comprehensive enough that complicated things are also easy.
- Compile-time checking for correct API endpoint accesses.
- Lets you define a clear usage of different endpoints with associated enum values.
- Treats test stubs as first-class citizens so unit testing is super-easy.

### Codables

- In particular, it has become extremely simple to play with JSON particles after Apple has launched Encodable and Decodable.

### Installing
* Go into projects folder and type pod install
* open workspace project
