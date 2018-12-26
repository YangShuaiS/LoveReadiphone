//
//  TKIssueTwoView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKIssueTwoView.h"
#import "TKIssueCollectionView.h"

@implementation TKIssueTwoView{
    TKIssueCollectionView *collectview;
    UIImageView * imageview;
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
    self.backgroundColor =  RGB(238, 238, 238);
    
    UIView * bakview = [UIView new];
    bakview.backgroundColor = RGB(255, 255, 255);
    [self addSubview:bakview];
    [bakview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(0, LENGTH(15), LENGTH(5), LENGTH(15)));
    }];
    
    UIView * v = [UIView new];
    v.backgroundColor = RGB(238,238,238);
    v.layer.cornerRadius = LENGTH(5);
    v.layer.masksToBounds = YES;
    [bakview addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(LENGTH(18));
        make.bottom.mas_equalTo(-LENGTH(18));
        make.width.mas_equalTo(LENGTH(2));
        make.left.mas_equalTo(bakview).with.offset(LENGTH(114));
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(LENGTH(60),LENGTH(87));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(14);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(0);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(4), LENGTH(0), LENGTH(16), LENGTH(0));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectview = [[TKIssueCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    collectview.decelerationRate = UIScrollViewDecelerationRateNormal;
    collectview.layer.cornerRadius = LENGTH(5);
    collectview.layer.masksToBounds = YES;
    [bakview addSubview:collectview];
    [collectview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bakview);
        make.right.mas_equalTo(bakview);
        make.bottom.mas_equalTo(bakview);
        make.left.mas_equalTo(v.mas_right).with.offset(LENGTH(24));
        make.height.mas_equalTo(LENGTH(87)+LENGTH(20));
    }];
    
    imageview = [UIImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    [bakview addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(bakview).with.offset(LENGTH(12));
        make.right.mas_equalTo(v.mas_left).with.offset(-LENGTH(10));
        make.top.mas_equalTo(bakview).with.offset(LENGTH(10));
        make.bottom.mas_equalTo(bakview).with.offset(-LENGTH(10));
    }];
}

- (void)setModel:(TKPWQpastLottery1InfoModel *)model{
    _model = model;
    collectview.model = model;
    CGFloat i = ceilf(model.studentList.count/3.0);
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(LENGTH(87)*i+LENGTH(14)*(i-1)+LENGTH(20));
    }];
    [imageview sd_setImageWithURL:URLIMAGE(model.prize_img)];

}
@end
