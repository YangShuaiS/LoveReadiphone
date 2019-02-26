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
        }else if (i == 1){
            twoview.model = model;
        }else if (i == 2){
            threeview.model = model;
        }
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
    NSMutableArray * itemarray = [NSMutableArray array];
    [itemarray addObjectsFromArray:model.hotKnowledge];
    [itemarray addObjectsFromArray:model.hotKnowledge];

    for (int i = 0 ; i < itemarray.count; i ++) {
        NKRKnowledgeModel * model = itemarray[i];
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
