//
//  NewTFameViewTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/28.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NewTFameViewTableViewCell.h"

@implementation NewTFameViewTableViewCell{
    UIImageView * leftimageview;
    BaseLabel * pm;
    UIImageView * userimageview;
    BaseLabel * name;
    BaseLabel * fenshu;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    leftimageview = [UIImageView new];
    leftimageview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:leftimageview];
    [leftimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(25));
        make.centerY.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(28));
        make.height.mas_equalTo(LENGTH(41));
    }];
    leftimageview.hidden = YES;
    
    pm = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(150,150,150) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"暂无排名"];
    [self addSubview:pm];
    [pm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(15));
        make.centerY.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(48));
    }];
    
    userimageview = [UIImageView new];
    userimageview.backgroundColor = RGB(150,150,150);
    userimageview.layer.cornerRadius = LENGTH(17);
    userimageview.layer.masksToBounds = YES;
    [self addSubview:userimageview];
    [userimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(LENGTH(15));
        make.bottom.mas_equalTo(-LENGTH(15));
        make.width.and.height.mas_equalTo(LENGTH(34));
        make.left.mas_equalTo(ws).with.offset(LENGTH(113));
    }];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0,0,0) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"姓名"];
    [self addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->userimageview.mas_right).with.offset(LENGTH(10));
        make.centerY.mas_equalTo(ws);
    }];
    
    fenshu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0,0,0) LabelFont:TextFontCu(17) TextAlignment:NSTextAlignmentLeft Text:@"暂无分数"];
    [self addSubview:fenshu];
    [fenshu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(298));
        make.centerY.mas_equalTo(ws);
    }];
}


- (void)setModel:(TFVUserModel *)model{
    _model = model;
    if ([_type isEqualToString:@"1"]) {
        if (_inter == 0) {
            [self uplefy:[model.myRank integerValue]];
            fenshu.text = [NSString stringWithFormat:@"%@",model.mission_score];
        }else{
            [self uplefy:_inter];
            fenshu.text = [NSString stringWithFormat:@"%@",model.score];
        }
    }else{
        [self uplefy:_inter+1];
        fenshu.text = [NSString stringWithFormat:@"%@",model.score];
    }
    [userimageview sd_setImageWithURL:URLIMAGE(model.avatar)];
    name.text = model.name;
}

- (void)uplefy:(NSInteger)paiming{
    if (paiming == 1 || paiming ==2 || paiming == 3) {
        leftimageview.hidden = NO;
        pm.hidden = YES;
        if (paiming == 1) {
            leftimageview.image = UIIMAGE(@"1");
        }else if (paiming == 2){
            leftimageview.image = UIIMAGE(@"2");
        }else if (paiming == 3){
            leftimageview.image = UIIMAGE(@"3");
        }
    }else{
        leftimageview.hidden = YES;
        pm.hidden = NO;
        pm.text = [NSString stringWithFormat:@"%ld",paiming];
    }

}
@end
