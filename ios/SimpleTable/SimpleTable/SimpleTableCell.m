//
//  SimpleTableCell.m
//  SimpleTable
//
//  Created by tuyou on 14-7-22.
//  Copyright (c) 2014年 tuyoo. All rights reserved.
//

#import "SimpleTableCell.h"

@implementation SimpleTableCell
/*
 @synthesize 关键字告诉编译器自劢生成代码,用来讵问前面定丿的属性。如
果你忘记包吨返些指令,Xcode 将抛出如下异常
*/
@synthesize nameLabel = _nameLabel;
@synthesize prepTimeLabel = _prepTimeLabel;
@synthesize thumbnailImageView = _thumbnailImageView;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
