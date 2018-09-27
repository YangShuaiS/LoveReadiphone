//
//  CTLianXianSmallView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "CTLianXianSmallView.h"
#import "DTTiMuView.h"

#import "CTLianXianSmallView.h"
#import "DTLianXUanXIang.h"
@implementation CTLianXianSmallView{
    DTTiMuView * tiMu;

    NSMutableArray * tiarray;
    NSMutableArray * xuanxiangarray;
    BaseLabel * bookName;
    
    NSMutableArray * tiarrays;
    NSMutableArray * xuanxiangarrays;

}

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addtiMu];
    }
    return self;
}

- (void)addtiMu{
     WS(ws);
    bookName = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(19) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:bookName];
    [bookName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws);
        make.top.equalTo(ws).with.offset(NavHeight+LENGTH(12));
    }];
    
    tiMu = [DTTiMuView new];
    [self addSubview:tiMu];
    [tiMu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->bookName.mas_bottom).with.offset(LENGTH(30));
        make.left.equalTo(ws).with.offset(LENGTH(15));
        make.right.equalTo(ws).with.offset(-LENGTH(15));
    }];
}
-(void)setupUI{
    WS(ws);
    tiarray = [NSMutableArray array];
    xuanxiangarray = [NSMutableArray array];
    
    
    DTLianXUanXIang *lastView;
    for (int i = 0; i<tiarrays.count; i++) {
        DTLianXUanXIang * view = [DTLianXUanXIang new];
        TiMuModel * model = tiarrays[i];
        view.name = model.DaAn;
        view.model = model;
        view.tag = 100+i;
        [view weixuanzhong];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.top.mas_equalTo(self->tiMu.mas_bottom).with.offset(LENGTH(14));
                
            }else{
                make.top.equalTo(lastView.mas_bottom).with.offset(LENGTH(5));
            }
            make.left.equalTo(ws).with.offset(LENGTH(16));
            make.width.mas_equalTo(LENGTH(148));
            make.height.mas_equalTo(LENGTH(64));
        }];
        if (i == tiarrays.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(ws).with.offset(0);
            }];
        }
        lastView = view;
        [tiarray addObject:view];
    }
    
    DTLianXUanXIang *lastViews;
    for (int i = 0; i<xuanxiangarrays.count; i++) {
        DTLianXUanXIang * view = [DTLianXUanXIang new];
        TiMuModel * model = xuanxiangarrays[i];
        view.name = model.DaAn;
        view.model = model;
        [view weixuanzhong];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.top.mas_equalTo(self->tiMu.mas_bottom).with.offset(LENGTH(14));
                
            }else{
                make.top.equalTo(lastViews.mas_bottom).with.offset(LENGTH(5));
            }
            make.right.equalTo(ws).with.offset(-LENGTH(16));
            make.width.mas_equalTo(LENGTH(148));
            make.height.mas_equalTo(LENGTH(64));
        }];
        if (i == xuanxiangarrays.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(ws).with.offset(0);
            }];
        }
        lastViews = view;
        [xuanxiangarray addObject:view];
    }
}
- (void)setStyle:(DaTiStyle)style{
    _style = style;
    tiMu.style = style;
    tiMu.TiMuText = @"我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题";
}
- (void)setTImu:(NSString *)tImu{
    _tImu = tImu;
    tiMu.TiMuText = tImu;
}

-(void)drawRect:(CGRect)rect{
    for (int i =0 ; i < tiarray.count; i++) {
        DTLianXUanXIang * tiView = tiarray[i];
        TiMuModel * model = tiView.model;
        DTLianXUanXIang * daANView;
        if (_style == DTLianXianStyle) {
            for (NSMutableArray * yhda in _tiModel.yhdaarray) {
                for (DTLianXUanXIang * view in xuanxiangarray) {
                    NSMutableArray * arr = [NSMutableArray array];
                    [arr addObject:model];
                    [arr addObject:view.model];
                    
                    if ([yhda isEqualToArray:arr]) {
                        daANView = view;
                    }
                }
            }
            if (daANView != nil) {
                UIBezierPath *path = [UIBezierPath bezierPath];
                CGPoint point = CGPointMake(CGRectGetMaxX(tiView.frame)+LENGTH(10), tiView.center.y);
                CGPoint points = CGPointMake(CGRectGetMinX(daANView.frame)-LENGTH(10), daANView.center.y);
                [path moveToPoint:point];
                [path addLineToPoint:points];
                //        [path addLineToPoint:endview.center];
                [RGB(254,165,79) setStroke];
                [path setLineWidth:2.0];
                [path setLineJoinStyle:kCGLineJoinRound];
                [path setLineCapStyle:kCGLineCapRound];
                [path stroke];
            }
        }else{
            for (DTLianXUanXIang * view in xuanxiangarray) {
                TiMuModel * zqmodel = view.model;
                if ([model.TiMu isEqualToString:@"option1"]&&[zqmodel.TiMu isEqualToString:@"option2"]) {
                    daANView = view;
                }else if ([model.TiMu isEqualToString:@"option3"]&&[zqmodel.TiMu isEqualToString:@"option4"]){
                    daANView = view;
                }else if ([model.TiMu isEqualToString:@"option5"]&&[zqmodel.TiMu isEqualToString:@"option6"]){
                    daANView = view;
                }else if ([model.TiMu isEqualToString:@"option7"]&&[zqmodel.TiMu isEqualToString:@"option8"]){
                    daANView = view;
                }else if ([model.TiMu isEqualToString:@"option9"]&&[zqmodel.TiMu isEqualToString:@"optionx"]){
                    daANView = view;
                }
            }
            UIBezierPath *path = [UIBezierPath bezierPath];
            CGPoint point = CGPointMake(CGRectGetMaxX(tiView.frame)+LENGTH(10), tiView.center.y);
            CGPoint points = CGPointMake(CGRectGetMinX(daANView.frame)-LENGTH(10), daANView.center.y);
            [path moveToPoint:point];
            [path addLineToPoint:points];
            //        [path addLineToPoint:endview.center];
            [RGB(0,215,167) setStroke];
            [path setLineWidth:2.0];
            [path setLineJoinStyle:kCGLineJoinRound];
            [path setLineCapStyle:kCGLineCapRound];
            [path stroke];
        }
    }
    [super drawRect:rect];
    
}
- (void)setBookname:(NSString *)bookname{
    _bookname = bookname;
    bookName.text = bookname;
}
- (void)setTiModel:(TiStyleModel *)tiModel{
    _tiModel = tiModel;
    tiarrays = [NSMutableArray array];
    xuanxiangarrays = [NSMutableArray array];
    tiarrays = tiModel.timuarray[0];
    xuanxiangarrays = tiModel.timuarray[1];
    [self setupUI];

}
@end
