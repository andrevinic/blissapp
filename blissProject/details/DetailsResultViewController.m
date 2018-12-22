//
//  DetailsResultViewController.m
//  blissProject
//
//  Created by André Nogueira on 12/21/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//
#import "DetailsResultViewController.h"
#import <PNChart/PNChart.h>
#import "blissProject-Swift.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DetailsResultViewController()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation DetailsResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"QuestionResultTableViewCell" bundle:nil] forCellReuseIdentifier:@"QuestionResultTableViewCell"];
    //For Pie Chart
    [self.tableView reloadData];
    self.questionOverview.text = self.question_overview;
    [self.imageQuestion sd_setImageWithURL:[NSURL URLWithString:self.image_question_url]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIColor *)randomColor{
    int r = arc4random_uniform(6);
    switch (r) {
        case 1:
            return PNRed;
        case 2:
            return PNBlue;
        case 3:
            return PNGrey;
        case 4:
            return PNBrown;
        case 5:
            return PNGreen;
        default:
            return PNBlack;
    }
}

- (void)configureCell:(QuestionResultTableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    cell.language.text = [self.choices_description objectAtIndex:indexPath.row];
}

@end

@implementation DetailsResultViewController (UITableViewDataSource)

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"QuestionResultTableViewCell";
    QuestionResultTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[QuestionResultTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }else{
        [self configureCell:cell indexPath:indexPath];
    }
    
    return cell;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.choices_values.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

@end

@implementation DetailsResultViewController (UITableViewDelegate)

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.tableView.hidden = true;
    self.detailChart.hidden = false;
    NSMutableArray *items = [NSMutableArray new];

    for (int i = 0; i < _choices_values.count; i++) {
        [items addObject: [PNPieChartDataItem dataItemWithValue:[_choices_values[i] floatValue] color:[self randomColor] description:_choices_description[i]]];
    }
    PNPieChart *pieChart = [[PNPieChart alloc]  initWithFrame:CGRectMake(0, 0, 200, 200) items:items];
    
    pieChart.descriptionTextColor = [UIColor whiteColor];
    pieChart.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:14.0];
    [pieChart strokeChart];
    [_detailChart addSubview:pieChart];

}
@end
