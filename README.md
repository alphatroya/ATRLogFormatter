# ATRLogFormatter
[![Swift 3.0](https://img.shields.io/badge/Swift%203.0-Compatible-green.svg)]() [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![BuddyBuild](https://dashboard.buddybuild.com/api/statusImage?appID=5881ac3b763f890100da95b8&branch=master&build=latest)](https://dashboard.buddybuild.com/apps/5881ac3b763f890100da95b8/build/latest?branch=master)

Simple log formatter for using [CocoaLimberjack library](https://github.com/CocoaLumberjack/CocoaLumberjack)<br>![image](/img/screenshot1.png)

## Usage
Set log formatter property of DDASLLogger and DDTTYLogger singletones to ATRLogFormatter instance

### Objective-C

```Objective-C
ATRLogFormatter *formatter = [[ATRLogFormatter alloc] init];
[DDASLLogger sharedInstance].logFormatter = formatter;  
[DDTTYLogger sharedInstance].logFormatter = formatter;
```

### Swift

```Swift
let formatter = ATRLogFormatter()
DDASLLogger.sharedInstance().logFormatter = formatter  
DDTTYLogger.sharedInstance().logFormatter = formatter
```

## Installation
### CocoaPods
ATRLogFormatter is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod "ATRLogFormatter"
```

### Carthage
To integrate ATRLogFormatter into your Xcode project using Carthage, specify it in your Cartfile:

```ogdl
github "alphatroya/ATRLogFormatter"
```

Run `carthage update` to build the framework and drag the built ATRLogFormatter.framework and CocoaLumberjackSwift.framework into your Xcode project.

## Author
Alexey Korolev, alphatroya@gmail.com

## License
ATRLogFormatter is available under the MIT license. See the LICENSE file for more info.
