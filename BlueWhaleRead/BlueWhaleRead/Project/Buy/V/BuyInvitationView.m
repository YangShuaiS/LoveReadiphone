//
//  BuyInvitationView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/25.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyInvitationView.h"
#import "BuyInvitationPeopleCollectionView.h"
#define itemWidth LENGTH(32)
#define itemHeight LENGTH(32)
@implementation BuyInvitationView{
    BaseLabel * label;
    BuyInvitationPeopleCollectionView * collectionView;
    BaseLabel * title;
    UIImageView * xfimage;
    BuyYaoQingModel * yaoqing;
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
    
    xfimage = [UIImageView new];
    xfimage.contentMode = UIViewContentModeScaleAspectFit;
    xfimage.layer.masksToBounds = YES;
    xfimage.layer.cornerRadius = LENGTH(6);
    xfimage.layer.borderWidth = 1;
    xfimage.layer.borderColor = RGB(160, 160, 160).CGColor;
    [self addSubview:xfimage];
    [xfimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(66));
        make.left.mas_equalTo(ws).with.offset(LENGTH(27));
        make.size.mas_equalTo(CGSizeMake(LENGTH(12), LENGTH(12)));
    }];
    
    BaseLabel * zdxf = [[BaseLabel alloc] initWithTxteColor:RGB(150,150,150) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@"自动续费，可随时取消"];
    [self addSubview:zdxf];
    [zdxf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->xfimage);
        make.left.mas_equalTo(self->xfimage.mas_right).with.offset(LENGTH(5));
    }];
    
    UIView * clickView = [UIView new];
    [self addSubview:clickView];
    [clickView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(zdxf);
        make.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(30));
    }];
    clickView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [clickView addGestureRecognizer:tap];
    
    BaseLabel * xytitle = [[BaseLabel alloc] initWithTxteColor:RGB(31,31,31) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@"自动续费服务声明"];
    [self addSubview:xytitle];
    [xytitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(27));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(27));
        make.top.mas_equalTo(zdxf.mas_bottom).with.offset(LENGTH(8));
    }];
    
    BaseLabel * xfgz = [[BaseLabel alloc] initWithTxteColor:RGB(150,150,150) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@"付款:用户确认购买并付款后记入iTunes账户;\n取消续订:如需取消续订，请在当前订阅周期到期前24小时以前，手动在iTunes/AppleID设置管理中关闭自动续费功能，到期前24小时内取消，将会收取订阅费用;\n续费:苹果iTunes账户会在到期前24小时内扣费，扣费成功后订阅周期顺延一个订阅周期。"];
    xfgz.numberOfLines = 0;
    [self addSubview:xfgz];
    [xfgz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(27));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(27));
        make.top.mas_equalTo(xytitle.mas_bottom).with.offset(LENGTH(3));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(25));
    }];
    

}
- (void)click{
    if (xfimage.layer.borderWidth == 1) {
        xfimage.layer.borderWidth = 0;
        xfimage.image = UIIMAGE(@"续费-选择");
        self.blocks(1);
    }else{
        xfimage.layer.borderWidth = 1;
        xfimage.image = UIIMAGE(@"");
        self.blocks(0);
    }
}

- (void)setPackage:(BuyPackage *)package{
    _package = package;
    WS(ws);
    if (package.price_times == 3) {
        PackageTypeModel * mo = _model.productInfoIos[0];
        yaoqing = mo.studentInvitedInfo;
    }else{
        PackageTypeModel * mo = _model.productInfoIos[1];
        yaoqing = mo.studentInvitedInfo;
    }
    if ([yaoqing isKindOfClass:NSClassFromString(@"BuyYaoQingModel")]) {
        label.hidden = NO;
        collectionView.hidden = NO;
        title.hidden = NO;
        [xfimage mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ws).with.offset(LENGTH(66));
        }];
        collectionView.addinter = yaoqing.difference_num;
        collectionView.itemarray = yaoqing.invitedStudentList;
        title.text = yaoqing.difference_name;
    }else{
        label.hidden = YES;
        collectionView.hidden = YES;
        title.hidden = YES;
        [xfimage mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ws).with.offset(LENGTH(10));
        }];
    }
}
@end
