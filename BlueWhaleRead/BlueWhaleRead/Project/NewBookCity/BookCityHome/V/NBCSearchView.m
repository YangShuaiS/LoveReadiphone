//
//  NBCSearchView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/16.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NBCSearchView.h"
#import "SearchView.h"
#import "WCQRCodeScanningVC.h"
@implementation NBCSearchView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self AddView];
    }
    return self;
}
- (void)AddView{
    self.backgroundColor = [UIColor whiteColor];
    WS(ws);
    UIView * backview = [UIView new];
    backview.backgroundColor = RGB(248,248,248);
    backview.layer.masksToBounds = YES;
    backview.layer.cornerRadius = LENGTH(20);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(LENGTH(15), LENGTH(20), LENGTH(15), LENGTH(70)));
        make.height.mas_equalTo(LENGTH(40));
    }];
    
    BaseLabel * title = [[BaseLabel alloc] initWithTxteColor:RGB(209,209,209) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"输入书名/作者…"];
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
    saoma.image = UIIMAGE(@"扫码");
    [self addSubview:saoma];
    [saoma mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(19));
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
}
- (void)searchclick{
    SearchView * view = [SearchView new];
    view.nav = [self viewController].navigationController;
    view.frame = [self viewController].view.frame;
    [[self viewController].view.window addSubview:view];
}

- (void)saomaclick{
    WCQRCodeScanningVC *WCVC = [[WCQRCodeScanningVC alloc] init];
    BaseViewController * vc = (BaseViewController *)[self viewController];
    [vc QRCodeScanVC:WCVC];
}

@end
