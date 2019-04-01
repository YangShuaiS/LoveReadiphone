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
@implementation ZhiShiShuGuanXi{
    BaseView * topview;
    NSInteger toplabeltr;
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
//    self.backgroundColor = [UIColor redColor];
}

- (void)setDatamodel:(ZhiShiShuDataModel *)datamodel{
    if (_datamodel == nil) {
        self.layer.masksToBounds = YES;
        WS(ws);
        _datamodel = datamodel;
        toplabeltr = 0;
        if ([_datamodel.knowledge_info isEqualToString:@""]) {
            toplabeltr = 0;
        }else{
            toplabeltr = LENGTH(10);
        }
        topview = [BaseView new];
        topview.backgroundColor = RGBA(255, 255, 255, 0.4);
        topview.layer.masksToBounds = YES;
        topview.layer.cornerRadius = LENGTH(15);
        [self addSubview:topview];
        [topview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ws).with.offset(self->toplabeltr);
            make.left.mas_equalTo(ws).with.offset(LENGTH(17));
            make.right.mas_equalTo(ws).with.offset(-LENGTH(12));
        }];
        if (![_datamodel.knowledge_info isEqualToString:@""]) {
            BaseLabel * label  =[[ BaseLabel alloc] initWithTxteColor:[BaseObject colorWithHexString:_datamodel.txt_color Alpha:1] LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:_datamodel.knowledge_info];
            label.numberOfLines = 0;
            [topview addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(self->topview).with.insets(UIEdgeInsetsMake(LENGTH(12), LENGTH(12), LENGTH(12), LENGTH(12)));
            }];
        }
        
        NSInteger viviewonetr = 0;
        if (_datamodel.vi_type.count==0) {
            viviewonetr = 0;
        }else{
            viviewonetr =LENGTH(10);
        }
        ZhiShiShuViView * viview = [ZhiShiShuViView new];
        [self addSubview:viview];
        [viview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->topview.mas_bottom).with.offset(viviewonetr);
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
        if (_datamodel.vi_type.count ==0 && _datamodel.line_type.count == 0 && _datamodel.relation_type.count ==0 && [_datamodel.knowledge_info isEqualToString:@""]) {
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(0);
            }];
        }
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (![_datamodel.knowledge_info isEqualToString:@""]) {
        _labelallheight = topview.frame.size.height+toplabeltr;
    }else{
        _labelallheight = 0;
    }
}
- (void)setLabelheight:(CGFloat)labelheight{
    _labelheight = labelheight;
    if (topview.frame.size.height == 0) {

    }else{
        WS(ws);
        if (labelheight<=topview.frame.size.height+toplabeltr) {
                [topview mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(ws).with.offset(self->toplabeltr-labelheight);
                }];
        }else{
            [topview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(ws).with.offset(-self->topview.frame.size.height);
            }];
        }
    }
}

@end
