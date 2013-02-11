//
//  Holiday.h
//  Wheel of Year
//
//  Created by Alex Petrov on 2/12/13.
//  Copyright (c) 2013 Alexandr Petrov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Holiday : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *info;
@property (strong, nonatomic, readonly) NSString *backgroundFilename;
@end
