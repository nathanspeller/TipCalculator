//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Nathan Speller on 2/20/14.
//  Copyright (c) 2014 Nathan Speller. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstTipPercentage;
@property (weak, nonatomic) IBOutlet UITextField *secondTipPercentage;
@property (weak, nonatomic) IBOutlet UITextField *thirdTipPercentage;
@end

@implementation SettingsViewController

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
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [self.firstTipPercentage setText:[NSString stringWithFormat:@"%d", [defaults integerForKey:@"segment0"]]];
    [self.secondTipPercentage setText:[NSString stringWithFormat:@"%d",[defaults integerForKey:@"segment1"]]];
    [self.thirdTipPercentage setText:[NSString stringWithFormat:@"%d", [defaults integerForKey:@"segment2"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:[[self.firstTipPercentage text] integerValue] forKey:@"segment0"];
    [defaults setInteger:[[self.secondTipPercentage text] integerValue]  forKey:@"segment1"];
    [defaults setInteger:[[self.thirdTipPercentage text] integerValue]  forKey:@"segment2"];
}



@end
