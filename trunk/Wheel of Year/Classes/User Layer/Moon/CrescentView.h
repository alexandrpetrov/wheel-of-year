//
//  MoonView.h
//  Wheel of Year
//
//  Created by Alex Petrov on 2/14/13.
//  Copyright (c) 2013 Alexandr Petrov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CrescentView : UIView {
    double _ip;
    IBOutlet UIImageView *imageCrescent;
}

@property (strong, nonatomic) NSDate *date;


@end
