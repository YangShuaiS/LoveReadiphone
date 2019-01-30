//
//  YouXiuShuPingView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "YouXiuShuPingView.h"

@implementation YouXiuShuPingView

{
    BaseLabel * subtitle;
    FLAnimatedImageView* sanjiao;
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

    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(129,94,29) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@""];
    subtitle.numberOfLines = 4;
    [self addSubview:subtitle];

    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(11));
        make.right.equalTo(ws).with.offset(-LENGTH(11));
        make.top.equalTo(ws).with.offset(LENGTH(5));
    }];
    
    sanjiao = [FLAnimatedImageView new];
    sanjiao.image = UIIMAGE(@"icon_文章_下箭头收起");
    [self addSubview:sanjiao];
    
    [sanjiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(3));
        make.bottom.equalTo(ws).with.offset(-LENGTH(9));
        make.width.mas_equalTo(LENGTH(12));
        make.height.mas_equalTo(LENGTH(7));
        
    }];
    
    BaseView * djsanjiao = [BaseView new];
    [self addSubview:djsanjiao];
    [djsanjiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.bottom.equalTo(ws).with.offset(-LENGTH(0));
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(0));
        make.width.mas_equalTo(LENGTH(200));
    }];
    
    djsanjiao.userInteractionEnabled = YES;
    //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
    //将手势添加到需要相应的view中去
    [djsanjiao addGestureRecognizer:tapGesture1];
    
}
- (void)setModel:(BookXQBookReview *)model{
    _model = model;
    subtitle.text = model.content;
    sanjiao.image = _model.cellstyle==1?UIIMAGE(@"icon_读后感_展开_收起"):UIIMAGE(@"icon_读后感_展开");
    if (_model.cellstyle == 1) {
        subtitle.numberOfLines = 0;
    }else{
        subtitle.numberOfLines = 4;
    }
}

- (void)tapGesture1{
    sanjiao.image = _model.cellstyle==1?UIIMAGE(@"icon_读后感_展开"):UIIMAGE(@"icon_读后感_展开_收起");
    if (_model.cellstyle == 1) {
        subtitle.numberOfLines = 4;
        _model.cellstyle = 0;
    }else{
        subtitle.numberOfLines = 0;
        _model.cellstyle = 1;
    }
    self.block();
}
- (void)layoutSubviews{
    [super layoutSubviews];
//    CGRect frame = self.frame;
//    frame.size.height = frame.size.height;
//    subtitle.frame = frame;
}
@end
