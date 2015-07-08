//
//  LongCell.m
//  MoveCellDemo
//
//  Created by yongzhang on 15/7/8.
//  Copyright (c) 2015年 yongzhang. All rights reserved.
//

#import "LongCell.h"

const CGFloat kLongCellHeight = 200;

@implementation LongCell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

+ (CGFloat)heigthForCell
{
    return kLongCellHeight;
}

@end
