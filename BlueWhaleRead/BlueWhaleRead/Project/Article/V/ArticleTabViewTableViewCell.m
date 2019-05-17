//
//  ArticleTabViewTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/5/14.
//  Copyright © 2019 YS. All rights reserved.
//

#import "ArticleTabViewTableViewCell.h"

@implementation ArticleTabViewTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    _img = [UIImageView new];
    _img.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_img];
    [_img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
        make.width.mas_equalTo(ws.mas_width);
    }];
    _img.backgroundColor = [UIColor redColor];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
