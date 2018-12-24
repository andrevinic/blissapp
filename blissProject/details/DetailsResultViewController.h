//
//  DetailsResultViewController.h
//  blissProject
//
//  Created by André Nogueira on 12/21/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//
@import UIKit;
#import "RelatedQuestionDelegate.h"
#import "ChartsBuilder.h"

@interface DetailsResultViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *detailChart;
@property (weak, nonatomic) IBOutlet UIImageView *imageQuestion;

@property (nonatomic) NSString *image_question_url;
@property (nonatomic) NSString *question_overview;
@property (weak, nonatomic) id<RelatedQuestionDelegate> questionDelegate;
@property (nonatomic) NSArray<NSNumber *> *choices_values;
@property (nonatomic) NSArray<NSString *> *choices_description;
@property (strong, nonatomic) ChartsBuilder *chartsBuilder;

@end
