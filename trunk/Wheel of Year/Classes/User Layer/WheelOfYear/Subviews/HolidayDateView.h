//
//  HolidayDateView.h
//  Wheel of Year
//
//  Created by Administrator on 2/12/13.
//  Copyright (c) 2013 Alexandr Petrov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Holiday.h"
#import "WheelOfYearDetailViewController.h"

@interface HolidayDateView : UIView {
}

@property IBOutlet UILabel *yearLabel;
@property IBOutlet UILabel *dateLabel;
@property IBOutlet NSString *holidayName;
@property IBOutlet NSDate *holidayDate;
@property (weak, nonatomic) WheelOfYearDetailViewController *parentController;

@end
