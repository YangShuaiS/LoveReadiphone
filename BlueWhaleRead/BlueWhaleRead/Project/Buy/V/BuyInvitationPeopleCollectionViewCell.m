//
//  BuyInvitationPeopleCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/24.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyInvitationPeopleCollectionViewCell.h"

@implementation BuyInvitationPeopleCollectionViewCell{
    UIImageView * imageView;
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
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = LENGTH(16);
//    imageView.image = UIIMAGE(@"头像-大");
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.size.mas_equalTo(CGSizeMake(LENGTH(32), LENGTH(32)));
        make.centerX.mas_equalTo(ws);
    }];
    
}
- (void)setModel:(PingLunModel *)model{
    _model = model;
    [imageView sd_setImageWithURL:URLIMAGE(model.avatar)];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    //中间镂空的矩形框
    //镂空
    CGRect frame = CGRectMake(LENGTH(1), LENGTH(1), LENGTH(28), LENGTH(28));
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:frame.size.width/2];
    
    CAShapeLayer *border = [CAShapeLayer layer];

    border.cornerRadius = frame.size.width/2;
    //虚线的颜色
    border.strokeColor = [UIColor blackColor].CGColor;
    //填充的颜色
    border.fillColor = [UIColor clearColor].CGColor;
    
    //设置路径
    //    border.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    border.path = circlePath.CGPath;
    
    border.frame = frame;
    //虚线的宽度
    border.lineWidth = 1.f;
    
    //设置线条的样式
    //    border.lineCap = @"square";
    //虚线的间隔
    border.lineDashPattern = @[@4, @2];
    
    [self.layer addSublayer:border];
    [self addSubview:imageView];

}
@end
