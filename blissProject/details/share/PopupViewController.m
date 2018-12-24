//
//  PopupViewController.m
//  blissProject
//
//  Created by André Nogueira on 12/24/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

#import "PopupViewController.h"
#import "blissProject-Swift.h"

@interface PopupViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;

@end

@implementation PopupViewController

#pragma mark - Life cycle events

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.shareButton setEnabled:NO];
    self.shareButton.alpha = 0.5;

    self.navigationController.navigationBarHidden = YES;
    
    [self setupPopupView];
    [self setupEmailTextField];
}

#pragma mark - Setup methods

- (void)setupEmailTextField{
    self.emailTextField.delegate = self;
    self.emailTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
}
- (void)setupPopupView{
    self.view.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:.6];
    self.popUpView.layer.cornerRadius = 5;
    self.popUpView.layer.shadowOpacity = 0.8;
    self.popUpView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
}

- (void)showAnimate
{
    self.view.transform = CGAffineTransformMakeScale(1.3, 1.3);
    self.view.alpha = 0;
    [UIView animateWithDuration:.25 animations:^{
        self.view.alpha = 1;
        self.view.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

- (void)removeAnimate
{
    [UIView animateWithDuration:.25 animations:^{
        self.view.transform = CGAffineTransformMakeScale(1.3, 1.3);
        self.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.view removeFromSuperview];
        }
    }];
}

- (void)showInView:(UIView *)aView animated:(BOOL)animated{
    [aView addSubview:self.view];
    if (animated) {
        [self showAnimate];
    }
}

#pragma mark - IBActions

- (IBAction)clickedOnShare:(id)sender {
    
    NSString *destination_email = self.emailTextField.text;

    [[QuestionDataManager sharedInstance] fetchShareWithDestination_email:destination_email content_url:nil completion:^(BOOL success, NSError * error) {
        if(success){
            [self.shareButton setTitle:@"Email shared!" forState:UIControlStateNormal];
            [self.shareButton setEnabled:FALSE];
        }
    }];
    
}

- (IBAction)closePopup:(id)sender {
    [self removeAnimate];
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

@end

@implementation PopupViewController (UITextFieldDelegate)

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [self.shareButton setEnabled:NO];
    self.shareButton.alpha = 0.5;
    textField.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0f];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.emailTextField becomeFirstResponder];
    [self.shareButton setEnabled:YES];
    self.shareButton.alpha = 1.0;
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSString *email = textField.text;
    self.emailTextField.text = email;
}

@end
