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

#pragma mark DDLogFormatter delegate

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    NSString *logLevel;
    switch (logMessage->logFlag) {
        case LOG_FLAG_ERROR :
            logLevel = @"ERROR  ";
            break;
        case LOG_FLAG_WARN  :
            logLevel = @"WARNING";
            break;
        case LOG_FLAG_INFO  :
            logLevel = @"INFO   ";
            break;
        case LOG_FLAG_DEBUG :
            logLevel = @"DEBUG  ";
            break;
        default             :
            logLevel = @"VERBOSE";
            break;
    }

    return [NSString stringWithFormat:@"%@ | %@ | %@ | %@", [self stringFromDate:(logMessage->timestamp)], logLevel, logMessage.fileName, logMessage->logMsg];
}

- (void)didAddToLogger:(id <DDLogger>)logger {
    OSAtomicIncrement32(&atomicLoggerCount);
}

- (void)willRemoveFromLogger:(id <DDLogger>)logger {
    OSAtomicDecrement32(&atomicLoggerCount);
}


@end