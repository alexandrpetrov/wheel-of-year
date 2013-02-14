//
//  WheelOfYearDetailViewController.m
//  Wheel of Year
//
//  Created by Administrator on 11/25/12.
//  Copyright (c) 2012 Alexandr Petrov. All rights reserved.
//

#import "WheelOfYearDetailViewController.h"
#import "DataManager.h"
#import "HolidayDateView.h"

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
    int yearNo = 0;
    NSArray *years = [_dataObject.nextDates.allKeys sortedArrayUsingComparator:^NSComparisonResult(NSString *year1, NSString *year2) {
        if(year1.intValue > year2.intValue) {
            return NSOrderedDescending;
        }
        else {
            if(year1.intValue == year2.intValue) {
                return NSOrderedSame;
            }
            else {
                return NSOrderedAscending;
            }
        }
        return NSOrderedSame;
    }];
    for(NSString *year in years) {
        NSArray *nib_objects = [[NSBundle mainBundle] loadNibNamed:(@"HolidayDateView") owner:self options:nil];
        HolidayDateView *holidayDateView = [nib_objects objectAtIndex:0];
        holidayDateView.frame = CGRectMake(yearNo * _scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height);
        holidayDateView.yearLabel.text = year;
        NSDateFormatter *rfc3339Formatter = [[NSDateFormatter alloc] init];
        NSLocale *enUSPOSIXLocale = [[NSLocale alloc] initWithLocaleIdentifier: @"en_US_POSIX"];
        [rfc3339Formatter setLocale: enUSPOSIXLocale];
        [rfc3339Formatter setDateFormat: @"yyyy'-'MM'-'dd' 'HH':'mm':'ss"];
        [rfc3339Formatter setTimeZone: [NSTimeZone timeZoneForSecondsFromGMT: 0]];
        NSDate *date = [rfc3339Formatter dateFromString: [_dataObject.nextDates objectForKey: year]];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat: @"MMMM, d h:ma"];
        NSString *dateString = [formatter stringFromDate: date];
        holidayDateView.dateLabel.text = dateString;
        holidayDateView.holidayName = _holiday;
        holidayDateView.parentController = self;        
        [_scrollView addSubview: holidayDateView];
        yearNo++;
    }
    if(!yearNo) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat: @"yyyy"];
        NSString *year = [formatter stringFromDate: [NSDate date]];
        NSString *date = nil;
        if([_holiday isEqualToString: @"Samhein"]) {
            date = @"October 31st";
        }
        if([_holiday isEqualToString: @"Imbolc"]) {
            date = @"February 1st";
        }
        if([_holiday isEqualToString: @"Beltane"]) {
            date = @"May 1st";
        }
        if([_holiday isEqualToString: @"Lughnasadh"]) {
            date = @"August 1st";
        }
        NSArray *nib_objects = [[NSBundle mainBundle] loadNibNamed:(@"HolidayDateView") owner:self options:nil];
        HolidayDateView *holidayDateView = [nib_objects objectAtIndex:0];
        holidayDateView.frame = CGRectMake(0, 0, _scrollView.frame.size.width, _scrollView.frame.size.height);
        holidayDateView.yearLabel.text = year;
        holidayDateView.dateLabel.text = date;
        holidayDateView.holidayName = _holiday;
        holidayDateView.parentController = self;
        [_scrollView addSubview: holidayDateView];
        yearNo++;
    }
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * yearNo, _scrollView.frame.size.height);
    [self setImageForiCalButton];
}

- (void) viewWillAppear:(BOOL)animated {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) iCalButtonPressed: (UIButton *) sender {
    [self performSegueWithIdentifier: @"showCalendarPopupView" sender: self];
}

-(void) setImageForiCalButton {
    NSString *buttonImage = [NSString stringWithFormat: @"ical_%@_button", [_holiday lowercaseString]];
    [iCalButton setBackgroundImage: [UIImage imageNamed: buttonImage] forState: UIControlStateNormal];
}

@end
