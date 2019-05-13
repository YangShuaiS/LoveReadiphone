//
//  NKTopSearchView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/8.
//  Copyright © 2019 YS. All rights reserved.
//

#import "NKTopSearchView.h"
#import "SearchViewController.h"
#import "WCQRCodeScanningVC.h"
@implementation NKTopSearchView{
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
    UIView *backview = [UIView new];
    backview.layer.masksToBounds = YES;
    backview.layer.cornerRadius = LENGTH(15);
    backview.backgroundColor = RGB(241,241,241);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.left.mas_equalTo(ws).with.offset(LENGTH(17));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(53));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(10));
        make.height.mas_equalTo(LENGTH(30));
    }];
    
    UIImageView * search = [UIImageView new];
    search.contentMode = UIViewContentModeScaleAspectFit;
    search.image = UIIMAGE(@"搜索");
    [backview addSubview:search];
    [search mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backview).with.offset(LENGTH(7));
        make.centerY.mas_equalTo(backview);
        make.width.and.height.mas_equalTo(LENGTH(15));
    }];
    
    BaseLabel * title = [[BaseLabel alloc] initWithTxteColor:RGB(96,96,96) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@"孙悟空的妈妈是谁？"];
    [backview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(search.mas_right).with.offset(LENGTH(8));
        make.centerY.mas_equalTo(backview);
    }];
    
    backview.userInteractionEnabled = YES;
    UITapGestureRecognizer *backtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(searchclick)];
    //将手势添加到需要相应的view中去
    [backview addGestureRecognizer:backtap];
    
    UIImageView * saoma = [UIImageView new];
    saoma.contentMode = UIViewContentModeScaleAspectFit;
    saoma.image = UIIMAGE(@"扫一扫-图标");
    [self addSubview:saoma];
    [saoma mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backview.mas_right).with.offset(LENGTH(12));
        make.width.and.height.mas_equalTo(LENGTH(20));
        make.top.mas_equalTo(backview);
    }];
    
    BaseLabel * saotitle = [[BaseLabel alloc] initWithTxteColor:RGB(9,3,3) LabelFont:TextFontCu(9) TextAlignment:NSTextAlignmentCenter Text:@"扫一扫"];
    [self addSubview:saotitle];
    [saotitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(search.mas_bottom).with.offset(LENGTH(3));
        make.centerX.mas_equalTo(saoma);
    }];
    
    UIView * sanmaclick = [UIView new];
    [self addSubview:sanmaclick];
    [sanmaclick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.and.right.mas_equalTo(ws);
        make.left.mas_equalTo(backview.mas_right);
    }];
    
    sanmaclick.userInteractionEnabled = YES;
    UITapGestureRecognizer *sanmaclicktap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sanmaclick)];
    //将手势添加到需要相应的view中去
    [sanmaclick addGestureRecognizer:sanmaclicktap];
}

- (void)searchclick{
    SearchViewController * view = [SearchViewController new];
    [[self viewController].navigationController pushViewController:view animated:NO];
}
- (void)sanmaclick{
    WCQRCodeScanningVC *WCVC = [[WCQRCodeScanningVC alloc] init];
    BaseViewController * vc = (BaseViewController *)[self viewController];
    [vc QRCodeScanVC:WCVC];
}
@end
