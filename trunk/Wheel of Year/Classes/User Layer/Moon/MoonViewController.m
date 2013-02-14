//
//  MoonViewController.m
//  Wheel of Year
//
//  Created by Alex Petrov on 2/14/13.
//  Copyright (c) 2013 Alexandr Petrov. All rights reserved.
//

#import "MoonViewController.h"
#import "MoonView.H"

@interface MoonViewController ()

@end

@implementation MoonViewController

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
    //self.view.crescent.date =
    ((MoonView *)self.view).crescent.date = [NSDate date];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
