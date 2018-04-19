//
//  EVCVideoCallViewController.m
//  EcoVideoCalling
//
//  Created by ihub on 12/01/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

#import "EVCVideoCallViewController.h"
#import "ARTCVideoChatViewController.h"
@interface EVCVideoCallViewController ()

@end

@implementation EVCVideoCallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.errorLabelHeightConstraint setConstant:0.0f];
    [self.roomid_txtfeild setDelegate:self];
    [self.roomid_txtfeild becomeFirstResponder];
    [self.call_btn setBackgroundColor:[UIColor colorWithWhite:100.0f/255.0f alpha:1.0f]];
    [self.call_btn setEnabled:NO];
    [self.call_btn.layer setCornerRadius:3.0f];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    ARTCVideoChatViewController *viewController = (ARTCVideoChatViewController *)[segue destinationViewController];
    [viewController setRoomName:sender];
}


- (IBAction)callClick:(id)sender {
     [self performSegueWithIdentifier:@"ARTCVideoChatViewController" sender:self.roomid_txtfeild.text];
}

#pragma mark - UITextFieldDelegate Methods

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    BOOL isBackspace = [string isEqualToString:@""] && range.length == 1;
    NSString *text = [NSString stringWithFormat:@"%@%@", textField.text, string];
    if (isBackspace && text.length > 1) {
        text = [text substringWithRange:NSMakeRange(0, text.length-2)];
    }
    if (text.length >= 5) {
        [UIView animateWithDuration:0.3f animations:^{
            [self.errorLabelHeightConstraint setConstant:0.0f];
            [self.textFieldBorderView setBackgroundColor:[UIColor colorWithRed:66.0f/255.0f green:133.0f/255.0f blue:244.0f/255.0f alpha:1.0f]];
            [self.call_btn setBackgroundColor:[UIColor colorWithRed:66.0f/255.0f green:133.0f/255.0f blue:244.0f/255.0f alpha:1.0f]];
            [self.call_btn setEnabled:YES];
            
        }];
    } else {
        [UIView animateWithDuration:0.3f animations:^{
            [self.errorLabelHeightConstraint setConstant:40.0f];
            [self.textFieldBorderView setBackgroundColor:[UIColor colorWithRed:244.0f/255.0f green:67.0f/255.0f blue:54.0f/255.0f alpha:1.0f]];
            [self.call_btn setBackgroundColor:[UIColor colorWithWhite:100.0f/255.0f alpha:1.0f]];
            [self.call_btn setEnabled:NO];
            
        }];
    }
    return YES;
}
@end
