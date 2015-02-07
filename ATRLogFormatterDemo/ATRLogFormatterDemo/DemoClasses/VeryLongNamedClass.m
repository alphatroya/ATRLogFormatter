//
// Created by Alexey Korolev on 07.02.15.
// Copyright (c) 2015 Heads and Hands. All rights reserved.
//

#import <CocoaLumberjack/DDLog.h>
#import "VeryLongNamedClass.h"

static const int ddLogLevel = LOG_LEVEL_VERBOSE;

@implementation VeryLongNamedClass {

}

- (instancetype)init {
    self = [super init];
    if (self) {
        DDLogError(@"error message");
        DDLogWarn(@"warning message");
        DDLogInfo(@"info message");
        DDLogDebug(@"debug message");
        DDLogVerbose(@"verbose message");
    }

    return self;
}


@end