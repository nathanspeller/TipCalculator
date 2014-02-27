//
//  TipViewController.m
//  tipcalculator
//
//  Created by Nathan Speller on 2/17/14.
//  Copyright (c) 2014 Nathan Speller. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *BillTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void)updateValues;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:10 forKey:@"segment0"];
    [defaults setInteger:15 forKey:@"segment1"];
    [defaults setInteger:20 forKey:@"segment2"];
    [defaults synchronize];
    
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

-(void)onSettingsButton{
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (void)updateValues {
    float billAmount = [self.BillTextField.text floatValue];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float tipPercent = [defaults floatForKey:[NSString stringWithFormat:@"segment%d",self.tipControl.selectedSegmentIndex] ];
    float tipAmount = billAmount * tipPercent * 0.01;
    float totalAmount = billAmount + tipAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)updateSegments{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [self.tipControl setTitle:[NSString stringWithFormat:@"%d%%",[defaults integerForKey:@"segment0"]] forSegmentAtIndex:0];
    [self.tipControl setTitle:[NSString stringWithFormat:@"%d%%",[defaults integerForKey:@"segment1"]] forSegmentAtIndex:1];
    [self.tipControl setTitle:[NSString stringWithFormat:@"%d%%",[defaults integerForKey:@"segment2"]] forSegmentAtIndex:2];
}

- (void)viewWillAppear:(BOOL)animated {
    [self updateSegments];
    [self updateValues];
}
@end
