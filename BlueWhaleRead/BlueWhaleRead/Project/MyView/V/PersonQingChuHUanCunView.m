//
//  PersonQingChuHUanCunView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PersonQingChuHUanCunView.h"

@implementation PersonQingChuHUanCunView{
    BaseLabel * quxiao;
    BaseLabel * qingchu;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    self.userInteractionEnabled = YES;
    BaseView * backView = [BaseView new];
    backView.backgroundColor = RGBA(0, 0, 0, 0.4);
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    quxiao = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(153,153,153) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"取消"];
    quxiao.backgroundColor = [UIColor whiteColor];
    [self addSubview:quxiao];
    [quxiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws).with.offset(LENGTH(0));
        make.left.mas_equalTo(ws).with.offset(LENGTH(0));
        make.right.mas_equalTo(ws).with.offset(LENGTH(0));
        make.height.mas_equalTo(LENGTH(74));
    }];
    quxiao.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(quxiao:)];
    [quxiao addGestureRecognizer:tapGesturRecognizer];
    
    
    qingchu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"确定清除缓存"];
    qingchu.backgroundColor = [UIColor whiteColor];
    [self addSubview:qingchu];
    [qingchu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self->quxiao.mas_top).with.offset(-1);
        make.left.mas_equalTo(ws).with.offset(LENGTH(0));
        make.right.mas_equalTo(ws).with.offset(LENGTH(0));
        make.height.mas_equalTo(LENGTH(74));
    }];
    qingchu.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesturRecognizer1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(qingchu:)];
    [qingchu addGestureRecognizer:tapGesturRecognizer1];

}
- (void)xuaoshi{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
- (void)quxiao:(UITapGestureRecognizer *)tap{
    [self xuaoshi];
}
- (void)qingchu:(UITapGestureRecognizer *)tap{
    [self xuaoshi];
    self.block();
}
@end
