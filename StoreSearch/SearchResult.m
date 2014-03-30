//
//  SearchResult.m
//  StoreSearch
//
//  Created by freshlhy on 14-3-29.
//  Copyright (c) 2014年 freshlhy. All rights reserved.
//

#import "SearchResult.h"

@implementation SearchResult

- (NSComparisonResult)compareName:(SearchResult *)other {
    return [self.name localizedStandardCompare:other.name];
}

@end
