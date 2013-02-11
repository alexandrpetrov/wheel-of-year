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
    NSArray *holidays = @[@"Samhein", @"Midwinter", @"Imbolc", @"Ostara", @"Beltane", @"Midsummer", @"Lughnasad", @"Mabon"];
    targetController.holyday = [holidays objectAtIndex: ((UIButton *) sender).tag - 1];
    [super prepareForSegue: segue sender: sender];
}

@end
