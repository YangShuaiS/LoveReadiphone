//
//  NKRHotKnowledgeView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NKRHotKnowledgeView.h"
#import "YSInformationView.h"
#import "NBCmenuView.h"
#import "LBTViewController.h"
#import "ZhiShiShuShuViewController.h"
#import "ArticleViewController.h"
@implementation NKRHotKnowledgeView{
    NBCmenuView * menu;
    YSInformationView * oneview;
    YSInformationView * twoview;
    YSInformationView * threeview;
    
    NSInteger nowpage;
    NSInteger allpages;
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
    menu.styles = NBCmenuViewStyleRefinish;
    [self addSubview:menu];
    [menu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
    }];
    [menu setBlock:^{
        [ws refinish];
    }];
    
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
        make.top.mas_equalTo(self->menu.mas_bottom);
        make.left.mas_equalTo(self->menu).with.offset(LENGTH(17));
        make.width.mas_equalTo(LENGTH(175));
        make.height.mas_equalTo(LENGTH(175)*1.422857+LENGTH(15)+LENGTH(14)+LENGTH(5)+LENGTH(11));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(14));
    }];
    
    [twoview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->oneview.mas_right).with.offset(LENGTH(15));
        make.top.mas_equalTo(self->oneview);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
        make.height.mas_equalTo(LENGTH(151)*0.610561+LENGTH(15)+LENGTH(14)+LENGTH(5)+LENGTH(11));
    }];
    
    [threeview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->oneview.mas_right).with.offset(LENGTH(15));
        make.bottom.mas_equalTo(self->oneview);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
        make.height.mas_equalTo(LENGTH(151)*0.610561+LENGTH(15)+LENGTH(14)+LENGTH(5)+LENGTH(11));
    }];
    

    

}
- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    nowpage = 1;
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
-(void)setAllpage:(NSInteger)allpage{
    _allpage = allpage;
    CGFloat a = allpage/3*1.0;
    CGFloat viewcont = ceilf(a);
    allpages = viewcont;
}
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_ZHISHIWANGHOTREFINSH];
    NSDictionary * dic = @{@"page":[NSString stringWithFormat:@"%ld",(long)nowpage]};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            NewKnowledgeModel * model = [NewKnowledgeModel mj_objectWithKeyValues:responseObject];
            //            if ([model.code isEqual:@200]) {
            [self UpData:model];
            //            }else if ([model.code isEqual:@Notloggedin]){
            //                [self UpDengLu];
            //            }
        }else{
        }
    }];
}
- (void)UpData:(NewKnowledgeModel *)model{
    _itemArray = [NSMutableArray array];
    [_itemArray addObjectsFromArray:model.hotKnowledge];

    for (int i = 0 ; i < _itemArray.count; i ++) {
        NKRKnowledgeModel * model = _itemArray[i];
        if (i == 0) {
            model.inter = 1;
            oneview.model = model;
        }else if (i == 1){
            twoview.model = model;
        }else if (i == 2){
            threeview.model = model;
        }
    }
}
- (void)refinish{
    if (nowpage<allpages) {
        nowpage ++;
    }else{
        nowpage = 1;
    }
    [self LoadData];
}
@end
