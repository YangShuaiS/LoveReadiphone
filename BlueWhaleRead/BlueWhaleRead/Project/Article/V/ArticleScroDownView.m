//
//  ArticleScroDownView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/20.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ArticleScroDownView.h"
#import "ArticleOneDownView.h"
#import "ArticleTwoDownView.h"
#import "ArticleThreeDownView.h"
@implementation ArticleScroDownView{
    NSMutableArray * viewarray;
    ArticleOneDownView * onewview;
    ArticleTwoDownView * twoview;
    ArticleThreeDownView * threeview;
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
    self.backgroundColor = [UIColor whiteColor];
    viewarray = [NSMutableArray array];
    onewview = [ArticleOneDownView new];
    [self addSubview:onewview];
    [viewarray addObject:onewview];
    
    twoview = [ArticleTwoDownView new];
    [self addSubview:twoview];
    [viewarray addObject:twoview];
    
    threeview = [ArticleThreeDownView new];
    [self addSubview:threeview];
    [viewarray addObject:threeview];

}


- (void)setModel:(LunBoTuXQModel *)model{
    _model = model;
    if (model.knowledgeGrade.count == 3) {
        onewview.model = model;
    }else{
        [viewarray removeObject:onewview];
    }
    
    if (model.bookList.count!=0) {
        twoview.model = model;
    }else{
        [viewarray removeObject:twoview];
    }
    
    if (model.bannerKnowledgeList.count!=0) {
        threeview.model = model;
    }else{
        [viewarray removeObject:threeview];
    }
    [self upview];


}
- (void)setZhiShiSHUmodel:(ZhiShiShuModel *)ZhiShiSHUmodel{
    _ZhiShiSHUmodel = ZhiShiSHUmodel;
    if (ZhiShiSHUmodel.data.knowledgeGrade.count == 3) {
        onewview.ZhiShiSHUmodel = ZhiShiSHUmodel;
    }else{
        [viewarray removeObject:onewview];
    }
    
    if (ZhiShiSHUmodel.data.bookList.count!=0) {
        twoview.ZhiShiSHUmodel = ZhiShiSHUmodel;
    }else{
        [viewarray removeObject:twoview];
    }
    
    if (ZhiShiSHUmodel.data.bannerKnowledgeList.count!=0) {
        threeview.ZhiShiSHUmodel = ZhiShiSHUmodel;
    }else{
        [viewarray removeObject:threeview];
    }
    [self upview];
}
- (void)upview{
    BaseView * lastview;
    WS(ws);
    for (int i = 0; i < viewarray.count; i++) {
        BaseView * view = viewarray[i];
        if (!lastview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(ws).with.offset(0);
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lastview.mas_bottom).with.offset(LENGTH(0));
            }];
        }
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
        }];
        if (i == viewarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(ws).with.offset(0);
            }];
        }
        lastview = view;
    }
}

@end
