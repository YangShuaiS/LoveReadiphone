//
//  BuyRecommendedView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/25.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyRecommendedView.h"
#import "NKRRecommendedCollectionView.h"
#import "HomeModerateCollectView.h"
#define itemWidth LENGTH(163)
//#define itemHeight LENGTH(162*0.610561)+LENGTH(15)+LENGTH(20)+LENGTH(5)+LENGTH(16)
#define itemHeight LENGTH(163)*0.552147+LENGTH(10)+LENGTH(14)+LENGTH(3)+LENGTH(12)

#define itemHeight1 LENGTH(163)*1.423312+LENGTH(10)+LENGTH(14)+LENGTH(3)+LENGTH(12)

@implementation BuyRecommendedView{
    NKRRecommendedCollectionView * collectView;
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
    BaseLabel * hytc = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFontCu(17) TextAlignment:NSTextAlignmentCenter Text:@"大咖推荐"];
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
    
    BaseLabel * subtitlelabel = [[BaseLabel alloc] initWithTxteColor:RGB(135,135,135) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"世界是你们的，也是我们的，\n但是归根结底是你们年轻人的。"];
    subtitlelabel.numberOfLines = 0;
    [self addSubview:subtitlelabel];
    [subtitlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(hytc.mas_bottom).with.offset(LENGTH(10));
        make.left.mas_equalTo(ws).with.offset(LENGTH(27));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(27));
    }];
    
    UIImage * images = UIIMAGE(@"俞敏洪");
    UIImageView * imageView = [UIImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = images;
    CGFloat imhei = (WIDTH - LENGTH(34))/images.size.width*1.0*images.size.height;
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(subtitlelabel.mas_bottom).with.offset(LENGTH(10));
        make.left.mas_equalTo(ws).with.offset(LENGTH(17));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
        make.height.mas_equalTo(imhei);
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
    //    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(15);
    //    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = 0;
    //    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(17), 0, LENGTH(17));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[NKRRecommendedCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    collectView.style = 3;
    collectView.allinter = 2;
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(0));
        make.top.equalTo(imageView.mas_bottom).with.offset(LENGTH(5));
        make.right.equalTo(ws).with.offset(LENGTH(0));
        make.height.mas_equalTo(itemHeight);
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
    collectView1.foundinter = 3;
    [self addSubview:collectView1];
    [collectView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(self->collectView.mas_bottom).with.offset(LENGTH(5));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(-LENGTH(10));
    }];
    collectView.userInteractionEnabled = NO;
    collectView1.userInteractionEnabled = NO;
    
}
- (void)setModel:(BuyAllModel *)model{
    _model = model;
    collectView.itemarray = model.yuBannerList;
    collectView1.itemarray = model.yuBookList;
    collectView1.starehiden = 3;
}
@end
