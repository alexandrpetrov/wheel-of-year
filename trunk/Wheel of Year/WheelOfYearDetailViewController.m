//
//  WheelOfYearDetailViewController.m
//  Wheel of Year
//
//  Created by Administrator on 11/25/12.
//  Copyright (c) 2012 Alexandr Petrov. All rights reserved.
//

#import "WheelOfYearDetailViewController.h"

#import "DataManager.h"

@interface WheelOfYearDetailViewController ()

@end

@implementation WheelOfYearDetailViewController

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
    _dataObject = [DataManager.instance getHoliday: _holiday];
    _backgroundImage.image = [UIImage imageNamed: _dataObject.backgroundFilename];
    [_infoView loadHTMLString: _dataObject.info baseURL: [NSURL URLWithString: @"http://www.google.com"]];
    _infoView.backgroundColor = [UIColor clearColor];
    _infoView.scrollView.scrollEnabled = NO;
    _infoView.scrollView.bounces = NO;
}

- (void) viewWillAppear:(BOOL)animated {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
