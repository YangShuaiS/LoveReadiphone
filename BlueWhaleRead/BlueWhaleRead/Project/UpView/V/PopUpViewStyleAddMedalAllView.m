//
//  PopUpViewStyleAddMedalAllView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PopUpViewStyleAddMedalAllView.h"
#import "JoinDownView.h"

@implementation PopUpViewStyleAddMedalAllView{
    BaseLabel * title;
    JoinDownView * joinDown;
    BaseLabel * subtitle;
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
    FLAnimatedImageView * clickImage = [FLAnimatedImageView new];
    clickImage.image = UIIMAGE(@"icon_弹窗_关闭");
    [self addSubview:clickImage];
    [clickImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(27));
        make.top.mas_equalTo(ws).with.offset(NavHeight+LENGTH(1));
        make.width.mas_equalTo(LENGTH(26));
        make.height.mas_equalTo(LENGTH(26));
    }];
    
    BaseButton * clickButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [clickButton addTarget:self action:@selector(quxiao) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:clickButton];
    [clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(27-15));
        make.top.mas_equalTo(ws).with.offset(NavHeight+LENGTH(0));
        make.width.mas_equalTo(LENGTH(60));
        make.height.mas_equalTo(LENGTH(60));
    }];
    
    BaseView * backView = [BaseView new];
    backView.backgroundColor =RGB(189,225,223);
    backView.layer.masksToBounds = YES;
    backView.layer.cornerRadius = LENGTH(10);
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(36));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(36));
        make.top.mas_equalTo(ws).with.offset(LENGTH(112));
    }];
    
    FLAnimatedImageView * jidan = [FLAnimatedImageView new];
    jidan.image = UIIMAGE(@"icon_弹窗_小鸡");
    [backView addSubview:jidan];
    [jidan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backView).with.offset(LENGTH(20));
        make.centerX.mas_equalTo(backView);
        make.width.mas_equalTo(LENGTH(62));
        make.height.mas_equalTo(LENGTH(88));
    }];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(35,100,96) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"你已经把人文勋章指定的20本书全部加入书架了"];
    title.numberOfLines = 0;
    [backView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(jidan.mas_bottom).with.offset(LENGTH(12));
        make.left.mas_equalTo(backView);
        make.right.mas_equalTo(backView);
    }];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(92,135,133) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"去读完它们吧！\n全部答题正确就可以点亮人文勋章了"];
    subtitle.numberOfLines = 0;
    [backView addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(18));
        make.left.mas_equalTo(backView);
        make.right.mas_equalTo(backView);
    }];
    
    FLAnimatedImageView * KS = [FLAnimatedImageView new];
    KS.image = [UIImage imageNamed:@"bt_弹窗"];
    [backView addSubview:KS];
    [KS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(backView);
        make.top.mas_equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(24));
        make.bottom.mas_equalTo(backView.mas_bottom).with.offset(-LENGTH(32));
        make.width.mas_equalTo(LENGTH(150));
        make.height.mas_equalTo(LENGTH(38));
    }];
    
    BaseLabel * KSLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(57,54,57) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"知道了"];
    [KS addSubview:KSLabel];
    [KSLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(KS);
    }];
    KS.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [KS addGestureRecognizer:tap];
    
    joinDown = [JoinDownView new];
//    _joinDown.itemarray = _itemarray;
    [self addSubview:joinDown];
    [joinDown mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(0);
        make.right.mas_equalTo(ws).with.offset(0);
        make.top.mas_equalTo(backView.mas_bottom).with.offset(LENGTH(44));
        make.height.mas_equalTo(LENGTH(56));
    }];
}
- (void)setModel:(GenPopViewModel *)model{
    _model = model;
    title.text = [NSString stringWithFormat:@"你已经把%@指定的%.0f本书全部加入书架了",model.title,model.studentCompletedNum];
    subtitle.text = [NSString stringWithFormat:@"去读完它们吧！\n全部答题正确就可以点亮%@了",model.title];
    joinDown.nav = self.nav;
    joinDown.models = model.model;
    joinDown.itemarray = model.itemarray;
}
- (void)tap{
    self.block(PopUpViewClickStyleRemo);
}
- (void)quxiao{
    self.block(PopUpViewClickStyleRemo);
}
@end
