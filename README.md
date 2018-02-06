# ios-eventstream
> Demo app to represent how fanout eventstream works on iOS

[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

A barebone chat app running on Fanout's eventstream functionality to provide a minimalistic and real time chatting experience.

![](screenshot.png)

## Features

- [x] Select a username to use within a room
- [x] Send/Receive realtime messages to/from a specific room
- [x] Retreive message history using GET API calls

## Requirements

- iOS 10.0+
- Xcode 9.2

## Setup

#### CocoaPods
The app uses CocoaPods for third party libraries. To install the pods, just run the following on terminal inside the project directory:

```ruby
pod install
```

## Contribute

We would love you for the contribution to **ios-eventstream**, check the ``LICENSE`` file for more info.

[swift-image]:https://img.shields.io/badge/swift-4.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
