//
//  HistogramView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HistogramView.h"
#import "HisDownLabel.h"
@implementation HistItem
@end

@interface HistogramView()
//@property(nonatomic,assign) NSInteger Xnumber;//x轴坐标个数
@end
@implementation HistogramView{
    BaseView * Xshaft;//X轴
    BaseView * Yshaft;//Y轴
    NSMutableArray * XcoordinatesLabelArray;//存放x轴label，以后用
    NSMutableArray * YcoordinatesLabelArray;//存放Y轴label，以后用
    BOOL csh;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.Xnumber = 12;
        self.Ynumber = 10;
        self.Xcoordinates = [NSArray array];
        self.MaxYvalue = 100;
        self.FormColor = RGB(0x33, 0x33, 0x33);
        self.histArray = [NSArray array];
        csh = NO;
    }
    return self;
}
- (void)setXcoordinates:(NSArray *)Xcoordinates{
    _Xcoordinates = Xcoordinates;
    self.Xnumber = Xcoordinates.count;
}

- (void)layoutSubviews{
    [super layoutSubviews];
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
    if (csh == NO) {
        csh = YES;
        [self addView];
    }
//    });
}
- (void)addView{
    //sx轴线
    [self addXYshaft];
    //x轴坐标
    [self addXcoordinates];
    //Y轴坐标
    [self addYcoordinates];
    //Y轴线
    [self addYLabelline];
    //对应视图
    switch (_style) {
        case ChartStyleBarCharts:
            [self addImView];
            break;
        case ChartStyleBarLine:
            [self addLine];
        default:
            break;
    }
}
- (void)addXYshaft{
    WS(ws);
    Xshaft = [BaseView new];
    Xshaft.backgroundColor = _FormColor;
    [self addSubview:Xshaft];
    [Xshaft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(50));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(50));
        make.height.mas_equalTo(1);
    }];
    
    Yshaft = [BaseView new];
    Yshaft.backgroundColor = _FormColor;
    [self addSubview:Yshaft];
    [Yshaft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(50));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(50));
        make.top.mas_equalTo(ws).with.offset(LENGTH(20));
        make.width.mas_equalTo(1);
    }];
}
- (void)addXcoordinates{
    XcoordinatesLabelArray = [NSMutableArray array];
    for (int i = 0; i < _Xnumber; i++) {
        BaseLabel * xlabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:_FormColor LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:_Xcoordinates[i]];
        [self addSubview:xlabel];
        [XcoordinatesLabelArray addObject:xlabel];
    }
    BaseLabel * lastLabel;
    for (int i = 0; i <XcoordinatesLabelArray.count ; i++) {
        BaseLabel * xlabel = XcoordinatesLabelArray[i];
        [xlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.left.mas_equalTo(self->Xshaft.mas_left);
            }else{
                make.width.mas_equalTo(lastLabel.mas_width);
                make.left.mas_equalTo(lastLabel.mas_right);
            }
            if (i == self->XcoordinatesLabelArray.count-1) {
                make.right.mas_equalTo(self->Xshaft.mas_right).with.offset(-LENGTH(10));
            }
            make.top.mas_equalTo(self->Xshaft.mas_bottom).with.offset(LENGTH(5));
        }];
        lastLabel = xlabel;
    }
    
}
- (void)addYcoordinates{
    WS(ws);
    YcoordinatesLabelArray = [NSMutableArray array];
    NSInteger ylabelheight = _MaxYvalue/_Ynumber;
    for (int i = 0; i < _Ynumber; i++) {
        BaseLabel * ylabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:_FormColor LabelFont:TextFont(15) TextAlignment:NSTextAlignmentRight Text:[NSString stringWithFormat:@"%ld",ylabelheight*(i+1)]];
        [self addSubview:ylabel];
        [YcoordinatesLabelArray addObject:ylabel];
    }
    [Yshaft layoutIfNeeded];
    BaseLabel * lastLabel;
    for (int i = 0; i <YcoordinatesLabelArray.count ; i++) {
        BaseLabel * ylabel = YcoordinatesLabelArray[i];
        [ylabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self->Yshaft.mas_bottom).with.offset(-self->Yshaft.frame.size.height/ws.Ynumber*(i+1)+LENGTH(10));
            make.right.mas_equalTo(self->Yshaft.mas_left).with.offset(-LENGTH(5));
        }];
        lastLabel = ylabel;
    }
}
- (void)addYLabelline{
    for (int i = 0; i <YcoordinatesLabelArray.count ; i++) {
        BaseLabel * ylabel = YcoordinatesLabelArray[i];
        BaseView * line = [BaseView new];
        line.backgroundColor = _FormColor;
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->Xshaft.mas_left);
            make.right.mas_equalTo(self->Xshaft.mas_right);
            make.centerY.mas_equalTo(ylabel.mas_centerY);
            make.height.mas_equalTo(LENGTH(1));
        }];
    }
}
- (void)addImView{
//    WS(ws);
    for (int i = 0 ; i < _Xnumber; i++) {
        BaseLabel * xlabel = XcoordinatesLabelArray[i];
        NSInteger b = _histArray.count;
        NSMutableArray * viewarray = [NSMutableArray array];
        for (int c = 0 ; c < b; c++) {
            BaseView * view = [BaseView new];
            [self addSubview:view];
            [viewarray addObject:view];
        }
        BaseView * lastView;
        for (int c = 0; c < viewarray.count; c++) {
            BaseView * v = viewarray[c];
            HistItem * item = _histArray[c];
            if (_Xnumber == 2) {
                if (i == 0) {
                    v.backgroundColor = item.itemColor;
                }else{
                    v.backgroundColor = RGBA(231, 133, 62, 1);
                }
            }else{
                v.backgroundColor = item.itemColor;
            }
            NSString * she;
            if (i <item.itemPercent.count) {
                she = item.itemPercent[i];
            }else{
                she = @"0.0";
            }
            NSInteger vheight = [she floatValue]/_MaxYvalue*Yshaft.frame.size.height;
            [v mas_makeConstraints:^(MASConstraintMaker *make) {
                if (c == 0) {
                    if (self->_Xnumber == 2) {
                        make.left.mas_equalTo(xlabel.mas_left).with.offset(LENGTH(50));

                    }else{
                        make.left.mas_equalTo(xlabel.mas_left).with.offset(LENGTH(5));
                    }
                }else{
                    make.left.mas_equalTo(lastView.mas_right);
                    make.width.mas_equalTo(lastView.mas_width);
                }
                make.bottom.mas_equalTo(self->Xshaft.mas_top);
                make.height.mas_equalTo(vheight);
                if (c == viewarray.count-1) {
                    if (self->_Xnumber == 2) {
                        make.right.mas_equalTo(xlabel.mas_right).with.offset(-LENGTH(50));
                    }else{
                        make.right.mas_equalTo(xlabel.mas_right).with.offset(-LENGTH(5));
                    }
                }
            }];
            lastView = v;
        }
    }
    
    if (_ClassNume>0) {
        NSInteger vheight = _ClassNume/_MaxYvalue*Yshaft.frame.size.height;
        UIView * v = [UIView new];
        v.backgroundColor = RGB(230, 104, 21);
        [self addSubview:v];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->Xshaft.mas_left);
            make.right.mas_equalTo(self->Xshaft.mas_right);
            make.bottom.mas_equalTo(self->Xshaft.mas_top).with.offset(-vheight);
            make.height.mas_equalTo(2);
        }];
    }
    
    if (_BiaoZhunZhi>0) {
        NSInteger vheight = _BiaoZhunZhi/_MaxYvalue*Yshaft.frame.size.height;
        UIView * v = [UIView new];
        v.backgroundColor = RGB(164, 164, 164);
        [self addSubview:v];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->Xshaft.mas_left);
            make.right.mas_equalTo(self->Xshaft.mas_right);
            make.bottom.mas_equalTo(self->Xshaft.mas_top).with.offset(-vheight);
            make.height.mas_equalTo(2);
        }];
    }
}
- (void)addLine{
    [self layoutIfNeeded];
//    for (int i = 0 ; i < _Xnumber; i++) {
//        BaseLabel * xlabel = XcoordinatesLabelArray[i];
//        [xlabel layoutIfNeeded];
//    }
    for (int c = 0; c < _histArray.count; c++) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        HistItem * item = _histArray[c];
        for (int i = 0; i < item.itemPercent.count; i++) {
            BaseLabel * xlabel = XcoordinatesLabelArray[i];
            NSString *she = item.itemPercent[i];
            NSInteger vheight = [she floatValue]/_MaxYvalue*Yshaft.frame.size.height;
            CGPoint point = CGPointMake(xlabel.center.x, Yshaft.frame.origin.y+Yshaft.frame.size.height-vheight);
            if (i == 0) {
                [path moveToPoint:point];
            }else{
                [path addLineToPoint:point];
            }
        }
        CAShapeLayer* border = [CAShapeLayer layer];
//        border.cornerRadius = LENGTH(20);
        //虚线的颜色
        border.strokeColor = item.itemColor.CGColor;
        //填充的颜色
        border.fillColor = [UIColor clearColor].CGColor;
        //设置路径
        border.path =path.CGPath;
        //虚线的宽度
        border.lineWidth = 3;
        border.lineJoin = kCALineJoinRound;
        border.lineCap = kCALineCapRound;
        //        border.lineJoin = @"kCGLineJoinRound";
        //设置线条的样式
        //        border.lineCap = @"square";
        //虚线的间隔
//        border.lineDashPattern = @[@50, @20];
        [self.layer addSublayer:border];
    }
    
    
}

