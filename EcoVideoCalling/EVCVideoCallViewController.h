//
//  EVCVideoCallViewController.h
//  EcoVideoCalling
//
//  Created by ihub on 12/01/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EVCVideoCallViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *roomid_txtfeild;
@property (weak, nonatomic) IBOutlet UILabel *error_lbl;
@property (weak, nonatomic) IBOutlet UIButton *call_btn;
@property (strong, nonatomic) IBOutlet UIView *textFieldBorderView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *errorLabelHeightConstraint; //used for animating
- (IBAction)callClick:(id)sender;

@end
