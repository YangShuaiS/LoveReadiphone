//
//  FoundClass.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundClass.h"

@implementation FoundClass

{
    FLAnimatedImageView * userImageview;
    BaseLabel * name;
    BaseLabel * xunzhang;
    
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    userImageview = [FLAnimatedImageView new];
    userImageview.backgroundColor = RANDOMCOLOR;
    userImageview.layer.masksToBounds = YES;
    userImageview.layer.cornerRadius = LENGTH(35);
    [self addSubview:userImageview];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font16) TextAlignment:NSTextAlignmentLeft Text:@""];
    //    name.adjustsFontSizeToFitWidth = YES;
    
    [self addSubview:name];
    
    xunzhang = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font15) TextAlignment:NSTextAlignmentLeft Text:@"勋章"];
    
    [self addSubview:xunzhang];
    
    WS(ws);
    [userImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(30));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(70));
        make.height.mas_equalTo(LENGTH(70));
    }];
    
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->userImageview.mas_bottom).with.offset(LENGTH(22));
        make.centerX.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(14));
    }];
    
    [xunzhang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->name.mas_bottom).with.offset(LENGTH(20));
        make.centerX.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(16));
        
    }];
    
}
- (void)setModel:(FoundbadgeRankModel *)model{
    _model = model;
    name.text = model.name;
    xunzhang.text = [NSString stringWithFormat:@"勋章%@枚",model.badges];
    [userImageview sd_setImageWithURL:URLIMAGE(model.avatar) placeholderImage:UIIMAGE(ZHANWEITUTX)];
}

@end
