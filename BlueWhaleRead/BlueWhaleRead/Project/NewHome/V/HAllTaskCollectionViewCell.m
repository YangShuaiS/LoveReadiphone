//
//  HAllTaskCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HAllTaskCollectionViewCell.h"

@implementation HAllTaskCollectionViewCell{
    UIImageView * backimageview;
    BaseLabel * title;
    BaseLabel * lingqu;
    BaseLabel * wancheng;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    backimageview = [UIImageView new];
    backimageview.contentMode = UIViewContentModeScaleAspectFit;
    backimageview.layer.cornerRadius = LENGTH(5);
    backimageview.layer.masksToBounds = YES;
    [self addSubview:backimageview];
    [backimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"中阶读书任务"];
    [backimageview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(ws).with.offset(LENGTH(20));
    }];

    lingqu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:@"1234567人已领取"];
    [backimageview addSubview:lingqu];
    [lingqu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(13));
    }];
    
    wancheng = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:@"1234567人已完成"];
    [backimageview addSubview:wancheng];
    [wancheng mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(self->lingqu.mas_bottom).with.offset(LENGTH(12));
    }];
}

- (void)setModel:(NHmissionListModel *)model{
    _model = model;
    title.text = model.mission_name;
    lingqu.text = [NSString stringWithFormat:@"%@人已领取",model.received_num];
    wancheng.text = [NSString stringWithFormat:@"%@人已完成",model.completed_num];
}

- (void)setInter:(NSInteger)inter{
    _inter = inter;
    if (inter == 0) {
        backimageview.backgroundColor = RGB(108,198,167);
    }else{
        backimageview.backgroundColor = RGB(254,190,122);
    }
}
@end
