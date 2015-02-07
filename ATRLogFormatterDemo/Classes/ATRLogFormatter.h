//
// Created by Королев Алексей on 19.08.14.
// Copyright (c) 2014 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/DDLog.h>

NS_ENUM(NSUInteger, ATRLogFormatterClassNameAlignment) {
    ATRLogFormatterClassNameAlignmentLeft,
    ATRLogFormatterClassNameAlignmentCenter
};


@interface ATRLogFormatter : NSObject <DDLogFormatter>
/**
*  parameter set minimal class name space for alignment on right edge, 0 to disable
*/
@property(nonatomic) int minimalClassNameLength;


@property(nonatomic) enum ATRLogFormatterClassNameAlignment classNameAlignment;

@end