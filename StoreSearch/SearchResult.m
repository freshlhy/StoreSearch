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

- (NSString *)kindForDisplay {
    if ([self.kind isEqualToString:@"album"]) {
        return @"Album";
    } else if ([self.kind isEqualToString:@"audiobook"]) {
        return @"Audio Book";
    } else if ([self.kind isEqualToString:@"book"]) {
        return @"Book";
    } else if ([self.kind isEqualToString:@"ebook"]) {
        return @"E-Book";
    } else if ([self.kind isEqualToString:@"feature-movie"]) {
        return @"Movie";
    } else if ([self.kind isEqualToString:@"music-video"]) {
        return @"Music Video";
    } else if ([self.kind isEqualToString:@"podcast"]) {
        return @"Podcast";
    } else if ([self.kind isEqualToString:@"software"]) {
        return @"App";
    } else if ([self.kind isEqualToString:@"song"]) {
        return @"Song";
    } else if ([self.kind isEqualToString:@"tv-episode"]) {
        return @"TV Episode";
    } else {
        return self.kind;
    }
}

@end
