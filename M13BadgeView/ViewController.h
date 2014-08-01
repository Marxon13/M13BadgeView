//
//  ViewController.h
//  M13BadgeView
//
//  Created by Brandon McQuilkin on 2/19/14.
//  Copyright (c) 2014 Brandon McQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "M13BadgeView.h"

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, retain) M13BadgeView *badgeView;
@property (nonatomic, retain) IBOutlet UIView *badgeSuperView;

@property (nonatomic, retain) IBOutlet UITextField *textField;

- (IBAction)changeTextColor:(id)sender;
- (IBAction)changeBorderColor:(id)sender;
- (IBAction)changeBackgroundColor:(id)sender;
- (IBAction)changeFont:(id)sender;
- (IBAction)changeGloss:(id)sender;
- (IBAction)changeCornerRadius:(id)sender;
- (IBAction)changeHorizontalAlignment:(id)sender;
- (IBAction)changeVerticalAligment:(id)sender;
- (IBAction)changeMaxWidth:(id)sender;
- (IBAction)changeHideWhenZero:(id)sender;
- (IBAction)changeShadowBadge:(id)sender;
- (IBAction)changeShadowBorder:(id)sender;
- (IBAction)changeShadowText:(id)sender;
- (IBAction)changeShowBorder:(id)sender;

@end
