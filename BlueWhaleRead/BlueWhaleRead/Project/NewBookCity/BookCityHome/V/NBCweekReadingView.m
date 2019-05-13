//
//  NBCweekReadingView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBCweekReadingView.h"
//#import "NBCmenuView.h"
#import "NBCMoreWeekViewController.h"
#import "NBCThemeViewController.h"
@implementation NBCweekReadingView

{
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
//
//    NBCmenuView * menu = [NBCmenuView new];
//    menu.label.text = @"本周精读";
//    menu.styles = NBCmenuViewStyleimage;
//    [self addSubview:menu];
//    [menu mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.and.left.and.right.mas_equalTo(ws);
//    }];
//    [menu setBlock:^{
//        [ws push];
//    }];
    
    imageview = [UIImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.left.mas_equalTo(ws).with.offset(LENGTH(17));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
        make.bottom.mas_equalTo(-LENGTH(14));
        make.height.mas_equalTo(LENGTH(110));
    }];
    imageview.layer.masksToBounds = YES;
    imageview.layer.cornerRadius = LENGTH(10);
    imageview.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backview)];
    //将手势添加到需要相应的view中去
    [imageview addGestureRecognizer:tapviewtap];
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.itemSize = CGSizeMake(LENGTH(332),LENGTH(108));
//    //定义每个UICollectionView 横向的间距
//    flowLayout.minimumLineSpacing = LENGTH(12);
//    //定义每个UICollectionView 纵向的间距
//    flowLayout.minimumInteritemSpacing = 0;
//    //定义每个UICollectionView 的边距距
//    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(22), 0, LENGTH(22));//上左下右
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//
//    nfcc = [[NBCchannelCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
////    nfcc.pagingEnabled = YES;
//    nfcc.more = NO;
//    nfcc.zt = NO;
//    nfcc.decelerationRate = UIScrollViewDecelerationRateNormal;
//
//    [self addSubview:nfcc];
//    [nfcc mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(ws).with.offset(0);
//        make.top.equalTo(menu.mas_bottom).with.offset(LENGTH(10));
//        make.right.equalTo(ws).with.offset(0);
//        make.bottom.equalTo(ws).with.offset(-LENGTH(14));
//        make.height.mas_equalTo(LENGTH(108)+LENGTH(14)+LENGTH(14));
//    }];
}

- (void)push{
    NBCMoreWeekViewController * vc = [NBCMoreWeekViewController new];
    [self.nav pushViewController:vc animated:YES];
}

- (void)backview{
    NBCclassificationModel * model = _model.themeWeek[0];
    NBCThemeViewController * vc = [NBCThemeViewController new];
    vc.bannerid = model.ssid;
    vc.imageurl = [NSString stringWithFormat:@"%@%@",IMAGEURL,model.banner_img];
    [self.nav pushViewController:vc animated:YES];
}
- (void)setModel:(NBCALLModel *)model{
    _model = model;
    NSMutableArray * array = model.themeWeek;
    if (array.count>0) {
        NBCclassificationModel * mo = array[0];
        [imageview sd_setImageWithURL:URLIMAGE(mo.banner_img)];
    }

}
@end
