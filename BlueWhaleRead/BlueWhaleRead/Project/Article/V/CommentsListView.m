//
//  CommentsListView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/9.
//  Copyright © 2019 YS. All rights reserved.
//

#import "CommentsListView.h"
@implementation CommentsListView{
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
    self.backgroundColor = [UIColor whiteColor];
    BaseLabel * onetitle = [[BaseLabel alloc] initWithTxteColor:RGB(31,31,31) LabelFont:TextFontCu(14) TextAlignment:NSTextAlignmentLeft Text:@"评论列表"];
    [self addSubview:onetitle];
    [onetitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(16));
        make.left.mas_equalTo(ws).with.offset(LENGTH(18));
    }];
    
    _tableview = [CommentsTableView new];
    [self addSubview:_tableview];
    [_tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(onetitle.mas_bottom);
        make.left.and.right.and.bottom.mas_equalTo(ws);
        make.height.mas_equalTo(100);
    }];
}

- (void)setItemarray:(NSMutableArray *)itemarray {
    _itemarray = itemarray;
    _tableview.itemarray = itemarray;
}
@end
