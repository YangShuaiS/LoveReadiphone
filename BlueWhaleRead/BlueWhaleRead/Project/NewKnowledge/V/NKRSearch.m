//
//  NKRSearch.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NKRSearch.h"
#import "SearchViewController.h"

@implementation NKRSearch{
    UIView * backviews;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self AddView];
    }
    return self;
}
- (void)AddView{
    WS(ws);
    backviews = [UIView new];
    [self addSubview:backviews];
    [backviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    UIView * backview = [UIView new];
    backview.backgroundColor = RGBA(248,248,248,0.75);
    backview.layer.masksToBounds = YES;
    backview.layer.cornerRadius = LENGTH(15);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(LENGTH(26), LENGTH(24), LENGTH(26), LENGTH(24)));
        make.height.mas_equalTo(LENGTH(30));
    }];
    
    BaseLabel * title = [[BaseLabel alloc] initWithTxteColor:RGB(96,96,96) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@"输入书名/作者…"];
    [backview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backview).with.offset(LENGTH(19));
        make.centerY.mas_equalTo(backview);
    }];
    
    UIImageView * search = [UIImageView new];
    search.contentMode = UIViewContentModeScaleAspectFit;
    search.image = UIIMAGE(@"搜索");
    [backview addSubview:search];
    [search mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(backview).with.offset(-LENGTH(19));
        make.centerY.mas_equalTo(backview);
        make.width.and.height.mas_equalTo(LENGTH(16));
    }];
    
    backview.userInteractionEnabled = YES;
    UITapGestureRecognizer *backtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(searchclick)];
    //将手势添加到需要相应的view中去
    [backview addGestureRecognizer:backtap];
}

- (void)searchclick{
    SearchViewController * view = [SearchViewController new];
    [[self viewController].navigationController pushViewController:view animated:NO];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = self->backviews.bounds;
        //    gradient.colors = @[(id)RGBA(0, 0, 0, 1),RGBA(0, 0, 0, 0)];
        UIColor * color1 = RGBA(0, 0, 0, 0.45);
        UIColor * color2 = RGBA(0, 0, 0, 0);
        gradient.colors = @[(id)color1.CGColor,(id)color2.CGColor];
        gradient.startPoint = CGPointMake(0, 0);
        gradient.endPoint = CGPointMake(0, 1);
        //    gradient.locations = @[@(0.5f), @(1.0f)];
        [self->backviews.layer addSublayer:gradient];
    });
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
