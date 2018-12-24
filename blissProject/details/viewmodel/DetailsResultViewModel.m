//
//  DetailsResultViewModel.m
//  blissProject
//
//  Created by André Nogueira on 12/24/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

#import "DetailsResultViewModel.h"
#import "blissProject-Swift.h"
#import "RelatedQuestionDelegate.h"

@interface DetailsResultViewModel()<RelatedQuestionDelegate>
@property (weak, nonatomic) QuestionDataManager *questionDataManager;
@end

@implementation DetailsResultViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.questionDataManager = [QuestionDataManager sharedInstance];
    }
    return self;
}

- (void)fetchVote:(NSIndexPath *)indexPath{
    [self didSelectRelatedQuestion:indexPath];
}
@end

@implementation DetailsResultViewModel (RelatedQuestionDelegate)

-(void)didSelectRelatedQuestion:(NSIndexPath *)indexPath{
    [self.questionDataManager fetchVote:indexPath.row];
}

@end
