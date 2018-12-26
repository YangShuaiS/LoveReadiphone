//
//  TPHBView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TPHBView.h"

@implementation TPHBView{
    BaseLabel * pm;
    UIImageView * userimageview;
    BaseLabel * name;
    BaseLabel * fenshu;

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
    pm = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(171,87,4) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"99"];
    [self addSubview:pm];
    [pm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(13));
        make.centerY.mas_equalTo(ws);
    }];
    
    userimageview = [UIImageView new];
    userimageview.backgroundColor = RANDOMCOLOR;
    userimageview.layer.cornerRadius = LENGTH(23);
    userimageview.layer.masksToBounds = YES;
    [self addSubview:userimageview];
    [userimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(LENGTH(7));
        make.bottom.mas_equalTo(-LENGTH(7));
        make.width.and.height.mas_equalTo(LENGTH(46));
        make.left.mas_equalTo(ws).with.offset(LENGTH(36));
    }];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(59,59,59) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"杨树林"];
    [self addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->userimageview.mas_right).with.offset(LENGTH(5));
        make.centerY.mas_equalTo(ws);
    }];
    
    fenshu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(171,87,4) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"分数：586"];
    [self addSubview:fenshu];
    [fenshu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.mas_right).with.offset(-LENGTH(75));
        make.centerY.mas_equalTo(ws);
    }];
}
- (void)setModel:(TFVUserModel *)model{
    _model = model;
    if (_inter == 0) {
        pm.text = model.myRank;
        fenshu.text = [NSString stringWithFormat:@"分数：%@",model.mission_score];

    }else{
        pm.text = [NSString stringWithFormat:@"%ld",_inter];
        fenshu.text = [NSString stringWithFormat:@"分数：%@",model.score];

    }
    [userimageview sd_setImageWithURL:URLIMAGE(model.avatar)];
    name.text = model.name;
}
@end
