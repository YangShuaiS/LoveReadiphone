//
//  MingShiDDView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MingShiDDView.h"

@implementation MingShiDDView{
    BaseLabel * name;
    BaseLabel * school;
    BaseLabel * classsch;
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
//    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(129,94,29) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentLeft Text:@"名字"];
//    [self addSubview:name];
//
//    [name mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(ws).with.offset(LENGTH(32));
//        make.top.equalTo(ws).with.offset(LENGTH(26));
//    }];

//    school = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(172,136,69) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentLeft Text:@"北京市巴巴巴巴小学  二年级"];
//    [self addSubview:school];
//
//    [school mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self->name.mas_right).with.offset(LENGTH(24));
//        make.top.equalTo(ws).with.offset(LENGTH(28));
//    }];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@""];
    subtitle.numberOfLines = 4;
    [self addSubview:subtitle];
    
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(11));
        make.right.equalTo(ws).with.offset(-LENGTH(11));
        make.top.equalTo(ws).with.offset(LENGTH(11));
    }];
    
    sanjiao = [FLAnimatedImageView new];
    sanjiao.image = UIIMAGE(@"icon_读后感_展开");
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
        make.width.mas_equalTo(LENGTH(100));
    }];
    
    djsanjiao.userInteractionEnabled = YES;
        //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
        //将手势添加到需要相应的view中去
    [djsanjiao addGestureRecognizer:tapGesture1];
    
}

- (void)setModel:(BookXQReadThoughtModel *)model{
    _model = model;
    name.text = model.author;
//    LV.text = [NSString stringWithFormat:@"%@",model.level];
    school.text = model.author_info;//还有
    subtitle.text = model.content;
    
    sanjiao.image = _model.cellstyle==1?UIIMAGE(@"icon_读后感_展开_收起"):UIIMAGE(@"icon_读后感_展开");
    if (_model.cellstyle == 1) {
        subtitle.numberOfLines = 0;
    }else{
        subtitle.numberOfLines = 4;
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect frame = subtitle.frame;
    frame.size.height = frame.size.height;
    subtitle.frame = frame;
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
@end
