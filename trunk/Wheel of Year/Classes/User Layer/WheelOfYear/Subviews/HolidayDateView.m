//
//  HolidayDateView.m
//  Wheel of Year
//
//  Created by Administrator on 2/12/13.
//  Copyright (c) 2013 Alexandr Petrov. All rights reserved.
//

#import "HolidayDateView.h"
#import <EventKit/EventKit.h>
#import "CalendarPopupView.h"
#import "CalendarPopupViewController.h"

@implementation HolidayDateView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(IBAction) addToCalendarButtonPressed: (UIButton *) sender {
    [_parentController addToCallendarButtonPressed: sender];
}

@end
