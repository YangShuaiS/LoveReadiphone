//
//  JoinDownView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "JoinDownView.h"
#import "MedalChooseABookCollectionView.h"
#import "JInDuHeadImage.h"
#import "MyMedalViewController.h"
#import "GeneralMedalView.h"
@implementation JoinDownView{
//    JInDuHeadImage * MyImage;
    BaseLabel * myMedal;
    MedalChooseABookCollectionView * BookList;
    GeneralMedalView * MedalView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addView];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addView];
    }
    return self;
}
- (void)addView{
    WS(ws);
    if (MedalView == nil) {
        _itemarray = [NSMutableArray array];
        
        MedalView = [GeneralMedalView new];
        MedalView.userInteractionEnabled = YES;
        [self addSubview:MedalView];
        [MedalView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ws).with.offset(LENGTH(14));
            make.top.mas_equalTo(ws).with.offset(LENGTH(7));
            make.width.mas_equalTo(LENGTH(36));
            make.height.mas_equalTo(LENGTH(36));
        }];
        
//        MyImage = [JInDuHeadImage new];
//        MyImage.userInteractionEnabled = YES;
//        MyImage.touxiang.image = UIIMAGE(ZHANWEITUXZ);
//        MyImage.progress = 1;//进度
//        [self addSubview:MyImage];
//        [MyImage mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(ws).with.offset(LENGTH(52));
//            make.top.mas_equalTo(ws).with.offset(LENGTH(7));
//            make.width.mas_equalTo(LENGTH(60));
//            make.height.mas_equalTo(LENGTH(60));
//        }];
        
        
        myMedal = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(252,244,140) LabelFont:TextFont(10) TextAlignment:NSTextAlignmentCenter Text:@"我的勋章"];
        [self addSubview:myMedal];
        [myMedal mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->MedalView.mas_bottom).with.offset(LENGTH(0));
            make.centerX.mas_equalTo(self->MedalView.mas_centerX);
//            make.bottom.mas_equalTo(ws).with.offset(-LENGTH(4));
        }];
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(LENGTH(35),LENGTH(41));
        //    //定义每个UICollectionView 横向的间距
        flowLayout.minimumLineSpacing = LENGTH(4);
        //    //定义每个UICollectionView 纵向的间距
        flowLayout.minimumInteritemSpacing = LENGTH(4);
        //    //定义每个UICollectionView 的边距距
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        BookList = [[MedalChooseABookCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
        [self addSubview:BookList];
        [BookList mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(ws.mas_centerY);
            make.left.mas_equalTo(self->MedalView.mas_right).with.offset(LENGTH(8));
            make.right.mas_equalTo(ws.mas_right).with.offset(-LENGTH(12));
            make.height.mas_equalTo(LENGTH(63));
        }];
        [BookList setBlock:^{
            ws.block();
        }];
        
        
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wodexunzhang)];
        [MedalView addGestureRecognizer:tap];
    }
}

- (void)wodexunzhang{
    NSArray * contarray = self.nav.view.subviews;
    for (int i =0; i < contarray.count; i++) {
        UIView *controller = contarray[i];
        if ([controller isKindOfClass:[GeneralUpView class]]) {
            [controller removeFromSuperview];
        }
    }
    
    MyMedalViewController * vc = [MyMedalViewController new];
    [self.nav pushViewController:vc animated:YES];
}
- (void)setModel:(AllBookListModel *)model{
    _model = model;
    [_itemarray addObject:model];
    BookList.nav = self.nav;
    BookList.itemArray = _itemarray;
    
    
//    CGFloat f = 1-1.000000001*_itemarray.count/_models.studentCompletedNum;
//    MyImage.progress = f;//进度
}

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    BookList.nav = self.nav;
    MedalListBadgeInfoModel * mo = _models.badgeInfo;
    BookList.Booknumber = mo.task_num;
    BookList.itemArray = _itemarray;
    CGFloat f = 1-1.000000001*_models.studentCompletedNum/mo.task_num;

    MedalView.floatjidu = f;
//    MyImage.progress = f;//进度

}
- (void)setStylejia:(NSInteger)stylejia{
    _stylejia = stylejia;
    BookList.stylejia = stylejia;

}
- (void)setModels:(MedalListXqModel *)models{
    _models = models;
    MedalListBadgeInfoModel * mo = models.badgeInfo;
    MedalView.images = mo.logo;
//    [MyImage.touxiang sd_setImageWithURL:URLIMAGE(mo.logo) placeholderImage:UIIMAGE(ZHANWEITUXZ)];
}
- (void)setDtjgmodel:(TKJIEGUOMODEL *)dtjgmodel{
    _dtjgmodel = dtjgmodel;
    BookList.nav = self.nav;
    MedalView.images = dtjgmodel.badgeMinLogo;

//    [MyImage.touxiang sd_setImageWithURL:URLIMAGE(dtjgmodel.badgeMinLogo) placeholderImage:UIIMAGE(ZHANWEITUXZ)];
    BookList.Booknumber = dtjgmodel.badgeNum;
    BookList.itemArray = dtjgmodel.badgeBooks;
    CGFloat f = 1-1.000000001*dtjgmodel.studentBadgeNum/dtjgmodel.badgeNum;
    MedalView.floatjidu = f;//进度
}
- (void)setJoinmodel:(JoinBookModel *)joinmodel{
    _joinmodel = joinmodel;
    BookList.nav = self.nav;
    MedalView.images = joinmodel.bookBadge.badgeinfo.min_logo;

//    [MyImage.touxiang sd_setImageWithURL:URLIMAGE(joinmodel.bookBadge.badgeinfo.min_logo) placeholderImage:UIIMAGE(ZHANWEITUXZ)];
    BookList.Booknumber = joinmodel.bookBadge.badgeinfo.task_num;
//    BookList.Booknumber =  8;
    BookList.itemArray = joinmodel.bookBadge.studentBadgeBook;
    CGFloat f = 1-1.000000001*joinmodel.bookBadge.studentBadgeBook.count/joinmodel.bookBadge.badgeinfo.task_num;
    MedalView.floatjidu = f;//进度
}
@end
