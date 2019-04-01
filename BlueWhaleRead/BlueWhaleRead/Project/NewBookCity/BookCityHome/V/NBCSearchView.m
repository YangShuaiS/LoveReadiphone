//
//  NBCSearchView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/16.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NBCSearchView.h"
#import "SearchViewController.h"
#import "WCQRCodeScanningVC.h"
#import "BookCityViewController.h"
@implementation NBCSearchView{
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
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(LENGTH(26), LENGTH(48), LENGTH(26), LENGTH(48)));
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

    UIImageView * saoma = [UIImageView new];
    saoma.contentMode = UIViewContentModeScaleAspectFit;
    saoma.image = UIIMAGE(@"icon_扫码");
    [self addSubview:saoma];
    [saoma mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(15));
        make.centerY.mas_equalTo(backview);
        make.width.and.height.mas_equalTo(LENGTH(20));
    }];
    
    UIImageView * shujia = [UIImageView new];
    shujia.contentMode = UIViewContentModeScaleAspectFit;
    shujia.image = UIIMAGE(@"书库");
    [self addSubview:shujia];
    [shujia mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(15));
        make.centerY.mas_equalTo(backview);
        make.width.and.height.mas_equalTo(LENGTH(20));
    }];
    
    backview.userInteractionEnabled = YES;
    UITapGestureRecognizer *backtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(searchclick)];
    //将手势添加到需要相应的view中去
    [backview addGestureRecognizer:backtap];

    saoma.userInteractionEnabled = YES;
    UITapGestureRecognizer *saomatap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(saomaclick)];
    //将手势添加到需要相应的view中去
    [saoma addGestureRecognizer:saomatap];
    
    shujia.userInteractionEnabled = YES;
    UITapGestureRecognizer *shujiatap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shujiaclick)];
    //将手势添加到需要相应的view中去
    [shujia addGestureRecognizer:shujiatap];
}
- (void)searchclick{
//    SearchView * view = [SearchView new];
//    view.nav = [self viewController].navigationController;
//    view.frame = [self viewController].view.frame;
//    [[self viewController].view.window addSubview:view];
    
    SearchViewController * view = [SearchViewController new];
    [[self viewController].navigationController pushViewController:view animated:NO];
}

- (void)saomaclick{
    WCQRCodeScanningVC *WCVC = [[WCQRCodeScanningVC alloc] init];
    BaseViewController * vc = (BaseViewController *)[self viewController];
    [vc QRCodeScanVC:WCVC];
}
- (void)shujiaclick{
    BookCityViewController * vc = [BookCityViewController new];
    NSIndexPath * indpath = [NSIndexPath indexPathForRow:0 inSection:0];
    vc.inpath = indpath;
    vc.mrclass = 1;
    vc.cata = [NSString stringWithFormat:@"100"];
    [[self viewController].navigationController pushViewController:vc animated:YES];
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
@end
