//
//  WheelViewController.h
//  Wheel of Year
//
//  Created by Administrator on 11/25/12.
//  Copyright (c) 2012 Alexandr Petrov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WheelViewController : UIViewController {
    IBOutlet UIImageView *_backgroundImage;
    IBOutlet UIImageView *_wheelImage;
    IBOutlet UIButton *_samheinButton;
    IBOutlet UIButton *_midwinterButton;
    IBOutlet UIButton *_imbolcButton;
    IBOutlet UIButton *_ostaraButton;
    IBOutlet UIButton *_beltaneButton;
    IBOutlet UIButton *_midsummerButton;
    IBOutlet UIButton *_lughnasadhButton;
    IBOutlet UIButton *_mabonButton;
}

-(IBAction) buttonHolydayPressed: (UIButton *) sender;
-(IBAction) buttonHolydayHighlighted: (UIButton *) sender;
@end
