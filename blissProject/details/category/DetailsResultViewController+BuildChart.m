//
//  DetailsResultViewController+BuildChart.m
//  blissProject
//
//  Created by André Nogueira on 12/23/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

#import "DetailsResultViewController+BuildChart.h"
#import <Masonry/Masonry.h>
#import <PNChart/PNChart.h>

@implementation DetailsResultViewController (BuildChart)

- (void)buildPieChart{

    NSArray *arrayValue = [self.choices_values valueForKeyPath:@"self.stringValue"];
    
    PNPieChart *pieChart = [self.chartsBuilder createPieChart:arrayValue andKeys:self.choices_description];
    [self.view addSubview:pieChart];
    
    [pieChart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.height.mas_equalTo(200);
        make.width.mas_equalTo(200);
    }];
}

- (void)buildBarChart{
    NSArray *arrayValue = [self.choices_values valueForKeyPath:@"self.stringValue"];

    PNBarChart *barChart = [self.chartsBuilder createBarChart:arrayValue andKeys:self.choices_description];
    [self.view addSubview:barChart];
    [barChart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.height.mas_equalTo(200);
        make.width.mas_equalTo(SCREEN_WIDTH - 10);
        make.bottom.mas_equalTo(self.view.mas_bottom);
        
    }];
}

- (void)buildRadarChart{
    
    self.imageQuestion.hidden = YES;
    
    NSArray *arrayValue = [self.choices_values valueForKeyPath:@"self.stringValue"];

    PNRadarChart *radarChart = [self.chartsBuilder createRadarChart:arrayValue andKeys:self.choices_description];
    
    [self.view addSubview:radarChart];
    
    [radarChart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.height.mas_equalTo(300);
        make.width.mas_equalTo(SCREEN_WIDTH - 10);
        make.top.mas_equalTo(self.view.mas_top);
    }];
}
@end
