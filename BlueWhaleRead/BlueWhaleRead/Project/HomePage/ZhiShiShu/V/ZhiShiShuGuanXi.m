//
//  ZhiShiShuGuanXi.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuGuanXi.h"
#import "ZhiShiShuViView.h"
#import "ZhiShiShuLineView.h"
#import "ZhiShiShuRelationView.h"
@implementation ZhiShiShuGuanXi

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
//    self.backgroundColor = [UIColor redColor];
}

- (void)setDatamodel:(ZhiShiShuDataModel *)datamodel{
    if (_datamodel == nil) {
        WS(ws);
        _datamodel = datamodel;
        ZhiShiShuViView * viview = [ZhiShiShuViView new];
        [self addSubview:viview];
        [viview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ws).with.offset(LENGTH(10));
            make.centerX.mas_equalTo(ws);
        }];
        
        ZhiShiShuLineView* lineview = [ZhiShiShuLineView new];
        [self addSubview:lineview];
        [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(viview.mas_bottom).with.offset(LENGTH(10));
            make.centerX.mas_equalTo(ws);
        }];
        
        ZhiShiShuRelationView * relationview = [ZhiShiShuRelationView new];
        [self addSubview:relationview];
        [relationview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(lineview.mas_bottom).with.offset(LENGTH(10));
            make.centerX.mas_equalTo(ws);
            make.bottom.mas_equalTo(ws);
        }];
        viview.textcolor = _datamodel.txt_color;
        lineview.textcolor = _datamodel.txt_color;
        relationview.textcolor = _datamodel.txt_color;
        
        viview.itemarray = _datamodel.vi_type;
        lineview.itemarray = _datamodel.line_type;
        relationview.itemarray = _datamodel.relation_type;
        


    }
}
@end