#pragma mark ---------是否显示下面标签
- (void)setDownts:(BOOL)downts{
    if (downts == YES) {
        WS(ws);
        HisDownLabel *lastview;
        for (int i =0 ; i<_histArray.count; i++) {
            HistItem *element = _histArray[i];
            HisDownLabel * view = [HisDownLabel new];
            view.element = element;
            [self addSubview:view];
            if (i == 0) {
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(ws).with.offset(LENGTH(50));
                    make.bottom.mas_equalTo(ws);
                }];
            }else{
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(lastview.mas_right).with.offset(LENGTH(10));;
                    make.bottom.mas_equalTo(ws);
                }];
            }

            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(LENGTH(20));
            }];
            lastview = view;
        }
        
        if (_ClassNume>0) {
            HistItem *item = [[HistItem alloc]init];
            item.itemName = @"班级均值";
            item.itemColor =RGB(230, 104, 21);
            
            HisDownLabel * view = [HisDownLabel new];
            view.element = item;
            [self addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(lastview.mas_right).with.offset(LENGTH(10));;
                make.bottom.mas_equalTo(ws);
                make.height.mas_equalTo(LENGTH(20));
            }];
            lastview = view;

        }
        
        if (_BiaoZhunZhi>0) {
            HistItem *item = [[HistItem alloc]init];
            item.itemName = @"标准值";
            item.itemColor =RGB(164, 164, 164);
            
            HisDownLabel * view = [HisDownLabel new];
            view.element = item;
            [self addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(lastview.mas_right).with.offset(LENGTH(10));;
                make.bottom.mas_equalTo(ws);
                make.height.mas_equalTo(LENGTH(20));
            }];
            lastview = view;

        }
    }
}
@end
