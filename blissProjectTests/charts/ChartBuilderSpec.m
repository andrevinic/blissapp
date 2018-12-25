//
//  ChartBuilderTest.m
//  blissProjectTests
//
//  Created by André Nogueira on 12/25/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//
#define QUICK_DISABLE_SHORT_SYNTAX 1

#import "ChartsBuilder.h"
#import <Quick/Quick.h>
#import <Nimble/Nimble.h>
#import <Nimble/Nimble-Swift.h>

@interface ChartsBuilder()
@property (nonatomic) PNPieChart *pieChart;
@property (nonatomic) PNRadarChart *radarChart;
@end

QuickSpecBegin(ChartBuilderSpec)

describe(@"Should test ChartsBuilder", ^{
    __block ChartsBuilder *chartsBuilder;
    describe(@"should test public methods", ^{
        
        beforeSuite(^{
            chartsBuilder = [ChartsBuilder new];
        });
        
        it(@"creating new instance", ^{
            expect(chartsBuilder).toNot(beNil());
            expect(chartsBuilder.pieChart).to(beNil());
        });
        
        it(@"it should test create bar chart", ^{
            NSArray *values = @[@1.1, @2.2, @200.0, @3.3];
            NSArray *keys = @[@"Swift", @"Objective-C", @"Test", @"test2"];
            PNBarChart *barChart = [chartsBuilder createBarChart:values andKeys:keys];
            expect(barChart).toNot(beNil());
            expect([barChart.yValues count]).to(equal([values count]));
            expect([barChart.xLabels count]).to(equal([keys count]));
        });
        
        it(@"it should test create bar chart", ^{
            NSArray *values = @[@1.1, @2.2, @200.0, @3.3];
            NSArray *keys = @[@"Swift", @"Objective-C", @"Test", @"test2"];
            PNPieChart *pieChart = [chartsBuilder createPieChart:values andKeys:keys];
            expect(pieChart).toNot(beNil());
            expect([pieChart.items count]).to(equal([values count]));
        });
        
        it(@"it should test create bar chart", ^{
            NSArray *values = @[@1.1, @2.2, @200.0, @3.3];
            NSArray *keys = @[@"Swift", @"Objective-C", @"Test", @"test2"];
            PNRadarChart *radarChart = [chartsBuilder createRadarChart:values andKeys:keys];
            expect(radarChart).toNot(beNil());
            expect([radarChart.chartData count]).to(equal([values count]));
        });
        
    });
});
QuickSpecEnd
