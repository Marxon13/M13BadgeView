//
//  ViewController.m
//  M13BadgeView
//
//  Created by Brandon McQuilkin on 2/19/14.
//  Copyright (c) 2014 Brandon McQuilkin. All rights reserved.
//

#import "ViewController.h"

#define ARC4RANDOM_MAX 0x100000000

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _badgeView = [[M13BadgeView alloc] initWithFrame:CGRectMake(0, 0, 24.0, 24.0)];
    _badgeView.text = @"1";
    [_badgeSuperView addSubview:_badgeView];
    
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneWithText:)];
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.items = @[flexItem, doneItem];
    
    _textField.inputAccessoryView = toolbar;
    [toolbar sizeToFit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)doneWithText:(id)sender
{
    _badgeView.text = _textField.text;
    [_textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    _badgeView.text = _textField.text;
    return NO;
}

- (UIColor *)randomColor
{
    float red = (float)arc4random() / ARC4RANDOM_MAX;
    float green = (float)arc4random() / ARC4RANDOM_MAX;
    float blue = (float)arc4random() / ARC4RANDOM_MAX;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

- (void)changeTextColor:(id)sender
{
    _badgeView.textColor = [self randomColor];
}

- (void)changeBackgroundColor:(id)sender
{
    _badgeView.badgeBackgroundColor = [self randomColor];
}

- (void)changeBorderColor:(id)sender
{
    _badgeView.borderColor = [self randomColor];
}

- (void)changeFont:(id)sender
{
    UISegmentedControl *control = sender;
    
    if (control.selectedSegmentIndex == 0) {
        _badgeView.font = [UIFont systemFontOfSize:16.0];
    } else {
        _badgeView.font = [UIFont fontWithName:@"Georgia" size:18.0];
    }
}

- (void)changeGloss:(id)sender
{
    UISwitch *uiSwitch = sender;
    _badgeView.showGloss = uiSwitch.on;
}

- (void)changeCornerRadius:(id)sender
{
    UISlider *slider = sender;
    _badgeView.cornerRadius = ceilf(slider.value);
}

- (void)changeHorizontalAlignment:(id)sender
{
    UISegmentedControl *control = sender;
    if (control.selectedSegmentIndex == 0) {
        _badgeView.horizontalAlignment = M13BadgeViewHorizontalAlignmentLeft;
    } else if (control.selectedSegmentIndex == 1) {
        _badgeView.horizontalAlignment = M13BadgeViewHorizontalAlignmentCenter;
    } else {
        _badgeView.horizontalAlignment = M13BadgeViewHorizontalAlignmentRight;
    }
}

- (void)changeVerticalAligment:(id)sender
{
    UISegmentedControl *control = sender;
    if (control.selectedSegmentIndex == 0) {
        _badgeView.verticalAlignment = M13BadgeViewVerticalAlignmentTop;
    } else if (control.selectedSegmentIndex == 1) {
        _badgeView.verticalAlignment = M13BadgeViewVerticalAlignmentMiddle;
    } else {
        _badgeView.verticalAlignment = M13BadgeViewVerticalAlignmentBottom;
    }
}

- (void)changeMaxWidth:(id)sender
{
    UISlider *slider = sender;
    _badgeView.maximumWidth = slider.value;
}

- (IBAction)changeHideWhenZero:(id)sender{
    UISwitch *control = sender;
    _badgeView.hidesWhenZero = control.on;
}

- (void)changeShadowBadge:(id)sender
{
    UISwitch *control = sender;
    _badgeView.shadowBadge = control.on;
}

- (void)changeShadowBorder:(id)sender
{
    UISwitch *control = sender;
    _badgeView.shadowBorder = control.on;
}

- (void)changeShadowText:(id)sender
{
    UISwitch *control = sender;
    _badgeView.shadowText = control.on;
}

- (void)changeShowBorder:(id)sender
{
    UISwitch *control = sender;
    if (control.on) {
        _badgeView.borderWidth = 2.0;
    } else {
        _badgeView.borderWidth = 0.0;
    }
}

@end
