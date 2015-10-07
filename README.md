# ATRLogFormatter

[![CI Status](http://img.shields.io/travis/Alexey Korolev/ATRLogFormatter.svg?style=flat)](https://travis-ci.org/Alexey Korolev/ATRLogFormatter)
[![Version](https://img.shields.io/cocoapods/v/ATRLogFormatter.svg?style=flat)](http://cocoapods.org/pods/ATRLogFormatter)
[![License](https://img.shields.io/cocoapods/l/ATRLogFormatter.svg?style=flat)](http://cocoapods.org/pods/ATRLogFormatter)
[![Platform](https://img.shields.io/cocoapods/p/ATRLogFormatter.svg?style=flat)](http://cocoapods.org/pods/ATRLogFormatter)

Simple log formatter for using [CocoaLimberjack library](https://github.com/CocoaLumberjack/CocoaLumberjack)  
![image](/img/screenshot1.png)

## Usage

Set log formatter property of DDASLLogger and DDTTYLogger singletones to ATRLogFormatter instance

```Objective-C  
ATRLogFormatter *formatter = [[ATRLogFormatter alloc] init];
[DDASLLogger sharedInstance].logFormatter = formatter;  
[DDTTYLogger sharedInstance].logFormatter = formatter;  
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
