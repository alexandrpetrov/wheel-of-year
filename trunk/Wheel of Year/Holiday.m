//
//  Holiday.m
//  Wheel of Year
//
//  Created by Alex Petrov on 2/12/13.
//  Copyright (c) 2013 Alexandr Petrov. All rights reserved.
//

#import "Holiday.h"

@implementation Holiday

-(NSString *) backgroundFilename {
    NSString *filename = nil;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
        if (iOSDeviceScreenSize.height == 480){
            filename = [NSString stringWithFormat: @"%@_normal", self.name];
        }
        if (iOSDeviceScreenSize.height == 568){
            filename = [NSString stringWithFormat: @"%@_iphone5", self.name];
        }
    }
    return filename;
}

@end
