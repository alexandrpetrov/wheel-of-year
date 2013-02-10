//
//  WheelViewController.m
//  Wheel of Year
//
//  Created by Administrator on 11/25/12.
//  Copyright (c) 2012 Alexandr Petrov. All rights reserved.
//

#import "WheelViewController.h"
#import "WheelOfYearDetailViewController.h"

@interface WheelViewController ()

@end

@implementation WheelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            _backgroundImage.image = [UIImage imageNamed: @"wheel_background"];
            _wheelImage.image = [UIImage imageNamed: @"wheel_image"];
            /*Do iPhone 5 stuff here.*/
        } else {
            _backgroundImage.image = [UIImage imageNamed: @"wheel_background_normal"];
            _wheelImage.image = [UIImage imageNamed: @"wheel_image_normal"];
            /*Do iPhone Classic stuff here.*/
        }
    } else {
        /*Do iPad stuff here.*/
    }
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) buttonHolydayPressed: (UIButton *) sender {
    [self performSegueWithIdentifier: @"showHolydayDetailView" sender: sender];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WheelOfYearDetailViewController *targetController = (WheelOfYearDetailViewController *) segue.destinationViewController;
    targetController.holyday = ((UIButton *) sender).titleLabel.text;
    [super prepareForSegue: segue sender: sender];
}

@end
