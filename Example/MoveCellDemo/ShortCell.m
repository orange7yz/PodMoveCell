//
//  ShortCell.m
//  MoveCellDemo
//
//  Created by yongzhang on 15/7/8.
//  Copyright (c) 2015年 yongzhang. All rights reserved.
//

#import "ShortCell.h"

const CGFloat kShortCellHeight = 100;

@implementation ShortCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)heightForCell {
    return kShortCellHeight;
}

@end
