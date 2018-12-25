//
//  PopupViewController.h
//  blissProject
//
//  Created by André Nogueira on 12/24/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PopupViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *popUpView;

- (void)showInView:(UIView *)aView animated:(BOOL)animated;
@end

NS_ASSUME_NONNULL_END
