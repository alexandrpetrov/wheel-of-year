//
//  DataManager.m
//  Wheel of Year
//
//  Created by Alex Petrov on 2/10/13.
//  Copyright (c) 2013 Alexandr Petrov. All rights reserved.
//

#import "DataManager.h"
#import "json-framework-master/src/main/objc/SBJsonParser.h"

@implementation DataManager

+ (DataManager *)instance {
    static id instance = nil;
    
    @synchronized (self)
    {
        if (instance == nil)
        {
            instance = [[self alloc] init];
            NSString *filePath = [[NSBundle mainBundle] pathForResource: @"data" ofType:@"json"];
            NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error: NULL];
            
            SBJsonParser *parser = [[SBJsonParser alloc] init];
            ((DataManager *) instance).wheel = [parser objectWithString: jsonString];
        }
    }
    return instance;
}

-(Holiday *) getHoliday: (NSString *) holiday {
    Holiday *newHoliday = [[Holiday alloc] init];
    NSDictionary *holidayDictionary = [self.wheel objectForKey: holiday];
    newHoliday.name = holiday;
    newHoliday.date = [holidayDictionary objectForKey: @"date"];
    newHoliday.info = [holidayDictionary objectForKey: @"info"];
    return newHoliday;
}


@end
