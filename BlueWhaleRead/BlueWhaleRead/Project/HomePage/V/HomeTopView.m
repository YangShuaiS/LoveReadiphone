//
//  HomeTopView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeTopView.h"
#import "MyMedalViewController.h"
#import "HomeMilestoneViewController.h"
@interface HomeTopView()

@end

@implementation HomeTopView{
    FLAnimatedImageView * touxiang;
    BaseLabel * name;
    BaseLabel * dengji;
    BaseLabel * leftlabel;
    BaseLabel * rightlabel;

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
    self.backgroundColor = MAINCOLOR;
    
    //二维码视图
    FLAnimatedImageView * erweima = [FLAnimatedImageView new];
    erweima.image = UIIMAGE(@"icon_扫码");
    [self addSubview:erweima];
    
    BaseLabel * titleLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:WhitColor LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"首页"];
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(ws).with.offset(StatusBar+LENGTH(12));
    }];
    
    //二维码点击事件
    BaseButton * erweimabutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [erweimabutton addTarget:self action:@selector(erweima) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:erweimabutton];
    
    //头像
    touxiang = [FLAnimatedImageView new];
//    touxiang.backgroundColor = RANDOMCOLOR;
    touxiang.layer.cornerRadius = LENGTH(25);
    touxiang.layer.masksToBounds = YES;
    touxiang.layer.borderWidth = LENGTH(4);
    touxiang.layer.borderColor = RGB(115, 209, 206).CGColor;
    [self addSubview:touxiang];
    //头像点击事件
    BaseButton * touxiangbutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [touxiangbutton addTarget:self action:@selector(touxiangbutton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:touxiangbutton];
    //名称
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:WhitColor LabelFont:TextFontCu(19) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:name];
    //等级
    dengji = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(254,236,119) LabelFont:TextFontCu(14) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:dengji];
    
    [erweima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(11));
        make.top.equalTo(ws).with.offset(StatusBar+LENGTH(7));
        make.height.mas_offset(LENGTH(30));
        make.width.mas_offset(LENGTH(30));
    }];
    
    [erweimabutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(StatusBar);
        make.height.mas_offset(50);
        make.width.mas_offset(50);
    }];
    
    [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(erweima.mas_bottom).with.offset(LENGTH(13));
        make.left.equalTo(ws).with.offset(LENGTH(11));
        make.height.mas_offset(LENGTH(50));
        make.width.mas_offset(LENGTH(50));
        make.bottom.equalTo(ws).with.offset(-LENGTH(3));

    }];
    
    [touxiangbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->touxiang);
        
    }];
    
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->touxiang.mas_right).with.offset(LENGTH(8));
        make.bottom.mas_equalTo(self->touxiang.mas_centerY).with.offset(-LENGTH(0));
