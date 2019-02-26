//
//  NKRWenzhangView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/21.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NKRWenzhangView.h"
#import "NBCmenuView.h"
#import "SearchRelatedTableView.h"
#import "SearchEZTJViewController.h"
@implementation NKRWenzhangView{
    NBCmenuView * menu;
    SearchRelatedTableView * tableview;
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
    menu.label.text = @"好文浏览";
    menu.styles = NBCmenuViewStyleimage;
    [self addSubview:menu];
    [menu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
    }];
    [menu setBlock:^{
        [ws push];
    }];
    tableview = [SearchRelatedTableView new];
    tableview.allinter = 3;
    [self addSubview:tableview];
    [tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(self->menu.mas_bottom).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(-LENGTH(14));
    }];
    
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    tableview.itemarray = itemarray;
}
- (void)push{
    SearchEZTJViewController * vc = [SearchEZTJViewController new];
    vc.titles = @"好文浏览";
    [[self viewController].navigationController pushViewController:vc animated:YES];
}

@end
