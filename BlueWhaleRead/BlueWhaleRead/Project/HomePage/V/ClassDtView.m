//
//  ClassDtView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ClassDtView.h"

@implementation ClassDtView{
    FLAnimatedImageView * userImageView;
    BaseLabel * xz;
    BaseLabel * toptime;
    BaseLabel * downtime;

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
    self.backgroundColor = WhitColor;
    WS(ws);
    userImageView = [FLAnimatedImageView new];
    userImageView.image = UIIMAGE(ZHANWEITUTX);
    userImageView.layer.masksToBounds = YES;
    userImageView.layer.cornerRadius = LENGTH(30)/2;
    [self addSubview:userImageView];
    [userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(15));
        make.top.mas_equalTo(ws).with.offset(LENGTH(5));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(9));
        make.width.mas_equalTo(LENGTH(30));
        make.height.mas_equalTo(LENGTH(30));
    }];
    
    xz = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"张小祁刚刚认领了“勤奋之星”勋章"];
    [self addSubview:xz];
    [xz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.left.mas_equalTo(self->userImageView.mas_right).with.offset(LENGTH(15));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(90));
    }];

    toptime = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@"2018-05-04"];
    [self addSubview:toptime];
    [toptime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(8.5));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(8.5));
    }];

    downtime = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(11) TextAlignment:NSTextAlignmentRight Text:@"07:00"];
    [self addSubview:downtime];
    [downtime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(8.5));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(7));

    }];
}

- (void)setModel:(DynamicListModel *)model{
    _model = model;
    UIImage * img;
    if (model.sex == 1) {
        img = UIIMAGE(ZHANWEITUTXN);
    }else{
        img = UIIMAGE(ZHANWEITUTXV);
    }
    [userImageView sd_setImageWithURL:URLIMAGE(model.avatar) placeholderImage:img];
    
    if ([model.dynamic.milestone isEqualToString:@""]) {
        xz.text = [NSString stringWithFormat:@"%@刚刚完成了""%@""勋章",model.name,model.dynamic.name];
    }else{
        xz.text = [NSString stringWithFormat:@"%@刚刚完成了第%@个里程碑",model.name,model.dynamic.milestone];
    }
    toptime.text = [BaseObject TiemArray:model.dynamic.create_time String:@" "][0];
    downtime.text = [BaseObject TiemArray:model.dynamic.create_time String:@" "][1];

}
@end
