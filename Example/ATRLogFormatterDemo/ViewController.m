//
//  ViewController.m
//  ATRLogFormatterDemo
//
//  Created by Alexey Korolev on 07.02.15.
//  Copyright (c) 2015 Heads and Hands. All rights reserved.
//


#import "ViewController.h"
#import <CocoaLumberjack/DDLog.h>
#import "ShortNameClass.h"
#import "VeryLongNamedClass.h"

static const int ddLogLevel = LOG_LEVEL_VERBOSE;

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    DDLogError(@"error message");
    DDLogWarn(@"warning message");
    DDLogInfo(@"info message");
    DDLogDebug(@"debug message");
    DDLogVerbose(@"verbose message");

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)printShortClassButtonPressed:(UIButton *)sender {
    [[ShortNameClass alloc] init];
}

- (IBAction)printLongClassButtonPressed:(UIButton *)sender {
    [[VeryLongNamedClass alloc] init];
}

- (IBAction)printVeryLongClassButtonPressed:(UIButton *)sender {
    [[VeryVeryVeryVeryLongNamedClass alloc] init];
}
@end