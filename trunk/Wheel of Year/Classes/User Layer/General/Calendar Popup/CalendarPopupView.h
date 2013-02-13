//
//  CalendarPopupView.h
//  Wheel of Year
//
//  Created by Administrator on 2/12/13.
//  Copyright (c) 2013 Alexandr Petrov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarPopupView : UIView {
    IBOutlet UIDatePicker *_datePicker;
    IBOutlet UILabel *_holidayLabel;
}

@property (strong, nonatomic) NSDate *date;

-(IBAction) okButtonPressed: (UIButton *) sender;
-(IBAction) cancelButtonPressed: (UIButton *) sender;

@end
