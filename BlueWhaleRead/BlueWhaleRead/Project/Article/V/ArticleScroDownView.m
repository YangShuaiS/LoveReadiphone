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
    CommentsListView * comlist;
    UIView * view;
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
    WS(ws);
    _share = [ArticleShareView new];
    [self addSubview:_share];
    [_share mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.centerX.mas_equalTo(ws);
    }];
    _share.delegateArticleShare = self;
    
    view = [UIView new];
    view.backgroundColor = RGB(238,238,238);
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.share.mas_bottom).with.offset(LENGTH(24));
        make.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(5));
    }];
    
    
    viewarray = [NSMutableArray array];
    onewview = [ArticleOneDownView new];
    [self addSubview:onewview];
    [viewarray addObject:onewview];
    
    threeview = [ArticleThreeDownView new];
    [self addSubview:threeview];
    [viewarray addObject:threeview];
    
    twoview = [ArticleTwoDownView new];
    [self addSubview:twoview];
    [viewarray addObject:twoview];
    
    _comlist = [CommentsListView new];
    [self addSubview:_comlist];
    [viewarray addObject:_comlist];

}


- (void)setModel:(LunBoTuXQModel *)model{
    if (_model == nil) {
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
        
        _comlist.itemarray = model.studentCommentList;
        [self upview];
        if (_Type == 1) {
            _share.atype = _sharetype;
            _share.Type = _Type;
            _share.imageurl = [NSString stringWithFormat:@"%@%@",IMAGEURL,model.banner.banner_img];
            _share.wzbt = model.banner.title;
            _share.textid = model.banner.ssid;
            _share.bookname = model.banner.title;
            _share.itemid = _itemid;
            _share.model = model;
        }else{
            _share.atype = _sharetype;
            _share.Type = _Type;
            _share.itemid = _itemid;
            _share.ZSModel = _ZhiShiSHUmodel;
        }

    }else{
        _model = model;
        _comlist.itemarray = model.studentCommentList;
    }

}
- (void)setZhiShiSHUmodel:(ZhiShiShuModel *)ZhiShiSHUmodel{
    if (_ZhiShiSHUmodel == nil) {
        _ZhiShiSHUmodel = ZhiShiSHUmodel;
        if ([BaseObject ArratClass:ZhiShiSHUmodel.data.knowledgeGrade]) {
            if (ZhiShiSHUmodel.data.knowledgeGrade.count == 3) {
                onewview.ZhiShiSHUmodel = ZhiShiSHUmodel;
            }else{
                [viewarray removeObject:onewview];
            }
        }else{
            [viewarray removeObject:onewview];
        }

        if ([BaseObject ArratClass:ZhiShiSHUmodel.data.bookList]) {
            if (ZhiShiSHUmodel.data.bookList.count!=0) {
                twoview.ZhiShiSHUmodel = ZhiShiSHUmodel;
            }else{
                [viewarray removeObject:twoview];
            }
        }else{
            [viewarray removeObject:twoview];
        }
        
        if ([BaseObject ArratClass:ZhiShiSHUmodel.data.bannerKnowledgeList]) {
            if (ZhiShiSHUmodel.data.bannerKnowledgeList.count!=0) {
                threeview.ZhiShiSHUmodel = ZhiShiSHUmodel;
            }else{
                [viewarray removeObject:threeview];
            }
        }else{
            [viewarray removeObject:threeview];
        }
        
        if ([BaseObject ArratClass:ZhiShiSHUmodel.data.studentCommentList]) {
            _comlist.itemarray = ZhiShiSHUmodel.data.studentCommentList;
        }

        [self upview];
        _share.atype = _sharetype;
        _share.Type = _Type;
        _share.itemid = _itemid;
        _share.ZSModel = _ZhiShiSHUmodel;
    }else{
        _ZhiShiSHUmodel = ZhiShiSHUmodel;
        if ([BaseObject ArratClass:ZhiShiSHUmodel.data.studentCommentList]) {
            _comlist.itemarray = ZhiShiSHUmodel.data.studentCommentList;
        }
        
    }
    
}
- (void)upview{
    BaseView * lastview;
    WS(ws);
    for (int i = 0; i < viewarray.count; i++) {
        BaseView * view = viewarray[i];
        if (!lastview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self->view.mas_bottom).with.offset(0);
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
                make.bottom.equalTo(ws).with.offset(-TabBarHeight);
            }];
        }
        lastview = view;
    }
}
- (void)setItemid:(NSString *)itemid{
    _itemid = itemid;
    _share.itemid = itemid;
}

- (void)ArticleSharShouCang{
    [self.delegateArticleScroTop ArticleScroTopViewShouCang];
}
- (void)ArticleSharDianZan{
    [self.delegateArticleScroTop ArticleScroTopViewDianZan];
}
- (void)setSfzsw:(NSInteger)sfzsw{
    _sfzsw = sfzsw;
    _share.sfzsw = sfzsw;
}
@end
