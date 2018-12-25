//
//  PopupViewModel.h
//  blissProject
//
//  Created by André Nogueira on 12/24/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PopupViewModel : NSObject
- (void)fetchShareWithDestination_email:(NSString *)destination_email
                                success:(void (^)(BOOL))success
                                failure:(void (^)(NSError *error))failure;
@end

NS_ASSUME_NONNULL_END
