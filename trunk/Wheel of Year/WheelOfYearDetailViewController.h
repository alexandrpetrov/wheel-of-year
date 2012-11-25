//
//  WheelOfYearDetailViewController.h
//  Wheel of Year
//
//  Created by Administrator on 11/25/12.
//  Copyright (c) 2012 Alexandr Petrov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WheelOfYearDetailViewController : UIViewController {
    IBOutlet UILabel *_titleLabel;
}

@property (nonatomic, retain) NSString *holyday;

@end
