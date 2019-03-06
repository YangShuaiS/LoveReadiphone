//
//  ZhiShiShuTDListView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/18.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ZhiShiShuTDListView.h"
#import "ZhiShiShuViewController.h"
@implementation ZhiShiShuTDListView{
    UIView * oneView;
    UIView * twoView;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}

- (void)addview{
    WS(ws);
    oneView = [UIView new];
    oneView.backgroundColor = RGB(64,199,198);
    oneView.layer.shadowOpacity = 1;
    oneView.layer.shadowColor = RGBA(57, 177, 176,0.4).CGColor;
    oneView.layer.shadowRadius = LENGTH(2);
    oneView.layer.shadowOffset = CGSizeMake(0,LENGTH(3.5));
    [self addSubview:oneView];
    [oneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(110));
        make.height.mas_equalTo(LENGTH(32));
    }];
    
    BaseLabel * onelabel = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"返回二级菜单"];
    [oneView addSubview:onelabel];
    [onelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.bottom.mas_equalTo(self->oneView);
        make.right.mas_equalTo(self->oneView).with.offset(-LENGTH(28));
    }];
    
    UIImageView * oneimageview = [UIImageView new];
    oneimageview.contentMode = UIViewContentModeScaleAspectFit;
    oneimageview.image = UIIMAGE(@"返回二级菜单");
    [oneView addSubview:oneimageview];
    [oneimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self->oneView).with.offset(-LENGTH(8));
        make.centerY.mas_equalTo(self->oneView);
        make.size.mas_equalTo(CGSizeMake(LENGTH(14), LENGTH(15)));
    }];
    
     
    twoView = [UIView new];
    twoView.backgroundColor = RGB(64,199,198);
    twoView.layer.shadowOpacity = 1;
    twoView.layer.shadowColor = RGBA(57, 177, 176,0.4).CGColor;
    twoView.layer.shadowRadius = LENGTH(2);
    twoView.layer.shadowOffset = CGSizeMake(0,LENGTH(3.5));
    [self addSubview:twoView];
    [twoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->oneView.mas_bottom).with.offset(LENGTH(12));
        make.bottom.and.left.and.right.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(110));
        make.height.mas_equalTo(LENGTH(32));
    }];
    
    BaseLabel * twolabel = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"全部知识图"];
    [twoView addSubview:twolabel];
    [twolabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.bottom.mas_equalTo(self->twoView);
        make.right.mas_equalTo(self->twoView).with.offset(-LENGTH(28));
    }];
    
    UIImageView * twoimageview = [UIImageView new];
    twoimageview.contentMode = UIViewContentModeScaleAspectFit;
    twoimageview.image = UIIMAGE(@"全部知识图-图标");
    [twoView addSubview:twoimageview];
    [twoimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self->twoView).with.offset(-LENGTH(8));
        make.centerY.mas_equalTo(self->twoView);
        make.size.mas_equalTo(CGSizeMake(LENGTH(14), LENGTH(15)));
    }];
    
    
    oneView.userInteractionEnabled = YES;
    UITapGestureRecognizer *backtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back)];
    //将手势添加到需要相应的view中去
    [oneView addGestureRecognizer:backtap];
    
    
    twoView.userInteractionEnabled = YES;
    UITapGestureRecognizer *backtaptwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xianshi)];
    //将手势添加到需要相应的view中去
    [twoView addGestureRecognizer:backtaptwo];
}
- (void)back{
    NSMutableArray *marr = [[NSMutableArray alloc]initWithArray:[self viewController].navigationController.viewControllers];
    //删除完再从新赋值，防止崩溃
    NSMutableArray * navarr = [NSMutableArray array];
    [navarr addObjectsFromArray:marr];
    for (int i = 0; i < marr.count; i++) {
        UIViewController * vc = marr[i];
        if ([vc isKindOfClass:[ZhiShiShuViewController class]]) {
            [[self viewController].navigationController popToViewController:vc animated:YES];
            return;
        }
    }
    [[self viewController].navigationController popToRootViewControllerAnimated:YES];

}

- (void)xianshi{
    self.block();
}
- (void)layoutSubviews{
    [super layoutSubviews];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:oneView.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(LENGTH(16), LENGTH(16))];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = oneView.bounds;
    maskLayer.path = maskPath.CGPath;
    oneView.layer.mask  = maskLayer;
    
    UIBezierPath *twomaskPath = [UIBezierPath bezierPathWithRoundedRect:twoView.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(LENGTH(16), LENGTH(16))];
    CAShapeLayer *maskLayertwo = [[CAShapeLayer alloc] init];
    maskLayertwo.frame = twoView.bounds;
    maskLayertwo.path = twomaskPath.CGPath;
    twoView.layer.mask  = maskLayertwo;
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"FlyElephant---触摸开始");
//}
//
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
//
//    UITouch *touch = [touches anyObject];
//
//    CGPoint currentPoint = [touch locationInView:self];
//    // 获取上一个点
//    CGPoint prePoint = [touch previousLocationInView:self];
//    CGFloat offsetX = currentPoint.x - prePoint.x;
//    CGFloat offsetY = currentPoint.y - prePoint.y;
//
//    NSLog(@"FlyElephant----当前位置:%@---之前的位置:%@",NSStringFromCGPoint(currentPoint),NSStringFromCGPoint(prePoint));
//    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
//}
//
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"FlyElephant---触摸结束");
//}
- (void)setStyle:(NSInteger)style{
    _style = style;
    if (style == 2) {
        [twoView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
    }
}

@end
