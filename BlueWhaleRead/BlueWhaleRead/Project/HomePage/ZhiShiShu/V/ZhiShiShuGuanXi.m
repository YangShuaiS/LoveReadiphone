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
        NSInteger viviewonetr = 0;
        if (_datamodel.vi_type.count==0) {
            viviewonetr = 0;
        }else{
            viviewonetr =LENGTH(10);
        }
        ZhiShiShuViView * viview = [ZhiShiShuViView new];
        [self addSubview:viview];
        [viview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ws).with.offset(viviewonetr);
            make.centerX.mas_equalTo(ws);
        }];
        
        NSInteger vlineviewnetr = 0;
        if (_datamodel.line_type.count==0) {
            vlineviewnetr = 0;
        }else{
            vlineviewnetr =LENGTH(10);
        }
        ZhiShiShuLineView* lineview = [ZhiShiShuLineView new];
        [self addSubview:lineview];
        [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(viview.mas_bottom).with.offset(vlineviewnetr);
            make.centerX.mas_equalTo(ws);
        }];
        
        NSInteger relationviewinter = 0;
        if (_datamodel.relation_type.count==0) {
            relationviewinter = 0;
        }else{
            relationviewinter =LENGTH(10);
        }
        ZhiShiShuRelationView * relationview = [ZhiShiShuRelationView new];
        [self addSubview:relationview];
        [relationview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(lineview.mas_bottom).with.offset(relationviewinter);
            make.centerX.mas_equalTo(ws);
            make.bottom.mas_equalTo(ws);
        }];
        viview.textcolor = _datamodel.txt_color;
        lineview.textcolor = _datamodel.txt_color;
        relationview.textcolor = _datamodel.txt_color;
        viview.itemarray = _datamodel.vi_type;
        lineview.itemarray = _datamodel.line_type;
        relationview.itemarray = _datamodel.relation_type;
        if (_datamodel.vi_type.count ==0 && _datamodel.line_type.count == 0 && _datamodel.relation_type.count ==0) {
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(0);
            }];
        }
    }
}

@end
