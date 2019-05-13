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
    CGFloat toplabeltr;
    
    UIView * allView;
    UIView * viView;
    CGFloat allheight;
    CGFloat viheight;

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
        _datamodel = datamodel;
        self.layer.masksToBounds = YES;
        WS(ws);
        allView = [UIView new];
        [self addSubview:allView];
        [allView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws);
        }];

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
        [allView addSubview:topview];
        [topview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->allView).with.offset(self->toplabeltr);
            make.left.mas_equalTo(self->allView).with.offset(LENGTH(17));
            make.right.mas_equalTo(self->allView).with.offset(-LENGTH(12));
        }];
        UIColor * textcolor;
        if ([datamodel.knowledge_type isEqualToString:@"2"]) {
            textcolor = [BaseObject colorWithHexString:_datamodel.txt_color Alpha:1];
        }else{
            textcolor = [UIColor whiteColor];
        }
        if (![_datamodel.knowledge_info isEqualToString:@""]) {
            BaseLabel * label  =[[ BaseLabel alloc] initWithTxteColor:textcolor LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:_datamodel.knowledge_info];
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
        [allView addSubview:viview];
        [viview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->topview.mas_bottom).with.offset(viviewonetr);
            make.centerX.mas_equalTo(self->allView);
        }];
        NSInteger vlineviewnetr = 0;
        if (_datamodel.line_type.count==0) {
            vlineviewnetr = 0;
        }else{
            vlineviewnetr =LENGTH(10);
        }
        ZhiShiShuLineView* lineview = [ZhiShiShuLineView new];
        [allView addSubview:lineview];
        [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(viview.mas_bottom).with.offset(vlineviewnetr);
            make.centerX.mas_equalTo(self->allView);
        }];

        NSInteger relationviewinter = 0;
        if (_datamodel.relation_type.count==0) {
            relationviewinter = 0;
        }else{
            relationviewinter =LENGTH(10);
        }
        ZhiShiShuRelationView * relationview = [ZhiShiShuRelationView new];
        [allView addSubview:relationview];
        [relationview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(lineview.mas_bottom).with.offset(relationviewinter);
            make.centerX.mas_equalTo(self->allView);
            make.bottom.mas_equalTo(self->allView).with.offset(-LENGTH(10));
        }];
        viview.textcolor = textcolor;
        lineview.textcolor = textcolor;
        relationview.textcolor = textcolor;
        viview.itemarray = _datamodel.vi_type;
        lineview.itemarray = _datamodel.line_type;
        relationview.itemarray = _datamodel.relation_type;
        if (_datamodel.vi_type.count ==0 && _datamodel.line_type.count == 0 && _datamodel.relation_type.count ==0 && [_datamodel.knowledge_info isEqualToString:@""]) {
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(0);
            }];
        }
        
        viView = [UIView new];
        [self addSubview:viView];

        ZhiShiShuViView * viview1 = [ZhiShiShuViView new];
        [viView addSubview:viview1];
        [viView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.right.mas_equalTo(ws);
        }];
        
        [viview1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->viView.mas_top).with.offset(viviewonetr);
            make.centerX.mas_equalTo(self->viView);
            make.bottom.mas_equalTo(self->viView).with.offset(-viviewonetr);
        }];
            viview1.textcolor = textcolor;
            viview1.itemarray = _datamodel.vi_type;
        viView.alpha = 0;
        [allView layoutIfNeeded];
        [viView layoutIfNeeded];
        [self.superview layoutIfNeeded];
        allheight = allView.frame.size.height;
        viheight = viView.frame.size.height;
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
        if (labelheight >= NavHeight) {
            if (allView.alpha == 1) {
                [UIView animateWithDuration:0.1 animations:^{

                    [self mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.height.mas_equalTo(self->viheight);
                    }];
                    [self.superview layoutIfNeeded];
                } completion:^(BOOL finished) {
                                        self->allView.alpha = 0;
                                        self->viView.alpha = 1;
                }];
            }
        }else{
            if (allView.alpha == 0) {
                [UIView animateWithDuration:0.5 animations:^{

                    [self mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.height.mas_equalTo(self->allheight);
                    }];
                    [self.superview layoutIfNeeded];
                } completion:^(BOOL finished) {
                                        self->allView.alpha = 1;
                                        self->viView.alpha = 0;
                }];
            }
        }
//        WS(ws);
//        if (labelheight<=topview.frame.size.height+toplabeltr) {
//                [topview mas_updateConstraints:^(MASConstraintMaker *make) {
//                    make.top.mas_equalTo(ws).with.offset(self->toplabeltr-labelheight);
//                }];
//        }else{
//            [topview mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.top.mas_equalTo(ws).with.offset(-self->topview.frame.size.height);
//            }];
//        }
}

@end
