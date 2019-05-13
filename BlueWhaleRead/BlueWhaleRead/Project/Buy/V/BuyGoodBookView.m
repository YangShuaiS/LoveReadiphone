//
//  BuyGoodBookView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/25.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyGoodBookView.h"
#import "HomeModerateCollectView.h"
#define itemHeight1 LENGTH(170)+LENGTH(19)

@implementation BuyGoodBookView{
    HomeModerateCollectView * collectView1;
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
    self.backgroundColor = [UIColor whiteColor];
    BaseLabel * hytc = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFontCu(17) TextAlignment:NSTextAlignmentCenter Text:@"精选好书"];
    [self addSubview:hytc];
    [hytc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(ws).with.offset(LENGTH(30));
    }];
    
    UIImageView * lefthg = [UIImageView new];
    lefthg.contentMode = UIViewContentModeScaleAspectFit;
    lefthg.image = UIIMAGE(@"皇冠");
    [self addSubview:lefthg];
    [lefthg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(hytc);
        make.right.mas_equalTo(hytc.mas_left).with.offset(-LENGTH(6));
        make.size.mas_equalTo(CGSizeMake(LENGTH(21), LENGTH(13)));
    }];
    
    UIImageView * righthg = [UIImageView new];
    righthg.contentMode = UIViewContentModeScaleAspectFit;
    righthg.image = UIIMAGE(@"皇冠");
    [self addSubview:righthg];
    [righthg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(hytc);
        make.left.mas_equalTo(hytc.mas_right).with.offset(LENGTH(6));
        make.size.mas_equalTo(CGSizeMake(LENGTH(21), LENGTH(13)));
    }];
    
    BaseLabel * subtitlelabel = [[BaseLabel alloc] initWithTxteColor:RGB(135,135,135) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"博万卷根据百所学校推荐书单，总结整理出适合您的图书，\n成为会员可免费阅读。"];
    subtitlelabel.numberOfLines = 0;
    [self addSubview:subtitlelabel];
    [subtitlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(hytc.mas_bottom).with.offset(LENGTH(10));
        make.left.mas_equalTo(ws).with.offset(LENGTH(27));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(27));
    }];
    
    UICollectionViewFlowLayout *flowLayout1 = [[UICollectionViewFlowLayout alloc] init];
    flowLayout1.itemSize = CGSizeMake((WIDTH - LENGTH(13)*2 -LENGTH(24)*2)/3,itemHeight1);
    //定义每个UICollectionView 横向的间距
    flowLayout1.minimumLineSpacing = LENGTH(0);
    //定义每个UICollectionView 纵向的间距
    flowLayout1.minimumInteritemSpacing = LENGTH(0);
    //定义每个UICollectionView 的边距距
    flowLayout1.sectionInset = UIEdgeInsetsMake(LENGTH(5), LENGTH(24), 0, LENGTH(24));//上左下右
    flowLayout1.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView1 = [[HomeModerateCollectView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout1];
    collectView1.foundinter = 6;
    [self addSubview:collectView1];
    [collectView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(subtitlelabel.mas_bottom).with.offset(LENGTH(5));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(LENGTH(10));
    }];
    collectView1.userInteractionEnabled = NO;
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    collectView1.itemarray = itemarray;
    collectView1.starehiden = 3;
}
@end
