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
#import "DetailsResultViewController+BuildChart.h"

@interface DetailsResultViewController()<UITableViewDelegate, UITableViewDataSource>
@end

@implementation DetailsResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.chartsBuilder = [ChartsBuilder new];
    self.detailsResultViewModel = [DetailsResultViewModel new];
    [self.tableView registerNib:[UINib nibWithNibName:@"QuestionResultTableViewCell" bundle:nil] forCellReuseIdentifier:@"QuestionResultTableViewCell"];
    
    [self.tableView reloadData];
    [self.imageQuestion sd_setImageWithURL:[NSURL URLWithString:self.image_question_url]];
}

- (void)viewWillAppear:(BOOL)animated{
    self.tableView.hidden = NO;
    self.detailChart.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
    [label setFont:[UIFont boldSystemFontOfSize:15]];
    NSString *string = self.question_overview;
    /* Section header is in 0th index... */
    [label setText:string];
    [view addSubview:label];
    [view setBackgroundColor:[UIColor colorWithRed:166/255.0 green:177/255.0 blue:186/255.0 alpha:1.0]];
    return view;
}

@end

@implementation DetailsResultViewController (UITableViewDelegate)

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.tableView.hidden = YES;
    self.detailChart.hidden = NO;
    
    [self buildPieChart];
    [self buildBarChart];
    [self buildRadarChart];
    [self.detailsResultViewModel fetchVote:indexPath];
}


@end

