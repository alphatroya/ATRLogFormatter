# ATRLogFormatter

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
