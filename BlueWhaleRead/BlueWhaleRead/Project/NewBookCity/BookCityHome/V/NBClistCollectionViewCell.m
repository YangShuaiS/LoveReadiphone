//
//  NBClistCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBClistCollectionViewCell.h"

@implementation NBClistCollectionViewCell{
    UIImageView * label;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    label = [UIImageView new];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)setModel:(NBCclassificationModel *)model{
    _model = model;
    [label sd_setImageWithURL:URLIMAGE(model.rank_theme_img)];
}
@end
