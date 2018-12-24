//
//  RelatedQuestionDelegate.h
//  blissProject
//
//  Created by André Nogueira on 12/22/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RelatedQuestionDelegate <NSObject>

@required
-(void)didSelectRelatedQuestion:(NSIndexPath *)indexPath;

@end
