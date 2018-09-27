
//
//  SZSCJGView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "SZSCJGView.h"

@implementation SZSCJGView{
    BaseView * backView;
    FLAnimatedImageView * topImageView;
    BaseLabel * zishu;

    BaseLabel * zql;
    FLAnimatedImageView *RJOrFanHuiBookCity;
    
    BaseLabel * szl;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addView];
    }
    return self;
}
- (void)addView{
    WS(ws);
    backView = [BaseView new];
    backView.backgroundColor = RGB(90,196,192);
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.top.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
//        make.bottom.mas_equalTo(ws); 

//        make.height.mas_equalTo(LENGTH(440));
    }];
    
    topImageView = [FLAnimatedImageView new];
    topImageView.image = UIIMAGE(@"icon_答题成功");
    [backView addSubview:topImageView];
    [topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->backView.mas_centerX);
        make.top.mas_equalTo(self->backView.mas_top).with.offset(NavHeight+LENGTH(11));
        make.width.mas_equalTo(LENGTH(83));
        make.height.mas_equalTo(LENGTH(83));
    }];
    
    szl = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"小朋友你本次的识字量为："];
    [backView addSubview:szl];
    
    [szl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->backView.mas_centerX);
        make.top.mas_equalTo(self->topImageView.mas_bottom).with.offset(8);
    }];
    
    zishu= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"200字"];
    [backView addSubview:zishu];
    
    [zishu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->backView.mas_centerX);
        make.top.mas_equalTo(self->szl.mas_bottom).with.offset(10);
        make.bottom.mas_equalTo(self->backView.mas_bottom).with.offset(-LENGTH(10));
    }];
    
    zql= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"小天预估你的认字量是        字\n多读书就可以认识更多的字哦，加油！"];
    zql.numberOfLines = 0;
    [self addSubview:zql];
    
    [zql mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->backView.mas_centerX);
        make.top.mas_equalTo(self->backView.mas_bottom).with.offset(20);
    }];
    
    
    RJOrFanHuiBookCity = [FLAnimatedImageView new];
    RJOrFanHuiBookCity.backgroundColor = RGB(255,154,73);
    RJOrFanHuiBookCity.layer.masksToBounds = YES;
    RJOrFanHuiBookCity.layer.cornerRadius = LENGTH(25);
    RJOrFanHuiBookCity.layer.borderWidth = 1;
    RJOrFanHuiBookCity.layer.borderColor = [UIColor whiteColor].CGColor;
    [self addSubview:RJOrFanHuiBookCity];
    [RJOrFanHuiBookCity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->zql.mas_bottom).with.offset(LENGTH(45));
        make.centerX.mas_equalTo(self->backView.mas_centerX);
        make.width.mas_equalTo(LENGTH(160));
        make.height.mas_equalTo(LENGTH(50));
    }];
    
    BaseLabel * Titles = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"返回首页"];
    [RJOrFanHuiBookCity addSubview:Titles];
    [Titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->RJOrFanHuiBookCity );
    }];
    RJOrFanHuiBookCity.userInteractionEnabled = YES;
    //添加手势
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BackBookList)];
    //将手势添加到需要相应的view中去
    [RJOrFanHuiBookCity addGestureRecognizer:tapGesture2];
}

- (void)setTitles:(NSString *)titles{
    _titles = titles;
    if ([_titles isEqualToString:@"识字量检测"]) {
        szl.text = [NSString stringWithFormat:@"小朋友你本次的识字量为："];
    }else if ([_titles isEqualToString:@"识词量检测"]){
        szl.text = [NSString stringWithFormat:@"小朋友你本次的识词量为："];
    }
}
- (void)setJg:(NSString *)jg{
    _jg = jg;
    if ([_titles isEqualToString:@"识字量检测"]) {
        zishu.text = [NSString stringWithFormat:@"%@字",jg];
        zql.text = [NSString stringWithFormat:@"小天预估你的认字量是%@字\n多读书就可以认识更多的字哦，加油！",jg];
    }else if ([_titles isEqualToString:@"识词量检测"]){
        zishu.text = [NSString stringWithFormat:@"%@词",jg];
        zql.text = [NSString stringWithFormat:@"小天预估你的认词量是%@词\n多读书就可以认识更多的词哦，加油！",jg];
    }

}
- (void)BackBookList{
    if ([self.nav respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.nav.interactivePopGestureRecognizer.enabled = YES;
    }
    [self.nav popToRootViewControllerAnimated:YES];
}

//书架
- (void)bookcity{
    if ([self.nav respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.nav.interactivePopGestureRecognizer.enabled = YES;
    }
//    NSMutableArray *marr = [[NSMutableArray alloc]initWithArray:self.nav.viewControllers];
    
//    for (UIViewController *vc in marr) {
//        if ([vc isKindOfClass:[BookListViewController class]]) {
//            [self.nav popToViewController:vc animated:YES];
//            return;
//        }
//    }
//    BookListViewController * vc = [BookListViewController new];
//    [self.nav pushViewController:vc animated:YES];
}

@end
