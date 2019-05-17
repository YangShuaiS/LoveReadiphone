//
//  NKRHotKnowledgeCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/5/16.
//  Copyright © 2019 YS. All rights reserved.
//

#import "NKRHotKnowledgeCollectionViewCell.h"
#import "YSInformationView.h"
#import "LBTViewController.h"
#import "ZhiShiShuShuViewController.h"
#import "ArticleViewController.h"
@implementation NKRHotKnowledgeCollectionViewCell{
    YSInformationView * oneview;
    YSInformationView * twoview;
    YSInformationView * threeview;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    oneview = [YSInformationView new];
    oneview.style = YSInformationViewStyleBigImageAmdOndTwoTitle;
    [self addSubview:oneview];
    
    twoview = [YSInformationView new];
    twoview.style = YSInformationViewStyleSomleImageAndTwotTitle;
    [self addSubview:twoview];
    
    threeview = [YSInformationView new];
    threeview.style = YSInformationViewStyleSomleImageAndTwotTitle;
    [self addSubview:threeview];
    
    [oneview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.left.mas_equalTo(ws).with.offset(LENGTH(17));
        make.width.mas_equalTo(LENGTH(163));
        make.height.mas_equalTo(LENGTH(163)*1.423312+LENGTH(10)+LENGTH(14)+LENGTH(3)+LENGTH(12));
        make.bottom.mas_equalTo(ws);
    }];
    
    [twoview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->oneview.mas_right).with.offset(LENGTH(15));
        make.top.mas_equalTo(self->oneview);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
        make.height.mas_equalTo(LENGTH(163)*0.552147+LENGTH(10)+LENGTH(14)+LENGTH(3)+LENGTH(12));
    }];
    
    [threeview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->oneview.mas_right).with.offset(LENGTH(15));
        make.bottom.mas_equalTo(self->oneview);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
        make.height.mas_equalTo(LENGTH(163)*0.552147+LENGTH(10)+LENGTH(14)+LENGTH(3)+LENGTH(12));
    }];
}
- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    for (int i = 0 ; i < itemArray.count; i ++) {
        NKRKnowledgeModel * model = itemArray[i];
        if (i == 0) {
            model.inter = 1;
            oneview.model = model;
            oneview.userInteractionEnabled = YES;
            UITapGestureRecognizer *backtap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click1)];
            //将手势添加到需要相应的view中去
            [oneview addGestureRecognizer:backtap1];
        }else if (i == 1){
            twoview.model = model;
            twoview.userInteractionEnabled = YES;
            UITapGestureRecognizer *backtap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click2)];
            //将手势添加到需要相应的view中去
            [twoview addGestureRecognizer:backtap2];
        }else if (i == 2){
            threeview.model = model;
            threeview.userInteractionEnabled = YES;
            UITapGestureRecognizer *backta3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click3)];
            //将手势添加到需要相应的view中去
            [threeview addGestureRecognizer:backta3];
        }
    }
}

- (void)click1{
    NKRKnowledgeModel * model = _itemArray[0];
    [self pushView:model];
}
- (void)click2{
    NKRKnowledgeModel * model = _itemArray[1];
    [self pushView:model];
}
- (void)click3{
    NKRKnowledgeModel * model = _itemArray[2];
    [self pushView:model];
}
- (void)pushView:(NKRKnowledgeModel*)model{
    if (model.related_type == 1) {
        if (model.banner_type == 1) {
            LBTViewController * vc = [LBTViewController new];
            vc.inter = 1;
            vc.itemid = model.ssid;
            [[self viewController].navigationController pushViewController:vc animated:YES];
        }else{
            ArticleViewController * vc = [ArticleViewController new];
            vc.itemid = model.ssid;
            [[self viewController].navigationController pushViewController:vc animated:YES];
        }
        
    }else if (model.related_type == 2){
        ZhiShiShuShuViewController * vc = [ZhiShiShuShuViewController new];
        vc.itemid = model.ssid;
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }else{
        
    }
}
@end
