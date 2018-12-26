# Bliss

This is an example of iOS app using swift 4

iOS project has the following configuration:

## Project Configuration
* Swift 4
* Objective-C
* XCode 9.4.1 or XCode 10

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

### RxMoya
- basic idea of Moya is that we want some network abstraction layer that sufficiently encapsulates actually calling Alamofire directly. It should be simple enough that common things are easy, but comprehensive enough that complicated things are also easy.
- Compile-time checking for correct API endpoint accesses.
- Lets you define a clear usage of different endpoints with associated enum values.
- Treats test stubs as first-class citizens so unit testing is super-easy.

### R.Swift
- It makes your code that uses resources:
- Fully typed, less casting and guessing what a method will return
- Compile time checked, no more incorrect strings that make your app crash at runtime
- Autocompleted, never have to guess that image name again

### Lottie - an Airbnb framework
- An iOS library to natively render After Effects vector animations 
- For the first time, designers can create and ship beautiful animations without an engineer painstakingly recreating it by hand.
- Since the animation is backed by JSON they are extremely small in size but can be large in complexity
- Animations can be played, resized, looped, sped up, slowed down, reversed, and even interactively scrubbed
- Lottie can play or loop just a portion of the animation as well, the possibilities are endless

### PNChart
- A simple and beautiful chart lib with animation used in Piner and CoinsMan for iOS

### SDWebImage:
- This library provides an async image downloader with cache support
- An asynchronous image downloader

### Masonry
- Masonry is a light-weight layout framework which wraps AutoLayout with a nicer syntax
- Masonry has its own layout DSL which provides a chainable way of describing your NSLayoutConstraints which results in layout code that is more concise and readable

### Snapkit
- SnapKit is a DSL to make Auto Layout easy on both iOS and OS X
- If using swift, its recommended to use snapkit instead of masonry, because of safe access

### Reachability
- Reachability.swift is a replacement for Apple's Reachability sample, re-written in Swift with closures.

### SwiftMessages
- SwiftMessages is a very flexible view and view controller presentation library for iOS.
- Message views and view controllers can be displayed at the top, bottom, or center of the screen, over or under the status bar, or behind navigation bars and tab bars
- There are interactive dismiss gestures including a fun, physics-based one. Multiple background dimming modes

### Codables

- In particular, it has become extremely simple to play with JSON particles after Apple has launched Encodable and Decodable.

### Installing
* Go into projects folder and type pod install
* open workspace project


![alt text](https://github.com/andrevinic/blissapp/blob/development/screenshots/screen_1.png)

![alt text](https://github.com/andrevinic/blissapp/blob/development/screenshots/screen_2.png)

![alt text](https://github.com/andrevinic/blissapp/blob/development/screenshots/screen_3.png)