//        make.top.equalTo(self->touxiang.mas_top).with.offset(LENGTH(20));
    }];
    
    [dengji mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->name.mas_bottom).with.offset(LENGTH(10));
        make.left.equalTo(self->touxiang.mas_right).with.offset(LENGTH(8));
        make.top.equalTo(self->name.mas_bottom).with.offset(LENGTH(4));

    }];
    
    
    BaseView * leftview = [BaseView new];
    leftview.backgroundColor = RGBA(255, 255, 255, 0.3);
    leftview.layer.masksToBounds = YES;
    leftview.layer.cornerRadius = LENGTH(5);
    [self addSubview:leftview];
    
    BaseView * rightview = [BaseView new];
    rightview.backgroundColor = RGBA(255, 255, 255, 0.3);
    rightview.layer.masksToBounds = YES;
    rightview.layer.cornerRadius = LENGTH(5);
    [self addSubview:rightview];
    
    FLAnimatedImageView * leftImageView = [FLAnimatedImageView new];
    leftImageView.image = UIIMAGE(@"icon_首页_勋章入口");
    [leftview addSubview:leftImageView];
    
    FLAnimatedImageView * rightImageView = [FLAnimatedImageView new];
    rightImageView.image = UIIMAGE(@"icon_首页_里程碑");
    [rightview addSubview:rightImageView];
    
    leftlabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0,158,165) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@"x5"];
    [leftview addSubview:leftlabel];
    
    rightlabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0,158,165) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@"x50"];
    [rightview addSubview:rightlabel];
    
    BaseButton * xunzhangbutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [xunzhangbutton addTarget:self action:@selector(xunzhangbutton) forControlEvents:UIControlEventTouchUpInside];
    [leftview addSubview:xunzhangbutton];
    
    BaseButton * lichengbeibutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [lichengbeibutton addTarget:self action:@selector(lichengbeibutton) forControlEvents:UIControlEventTouchUpInside];
    [rightview addSubview:lichengbeibutton];
    
    
    [rightview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftview.mas_right).with.offset(LENGTH(14));
        make.right.equalTo(ws).with.offset(-LENGTH(15));
        make.bottom.equalTo(ws).with.offset(-LENGTH(9));
        make.width.mas_equalTo(LENGTH(82));
        make.height.mas_equalTo(LENGTH(38));
        
    }];
    [leftview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(rightview.mas_left).with.offset(-LENGTH(14));
        make.bottom.equalTo(ws).with.offset(-LENGTH(9));
        make.width.mas_equalTo(LENGTH(82));
        make.height.mas_equalTo(LENGTH(38));
    }];
    
    [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftview.mas_left).with.offset(LENGTH(12));
        make.centerY.mas_equalTo(leftview.mas_centerY);
        make.width.mas_equalTo(LENGTH(22.5));
        make.height.mas_equalTo(LENGTH(28));

    }];
    
    [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(rightview.mas_left).with.offset(LENGTH(12));
        make.centerY.mas_equalTo(rightview.mas_centerY);
        make.width.mas_equalTo(LENGTH(23));
        make.height.mas_equalTo(LENGTH(23));
    }];
    
    [leftlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftImageView.mas_right);
        make.right.mas_equalTo(leftview.mas_right);
        make.centerY.mas_equalTo(leftview.mas_centerY);
    }];
    
    [rightlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(rightImageView.mas_right);
        make.right.mas_equalTo(rightview.mas_right);
        make.centerY.mas_equalTo(rightview.mas_centerY);
    }];
    
    [xunzhangbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(leftview);
    }];
    
    [lichengbeibutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(rightview);
    }];
}

#pragma mark - ---------------二维码点击事件
- (void)erweima{
    self.block();
}
#pragma mark - ---------------头像点击事件

- (void)touxiangbutton{
    self.nav.tabBarController.selectedIndex = 3;

}
#pragma mark - ---------------勋章点击事件

- (void)xunzhangbutton{
    MyMedalViewController * vc = [MyMedalViewController new];
    [self.nav pushViewController:vc animated:YES];
}
#pragma mark - ---------------里程碑点击事件

- (void)lichengbeibutton{
    HomeMilestoneViewController * vc = [HomeMilestoneViewController new];
    [self.nav pushViewController:vc animated:YES];
}
#pragma mark xxxxxxxxxxxxxxxxxxx未定
- (void)setModel:(HomeuserModel *)model{
    _model = model;
    UIImage * img;
    if (_model.sex == 1) {
        img = UIIMAGE(ZHANWEITUTXN);
    }else{
        img = UIIMAGE(ZHANWEITUTXV);
    }
    [touxiang sd_setImageWithURL:URLIMAGE(model.avatar) placeholderImage:img];
    if ([model.name isEqualToString:@""]) {
        model.name = @"该用户暂无昵称";
    }
    name.text = model.name;
    dengji.text = [NSString stringWithFormat:@"Lv%@",model.level];
    leftlabel.text = model.badgeNum;
    rightlabel.text = model.milestoneNum;
}
@end
