//
//  PopupViewModel.m
//  blissProject
//
//  Created by André Nogueira on 12/24/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

#import "PopupViewModel.h"
#import "blissProject-Swift.h"

@implementation PopupViewModel
- (void)fetchShareWithDestination_email:(NSString *)destination_email
                                success:(void (^)(BOOL))success
                                failure:(void (^)(NSError *error))failure{
    [[QuestionDataManager sharedInstance] fetchShareWithDestination_email:destination_email content_url:nil completion:^(BOOL response, NSError * error) {
        if(response){
            success(response);
        }else{
            failure(error);
        }
    }];
}
@end
