//
//  ZhiShiShuRelationView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuRelationView.h"

@implementation ZhiShiShuRelationView

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    BaseLabel * lastlabel;
    WS(ws);
    for (ZhiShiShuViTypeModel * model in itemarray) {
        BaseView * view = [BaseView new];
        view.backgroundColor = [BaseObject colorWithHexString:model.color];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            if (!lastlabel) {
                make.left.mas_equalTo(ws);
            }else{
                make.left.mas_equalTo(lastlabel.mas_right).with.offset(LENGTH(10));
            }
            make.centerY.mas_equalTo(ws);
            make.width.mas_equalTo(LENGTH(24));
            make.height.mas_equalTo(LENGTH(2));
        }];
        
        BaseLabel * label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[BaseObject colorWithHexString:_textcolor] LabelFont:TextFontCu(11) TextAlignment:NSTextAlignmentLeft Text:model.name];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(view.mas_right).with.offset(LENGTH(5));
            make.top.and.bottom.mas_equalTo(ws);
        }];
        lastlabel = label;
    }
    [lastlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws);
    }];
}
@end
