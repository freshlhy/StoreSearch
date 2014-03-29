//
//  SearchResultCell.m
//  StoreSearch
//
//  Created by freshlhy on 14-3-29.
//  Copyright (c) 2014年 freshlhy. All rights reserved.
//

#import "SearchResultCell.h"

@implementation SearchResultCell

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    UIView *selectedView = [[UIView alloc] initWithFrame:CGRectZero];
    selectedView.backgroundColor = [UIColor colorWithRed:20 / 255.0f
                                                   green:160 / 255.0f
                                                    blue:160 / 255.0f
                                                   alpha:0.5f];
    self.selectedBackgroundView = selectedView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
