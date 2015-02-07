//
// Created by Королев Алексей on 19.08.14.
// Copyright (c) 2014 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/DDLog.h>


@interface ATRLogFormatter : NSObject <DDLogFormatter>
/**
*  parameter set minimal class name space for alignment messages, 0 to disable
*/
@property(nonatomic) int minimalClassNameLength;
@end