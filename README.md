# ATRLogFormatter

[![Licence](https://img.shields.io/badge/Licence-MIT-yellowgreen.svg)]()
[![Swift 2.0](https://img.shields.io/badge/Swift%202.0-Compatible-green.svg)]()


Simple log formatter for using [CocoaLimberjack library](https://github.com/CocoaLumberjack/CocoaLumberjack)  
![image](/img/screenshot1.png)

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

ATRLogFormatter is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ATRLogFormatter"
```

## Author

Alexey Korolev, alphatroya@gmail.com

## License

ATRLogFormatter is available under the MIT license. See the LICENSE file for more info.
