//
//  ChartsBuilder.h
//  blissProject
//
//  Created by André Nogueira on 12/23/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PNChart/PNChart.h>

@interface ChartsBuilder : NSObject<PNChartDelegate>

- (PNRadarChart *)createRadarChart:(NSArray *)values andKeys:(NSArray *)keys;
- (PNBarChart *)createBarChart:(NSArray *)values andKeys:(NSArray *)keys;
- (PNPieChart *)createPieChart:(NSArray *)values andKeys:(NSArray *)keys;

@end
