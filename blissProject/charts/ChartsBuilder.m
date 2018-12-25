//
//  ChartsBuilder.m
//  blissProject
//
//  Created by André Nogueira on 12/23/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

#import "ChartsBuilder.h"
#import <Masonry/Masonry.h>

@interface ChartsBuilder()
@property (nonatomic) PNPieChart *pieChart;
@property (nonatomic) PNRadarChart *radarChart;
@end

@implementation ChartsBuilder

- (PNPieChart *)createPieChart:(NSArray *)values andKeys:(NSArray *)keys{
    NSMutableArray *items = [NSMutableArray new];
    
    for (int i = 0; i < values.count; i++) {
        [items addObject: [PNPieChartDataItem dataItemWithValue:[values[i] floatValue] color:[self randomColor] description:keys[i]]];
    }
    
    _pieChart = [[PNPieChart alloc]  initWithFrame:CGRectMake(0, 0, 200, 200) items:items];
    
    self.pieChart.descriptionTextColor = [UIColor whiteColor];
    self.pieChart.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:14.0];
    [self.pieChart strokeChart];
    
    return self.pieChart;
}

- (PNBarChart *)createBarChart:(NSArray *)values andKeys:(NSArray *)keys{
    
    static NSNumberFormatter *barChartFormatter;
    if (!barChartFormatter) {
        barChartFormatter = [[NSNumberFormatter alloc] init];
        barChartFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
        barChartFormatter.allowsFloats = NO;
        barChartFormatter.maximumFractionDigits = 0;
    }
    
    PNBarChart *barChart = [[PNBarChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
    barChart.yLabelFormatter = ^(CGFloat yValue) {
        return [barChartFormatter stringFromNumber:@(yValue)];
    };
    
    barChart.yChartLabelWidth = 20.0;
    barChart.chartMarginLeft = 30.0;
    barChart.chartMarginRight = 10.0;
    barChart.chartMarginTop = 5.0;
    barChart.chartMarginBottom = 10.0;
    barChart.labelMarginTop = 5.0;
    barChart.showChartBorder = YES;
    [barChart setXLabels:keys];
    [barChart setYValues:values];
    [barChart setStrokeColors:@[PNGreen, PNGreen, PNRed, PNGreen, PNGreen, PNGreen, PNRed, PNGreen]];
    barChart.isGradientShow = NO;
    barChart.isShowNumbers = NO;
    
    [barChart strokeChart];
    
    barChart.delegate = self;
    return barChart;
}

- (PNRadarChart *)createRadarChart:(NSArray *)values andKeys:(NSArray *)keys{
    NSMutableArray *items = [NSMutableArray new];
    
    for (int i = 0; i < values.count; i++) {
        [items addObject: [PNRadarChartDataItem dataItemWithValue:[values[i] floatValue] description:keys[i]]];
    }
    
    PNRadarChart *radarChart = [[PNRadarChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 300.0) items:items valueDivider:1];
    
    radarChart.plotColor = [UIColor redColor];
    
    [radarChart strokeChart];
    
    return radarChart;
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
            return PNDeepGreen;
    }
}

@end
