//
//  MoonView.m
//  Wheel of Year
//
//  Created by Alex Petrov on 2/14/13.
//  Copyright (c) 2013 Alexandr Petrov. All rights reserved.
//

#import "CrescentView.h"

@implementation CrescentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(int) julianDate: (NSDate*) date {
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate: date];

    NSInteger day = [components day];
    NSInteger month = [components month];
    NSInteger year = [components year];
    
    int mm, yy;
    int k1, k2, k3;
    int j;
    
    yy = year - (int)((12 - month) / 10);
    mm = month + 9;
    if (mm >= 12)
    {
        mm = mm - 12;
    }
    k1 = (int)(365.25 * (yy + 4712));
    k2 = (int)(30.6001 * mm + 0.5);
    k3 = (int)((int)((yy / 100) + 49) * 0.75) - 38;
    // 'j' for dates in Julian calendar:
    j = k1 + k2 + day + 59;
    if (j > 2299160)
    {
        // For Gregorian calendar:
        j = j - k3; // 'j' is the Julian date at 12h UT (Universal Time)
    }
    return j;
}

-(int) moonAge: (NSDate *) date {
    int j = [self julianDate: date];
    //Calculate the approximate phase of the moon
    _ip = (j + 4.867) / 29.53059;
    _ip = _ip - floor(_ip);
    //After several trials I've seen to add the following lines,
    //which gave the result was not bad
    double age = 0;
    if(_ip < 0.5) {
        age = _ip * 29.53059 + 29.53059 / 2;
    }
    else {
        age = _ip * 29.53059 - 29.53059 / 2;
    }
    // Moon's age in days
    age = floor(age) + 1;
    return (int) age;
}

-(void) setDate:(NSDate *)date {
    int age = [self moonAge: date];
    imageCrescent.image = [UIImage imageNamed: [NSString stringWithFormat: @"lunar_phase_%d", age ]];
    _date = date;
}

@end
