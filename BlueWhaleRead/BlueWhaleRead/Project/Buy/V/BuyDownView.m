//
//  BuyDownView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/28.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyDownView.h"
#import "BuyInvitationPeopleCollectionView.h"
#define itemWidth LENGTH(32)
#define itemHeight LENGTH(32)
@implementation BuyDownView{
    BaseLabel * label;
    BuyInvitationPeopleCollectionView * collectionView;
    BaseLabel * title;
    BaseLabel * gz;

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
    label = [[BaseLabel alloc] initWithTxteColor:RGB(31,31,31) LabelFont:TextFontCu(13) TextAlignment:NSTextAlignmentLeft Text:@"已邀请人数："];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(10));
        make.left.mas_equalTo(ws).with.offset(LENGTH(27));
    }];
    
    UICollectionViewFlowLayout *flowLayout1 = [[UICollectionViewFlowLayout alloc] init];
    flowLayout1.itemSize = CGSizeMake(itemWidth,itemHeight);
    //    //定义每个UICollectionView 横向的间距
    flowLayout1.minimumLineSpacing = LENGTH(8);
    //    //定义每个UICollectionView 纵向的间距
    flowLayout1.minimumInteritemSpacing = 0;
    //    //定义每个UICollectionView 的边距距
    flowLayout1.sectionInset = UIEdgeInsetsMake(0, LENGTH(9), 0, LENGTH(9));//上左下右
    flowLayout1.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //
    collectionView = [[BuyInvitationPeopleCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout1];
    [self addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->label.mas_right).with.offset(LENGTH(0));
        make.centerY.mas_equalTo(self->label);
        make.right.mas_equalTo(ws).with.offset(LENGTH(0));
        make.height.mas_equalTo(itemHeight);
    }];
    
    title = [[BaseLabel alloc] initWithTxteColor:RGB(31,31,31) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"您已成功邀请1人,再成功邀请1人,可享5折优惠"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->collectionView.mas_bottom).with.offset(LENGTH(8));
        make.left.mas_equalTo(ws).with.offset(LENGTH(27));
    }];
    
    
    gz = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"邀请规则：\n1: 成功邀请2位好友注册可享购买季度会员5折优惠。\n2: 成功邀请5位好友注册即可免费获得季度会员。\n3: 被邀请好友可获得5折购买季度会员权限。"];
    gz.numberOfLines = 0;
    [self addSubview:gz];
    [gz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(6));
        make.left.mas_equalTo(ws).with.offset(LENGTH(30));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(30));
        make.bottom.mas_equalTo(ws);
    }];
}

- (void)setModel:(BuyYaoQingModel *)model{
    _model = model;
    collectionView.itemarray = model.invitedInfoList;
    collectionView.addinter = model.difference_num;
    title.text = model.difference_name;
}
@end
