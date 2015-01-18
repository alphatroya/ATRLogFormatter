##ATRLogFormatter  
Simple log formatter for using [CocoaLimberjack library](https://github.com/CocoaLumberjack/CocoaLumberjack)

###Using

Set log formatter property of DDASLLogger and DDTTYLogger singletones to ATRLogFormatter instance 

```Objective-C  
[DDASLLogger sharedInstance].logFormatter = [[ATRLogFormatter alloc] init];  
[DDTTYLogger sharedInstance].logFormatter = [[ATRLogFormatter alloc] init];  
```