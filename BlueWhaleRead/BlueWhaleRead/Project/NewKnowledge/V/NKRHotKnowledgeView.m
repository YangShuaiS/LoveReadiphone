//
//  NKRHotKnowledgeView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NKRHotKnowledgeView.h"
//#import "YSInformationView.h"
#import "NBCmenuView.h"
#import "XHPageControl.h"
#import "SearchMyHistoryViewController.h"
//#define itemWidth LENGTH(163)
#define itemHeight LENGTH(163)*1.423312+LENGTH(10)+LENGTH(14)+LENGTH(3)+LENGTH(12)

//#import "LBTViewController.h"
//#import "ZhiShiShuShuViewController.h"
//#import "ArticleViewController.h"
@implementation NKRHotKnowledgeView{
    NBCmenuView * menu;
    NKRHotKnowledgeCollectionView * collectView;
    XHPageControl *pageControl1;
    
//    YSInformationView * oneview;
//    YSInformationView * twoview;
//    YSInformationView * threeview;
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
    menu = [NBCmenuView new];
    menu.label.text = @"热门知识图";
    menu.styles = NBCmenuViewStyleimage;
    [self addSubview:menu];
    [menu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
    }];
    [menu setBlock:^{
        [ws refinish];
    }];
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(WIDTH,itemHeight);
    //    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(0);
    //    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = 0;
    //    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(0), LENGTH(0), LENGTH(0), LENGTH(0));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    collectView = [[NKRHotKnowledgeCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(0));
        make.top.equalTo(self->menu.mas_bottom).with.offset(-LENGTH(6));
        make.right.equalTo(ws).with.offset(LENGTH(0));
        make.height.mas_equalTo(itemHeight);
    }];
    collectView.delegatePage = self;
    
    pageControl1 = [[XHPageControl alloc] init];
    pageControl1.tag = 901;
    pageControl1.otherColor = RGB(229,229,229);
    pageControl1.currentColor= RGB(168,225,224);
    [self addSubview:pageControl1];
    [pageControl1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->collectView.mas_bottom);
        make.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(30));
        make.bottom.equalTo(ws);

    }];
    pageControl1.userInteractionEnabled = NO;
    
//    oneview = [YSInformationView new];
//    oneview.style = YSInformationViewStyleBigImageAmdOndTwoTitle;
//    [self addSubview:oneview];
//
//    twoview = [YSInformationView new];
//    twoview.style = YSInformationViewStyleSomleImageAndTwotTitle;
//    [self addSubview:twoview];
//
//    threeview = [YSInformationView new];
//    threeview.style = YSInformationViewStyleSomleImageAndTwotTitle;
//    [self addSubview:threeview];
//
//    [oneview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->menu.mas_bottom);
//        make.left.mas_equalTo(self->menu).with.offset(LENGTH(17));
//        make.width.mas_equalTo(LENGTH(163));
//        make.height.mas_equalTo(LENGTH(163)*1.423312+LENGTH(10)+LENGTH(14)+LENGTH(3)+LENGTH(12));
//        make.bottom.mas_equalTo(ws);
//    }];
//
//    [twoview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self->oneview.mas_right).with.offset(LENGTH(15));
//        make.top.mas_equalTo(self->oneview);
//        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
//        make.height.mas_equalTo(LENGTH(163)*0.552147+LENGTH(10)+LENGTH(14)+LENGTH(3)+LENGTH(12));
//    }];
//
//    [threeview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self->oneview.mas_right).with.offset(LENGTH(15));
//        make.bottom.mas_equalTo(self->oneview);
//        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
//        make.height.mas_equalTo(LENGTH(163)*0.552147+LENGTH(10)+LENGTH(14)+LENGTH(3)+LENGTH(12));
//    }];
}
- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    CGFloat floorA = floorf(itemArray.count/3.0);
    NSMutableArray * allarray = [NSMutableArray array];
    NSInteger b = 0;
    for (int i =0 ; i < floorA; i++) {
        NSMutableArray * danarray = [NSMutableArray array];
        NKRKnowledgeModel * model1 = _itemArray[b];
        b++;
        NKRKnowledgeModel * model2 = _itemArray[b];
        b++;
        NKRKnowledgeModel * model3 = _itemArray[b];
        b++;
        [danarray addObject:model1];
        [danarray addObject:model2];
        [danarray addObject:model3];
        [allarray addObject:danarray];
    }
    collectView.itemArray = allarray;
    pageControl1.numberOfPages = allarray.count;

}

- (void)refinish{
    SearchMyHistoryViewController * vc = [SearchMyHistoryViewController new];
    vc.titles = @"热门知识图";
    vc.style = 5;
    [[self viewController].navigationController pushViewController:vc animated:YES];
}
//    for (int i = 0 ; i < itemArray.count; i ++) {
//        NKRKnowledgeModel * model = itemArray[i];
//        if (i == 0) {
//            model.inter = 1;
//            oneview.model = model;
//            oneview.userInteractionEnabled = YES;
//            UITapGestureRecognizer *backtap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click1)];
//            //将手势添加到需要相应的view中去
//            [oneview addGestureRecognizer:backtap1];
//        }else if (i == 1){
//            twoview.model = model;
//            twoview.userInteractionEnabled = YES;
//            UITapGestureRecognizer *backtap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click2)];
//            //将手势添加到需要相应的view中去
//            [twoview addGestureRecognizer:backtap2];
//        }else if (i == 2){
//            threeview.model = model;
//            threeview.userInteractionEnabled = YES;
//            UITapGestureRecognizer *backta3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click3)];
//            //将手势添加到需要相应的view中去
//            [threeview addGestureRecognizer:backta3];
//        }
//    }
//}
//
//- (void)click1{
//    NKRKnowledgeModel * model = _itemArray[0];
//    [self pushView:model];
//}
//- (void)click2{
//    NKRKnowledgeModel * model = _itemArray[1];
//    [self pushView:model];
//}
//- (void)click3{
//    NKRKnowledgeModel * model = _itemArray[2];
//    [self pushView:model];
//}
//- (void)pushView:(NKRKnowledgeModel*)model{
//    if (model.related_type == 1) {
//        if (model.banner_type == 1) {
//            LBTViewController * vc = [LBTViewController new];
//            vc.inter = 1;
//            vc.itemid = model.ssid;
//            [[self viewController].navigationController pushViewController:vc animated:YES];
//        }else{
//            ArticleViewController * vc = [ArticleViewController new];
//            vc.itemid = model.ssid;
//            [[self viewController].navigationController pushViewController:vc animated:YES];
//        }
//
//    }else if (model.related_type == 2){
//        ZhiShiShuShuViewController * vc = [ZhiShiShuShuViewController new];
//        vc.itemid = model.ssid;
//        [[self viewController].navigationController pushViewController:vc animated:YES];
//    }else{
//
//    }
//}

- (void)NBCBookDanPageControlindex:(NSInteger)clickIndex{
    pageControl1.currentPage = clickIndex;
}
@end
