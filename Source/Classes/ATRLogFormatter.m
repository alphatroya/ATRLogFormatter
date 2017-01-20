//
// Created by Королев Алексей on 19.08.14.
// Copyright (c) 2014 admin. All rights reserved.
//

#import <libkern/OSAtomic.h>
#import "ATRLogFormatter.h"


@implementation ATRLogFormatter {
    int atomicLoggerCount;
    NSDateFormatter *threadUnsafeDateFormatter;
}

#pragma mark - Constructors

- (instancetype)init {
    self = [super init];
    if (self) {
        _minimalClassNameLength = 60;
        _classNameAlignment = ATRLogFormatterClassNameAlignmentLeft;
    }

    return self;
}

#pragma mark - Private methods

- (NSString *)stringFromDate:(NSDate *)date {
    int32_t loggerCount = OSAtomicAdd32(0, &atomicLoggerCount);

    if (loggerCount <= 1) {
        // Single-threaded mode.

        if (threadUnsafeDateFormatter == nil) {
            threadUnsafeDateFormatter = [[NSDateFormatter alloc] init];
            [threadUnsafeDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
            threadUnsafeDateFormatter.dateStyle = NSDateFormatterShortStyle;
            threadUnsafeDateFormatter.timeStyle = NSDateFormatterMediumStyle;
        }

        return [threadUnsafeDateFormatter stringFromDate:date];
    }
    else {
        // Multi-threaded mode.
        // NSDateFormatter is NOT thread-safe.

        NSString *key = @"MyCustomFormatter_NSDateFormatter";

        NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
        NSDateFormatter *dateFormatter = threadDictionary[key];

        if (dateFormatter == nil) {
            dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
            dateFormatter.dateStyle = NSDateFormatterShortStyle;
            dateFormatter.timeStyle = NSDateFormatterMediumStyle;

            threadDictionary[key] = dateFormatter;
        }

        return [dateFormatter stringFromDate:date];
    }
}

- (void)appendLineNumberToString:(NSMutableString *)string lineNumber:(int)lineNumber {
    if (self.enableLineNumberPrinting) {
        [string appendFormat:@"(%ld)", (long) lineNumber];
    }
}

#pragma mark DDLogFormatter delegate

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    NSString *logLevel;
    switch (logMessage->_flag) {
        case DDLogFlagError:
            logLevel = @"ERROR  ";
            break;
        case DDLogFlagWarning:
            logLevel = @"WARNING";
            break;
        case DDLogFlagInfo:
            logLevel = @"INFO   ";
            break;
        case DDLogFlagDebug:
            logLevel = @"DEBUG  ";
            break;
        case DDLogFlagVerbose:
            logLevel = @"VERBOSE";
            break;
    }

    NSMutableString *resultString = [NSString stringWithFormat:@"%@ | %@ | ", [self stringFromDate:(logMessage->_timestamp)], logLevel].mutableCopy;

    switch (self.classNameAlignment) {
        case ATRLogFormatterClassNameAlignmentLeft: {
            [resultString appendFormat:@"%@", logMessage.fileName];
            [self appendLineNumberToString:resultString lineNumber:logMessage->_line];
            while (resultString.length < self.minimalClassNameLength) {
                [resultString appendString:@" "];
            }
            break;
        }
        case ATRLogFormatterClassNameAlignmentCenter: {
            NSInteger classNameFullStringLength = self.minimalClassNameLength - resultString.length;
            NSInteger initialStringLength = resultString.length;
            NSMutableString *fileNameWithLineOfCode = logMessage.fileName.mutableCopy;
            [self appendLineNumberToString:fileNameWithLineOfCode lineNumber:logMessage->_line];
            while (resultString.length < initialStringLength + classNameFullStringLength / 2 - fileNameWithLineOfCode.length / 2) {
                [resultString appendString:@" "];
            }
            [resultString appendFormat:@"%@", fileNameWithLineOfCode];
            while (resultString.length < self.minimalClassNameLength) {
                [resultString appendString:@" "];
            }
            break;
        }
    }

    [resultString appendFormat:@" | %@", logMessage->_message];
    return resultString.copy;
}

- (void)didAddToLogger:(id <DDLogger>)logger {
    OSAtomicIncrement32(&atomicLoggerCount);
}

- (void)willRemoveFromLogger:(id <DDLogger>)logger {
    OSAtomicDecrement32(&atomicLoggerCount);
}


@end