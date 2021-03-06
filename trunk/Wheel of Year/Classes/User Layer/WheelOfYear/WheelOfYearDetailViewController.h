//
//  WheelOfYearDetailViewController.h
//  Wheel of Year
//
//  Created by Administrator on 11/25/12.
//  Copyright (c) 2012 Alexandr Petrov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Holiday.h"

@interface WheelOfYearDetailViewController : UIViewController {
    IBOutlet UIImageView *_backgroundImage;
    IBOutlet UIWebView *_infoView;
    IBOutlet UIScrollView *_scrollView;
    IBOutlet UIButton *iCalButton;
}

@property (nonatomic, strong) NSString *holiday;
@property (nonatomic, strong) Holiday *dataObject;

-(IBAction) iCalButtonPressed: (UIButton *) sender;

@end
