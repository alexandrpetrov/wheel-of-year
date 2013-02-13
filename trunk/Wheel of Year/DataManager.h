//
//  DataManager.h
//  Wheel of Year
//
//  Created by Alex Petrov on 2/10/13.
//  Copyright (c) 2013 Alexandr Petrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Holiday.h"

@interface DataManager : NSObject
+ (DataManager *)instance;

@property (strong, nonatomic) NSDictionary *wheel;

-(Holiday *) getHoliday: (NSString *) holiday;

@end
