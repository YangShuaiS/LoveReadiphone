//
//  NBCOtherReadBookView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/11.
//  Copyright © 2019 YS. All rights reserved.
//

#import "NBCOtherReadBookView.h"
#import "NBCmenuView.h"
#import "NBCOtherReadBookTableView.h"
@implementation NBCOtherReadBookView{
    NBCmenuView * menu;
    NBCOtherReadBookTableView * tableView;
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
    menu.label.text = @"其他人在看什么？";
//    menu.styles = NBCmenuViewStyleimage;
    [self addSubview:menu];
    [menu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
    }];
    [menu setBlock:^{
    }];
    
    tableView = [NBCOtherReadBookTableView new];
    [self addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->menu.mas_bottom).with.offset(-LENGTH(10));
        make.left.and.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(14));
    }];
}

- (void)setModel:(NBCALLModel *)model{
    _model = model;
    tableView.itemArray = model.otherBookCatalogList;
}
@end
