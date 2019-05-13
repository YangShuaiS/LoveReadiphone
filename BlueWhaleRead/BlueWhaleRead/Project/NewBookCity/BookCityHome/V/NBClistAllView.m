//
//  NBClistAllView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBClistAllView.h"
#import "NBCmenuView.h"
#import "HomeActivityViewController.h"

#import "XHPageControl.h"
#define itemWidth LENGTH(218)
#define itemHeight LENGTH(202)
@implementation NBClistAllView{
    NBCBookDanCollectionView * collectView;
    XHPageControl *pageControl1;
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
    NBCmenuView * menu = [NBCmenuView new];
    menu.label.text = @"名校书单";
//    menu.styles = NBCmenuViewStyleimage;
    [self addSubview:menu];
    [menu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
    }];
    [menu setBlock:^{
        [ws push];
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
    //    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(15);
    //    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = 0;
    //    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(6), LENGTH(17), LENGTH(24), LENGTH(0));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    collectView = [[NBCBookDanCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(0));
        make.top.equalTo(menu.mas_bottom).with.offset(-LENGTH(6));
        make.right.equalTo(ws).with.offset(LENGTH(0));
        make.bottom.equalTo(ws).with.offset(-LENGTH(14));
        make.height.mas_equalTo(itemHeight+LENGTH(30));
    }];
    collectView.delegatePage = self;
    
    pageControl1 = [[XHPageControl alloc] init];
    pageControl1.tag = 901;
    pageControl1.otherColor = RGB(229,229,229);
    pageControl1.currentColor= RGB(168,225,224);
    [self addSubview:pageControl1];
    [pageControl1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->collectView.mas_bottom).with.offset(-LENGTH(24));
        make.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(30));
    }];
    pageControl1.userInteractionEnabled = NO;
   
}
- (void)push{
}
- (void)setModel:(NBCALLModel *)model{
    _model = model;
    if ([BaseObject ArratClass:model.rankList]) {
        NSMutableArray * bookarray = [NSMutableArray array];
        for (NBCclassificationModel * bookList in model.rankList) {
            if ([BaseObject ArratClass:bookList.bookList]) {
                if (bookList.bookList.count>0) {
                    [bookarray addObject:bookList];
                }
            }
        }
        collectView.itemArray = bookarray;
        pageControl1.numberOfPages = bookarray.count;
    }


//    for (int i = 0 ; i <  model.rankList.count; i++) {
//        NBCclassificationModel * mo = model.rankList[i];
//        UIImageView * image = viewarray[i];
//        [image sd_setImageWithURL:URLIMAGE(mo.rank_theme_img)];
//    }
}
- (void)oneButton:(BaseButton * )button{
//    NSInteger i = button.tag-100;
//    NBCclassificationModel * mode = _model.rankList[i];
//    HomeActivityViewController * vc = [HomeActivityViewController new];
//    vc.hiden = YES;
//    vc.itemid = mode.ssid;
//    [[self viewController].navigationController pushViewController:vc animated:YES];

}

- (void)NBCBookDanPageControlindex:(NSInteger)clickIndex{
    pageControl1.currentPage = clickIndex;
}
@end
