//
//  BuyInterestsCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/24.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyInterestsCollectionViewCell.h"

@implementation BuyInterestsCollectionViewCell{
    UIImageView * imageView;
    BaseLabel * label;
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
    imageView = [UIImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.left.mas_equalTo(ws).with.offset(LENGTH(5));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(5));
        make.height.mas_equalTo(self->imageView.mas_width);
        make.centerX.mas_equalTo(ws);
    }];
    
    CGFloat zt = self.frame.size.width/LENGTH(55)*13.0;
    label = [[BaseLabel alloc] initWithTxteColor:RGB(132,106,62) LabelFont:TextFont(zt) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageView.mas_bottom).with.offset(LENGTH(5));
        make.left.and.right.and.bottom.mas_equalTo(ws);
    }];
}
- (void)setModel:(BuyInterestsModel *)model{
    _model = model;
    imageView.image = UIIMAGE(model.image);
    label.text = model.title;
}
@end
