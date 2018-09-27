//
//  LeiDaTuOnlyUser.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/18.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "LeiDaTuOnlyUser.h"
#import "RanderDownLabel.h"


@implementation ElementItem
- (void)setValue:(id)value forUndefinedKey:(nonnull NSString *)key {}
@end
//
@implementation Item

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.colorView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, LENGTH(10), LENGTH(10))];
        [self addSubview:self.colorView];

        self.itemLabel = [[UILabel alloc]initWithFrame:CGRectMake(LENGTH(16), 0, LENGTH(10), LENGTH(10))];
        self.itemLabel.font = TextFont(8);
        self.itemLabel.textAlignment = NSTextAlignmentLeft;
        self.itemLabel.textColor = RGB(94, 97, 107);
        [self addSubview:self.itemLabel];
    }
    return self;
}

@end



static float radar_l  = 0;
static float center_w = 0;
static float center_h = 0;
@interface LeiDaTuOnlyUser(){
    NSMutableArray * xianarray;
    CGPoint starcgpoint;
}
@property (strong, nonatomic) NSArray       *elements;
@property (strong, nonatomic) NSMutableArray * items;

@property (strong, nonatomic) UIColor       *lengthColor;
@property (strong, nonatomic) UILabel       *ablilityLabel;
@property (strong, nonatomic) UITextView    *contents;
@property (strong, nonatomic) UIView        *abilityBGView;

@end

@implementation LeiDaTuOnlyUser
- (instancetype)init{
    self = [super init];
    if (self) {
//        self.backgroundColor = RGB(99, 99, 99);
        
        xianarray = [NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithRadarElements:(NSArray *)elements lengthColor:(UIColor *)lengthColor{
    if (self = [super init]) {

//        self.backgroundColor = RGB(243, 243, 243);
        self.elements = elements;
        self.lengthColor = lengthColor;
        self.items = [[NSMutableArray alloc]init];
        self.downts = NO;
        //        [self abilityContent];
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    @autoreleasepool {
        CGFloat cha = self.frame.size.height - self.frame.size.width;
        radar_l  = (self.frame.size.height - cha)/2 - LENGTH(30);
        center_w = self.frame.size.width/2;
        center_h = (self.frame.size.height - cha)/2;
        CGFloat center = 0;
        if (self.frame.size.width<self.frame.size.height) {
            CGFloat cha = self.frame.size.height - self.frame.size.width;
            center = (self.frame.size.height - cha)/2;
        } else {
            //再说
            CGFloat cha = self.frame.size.width - self.frame.size.height;
            center = (self.frame.size.width - cha)/2;

        }

        starcgpoint = CGPointMake(self.frame.size.width/2, center);


        CGPoint endcgpoing = CGPointMake(self.frame.size.width/2, LENGTH(20));
        [xianarray addObject:[NSValue valueWithCGPoint:endcgpoing]];
    }
//    [self abillityOptions];

}
- (void)drawBody{
    // 获取画布
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 划线颜色
    CGContextSetStrokeColorWithColor(context, self.lengthColor.CGColor);

    CGContextSetLineWidth(context, 0.5);
    //    // 起点坐标
    //    CGContextMoveToPoint(context, center_w, center_h);
    //    // 第一条线
    //    CGContextAddLineToPoint(context, center_w, 20);
    //    // 添加元素名称
    //    BaseLabel *bodyLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(center_w-30, 0, 60, 13) LabelTxteColor:RGB(33, 33, 33) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:_items[0]];
    //    [self addSubview:bodyLabel];

    for (int i = 0; i < _elements.count; i++) {
        float x   = 0;
        float y   = 0;

        double pi = (M_PI*2.0/(_elements.count))*(i);
        // 计算主干落点坐标
        Coordinate_2(pi, radar_l, center_w, center_h,&x, &y);
        //添加元素名称
        UILabel *bodyLabel;
        CGRect frame;
        if (x > center_w) {
            frame = CGRectMake(x+LENGTH(7), y-LENGTH(7.5), LENGTH(50),LENGTH(13));
            bodyLabel = [[BaseLabel alloc] initWithFrame:frame LabelTxteColor:RGB(33, 33, 33) LabelFont:TextFont(10) TextAlignment:NSTextAlignmentLeft Text:_elements[i]];
            [self addSubview:bodyLabel];
        }else if (x == center_w) {
            if (y>center_h) {
                frame = CGRectMake(x-LENGTH(50), y+LENGTH(7), LENGTH(50),LENGTH(13));
            } else {
                frame = CGRectMake(x-LENGTH(50), y-LENGTH(20), LENGTH(50),LENGTH(13));
            }
            bodyLabel = [[BaseLabel alloc] initWithFrame:frame LabelTxteColor:RGB(33, 33, 33) LabelFont:TextFont(10) TextAlignment:NSTextAlignmentCenter Text:_elements[i]];
        }else {
            frame = CGRectMake(x-LENGTH(50), y-LENGTH(7.5), LENGTH(50),LENGTH(13));
            bodyLabel = [[BaseLabel alloc] initWithFrame:frame LabelTxteColor:RGB(33, 33, 33) LabelFont:TextFont(10) TextAlignment:NSTextAlignmentRight Text:_elements[i]];
        }
        [self addSubview:bodyLabel];
        // 设置每次的初始点坐标
        CGContextMoveToPoint(context, center_w, center_h);
        // 设置终点坐标
        CGContextAddLineToPoint(context, x, y);
    }
    CGContextStrokePath(context);

}

- (void)buildPart {

    float r = 3.0f;

    // 获取画布
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 划线颜色
    CGContextSetStrokeColorWithColor(context, self.lengthColor.CGColor);

    // 划线宽度
    CGContextSetLineWidth(context, 0.5);
    //    // 添加百分比
    //    UILabel *partLabel = [self buildPartLabelWithText:@"0" Frame:CGRectMake(center_w-LENGTH(25), center_h-LENGTH(3), LENGTH(20), LENGTH(6))];
    //    [self addSubview:partLabel];
    // 话分割线
    for (int j = 0; j<r; j++) {
        // 设置每次的初始点坐标
        CGContextMoveToPoint(context, center_w,center_h);
        // 添加百分比
//        UILabel *partLabels = [self buildPartLabelWithText:[NSString stringWithFormat:@"%.f",100*((r-j)/r)] Frame:CGRectMake(center_w-LENGTH(30), center_h -radar_l + radar_l*j/r-LENGTH(4), LENGTH(25), LENGTH(6))];
//        [self addSubview:partLabels];
        // 画百分比分部
        for (int i = 0; i<=_elements.count; i++) {
            float x   = 0;
            float y   = 0;
            double pi = (M_PI*2.0/(_elements.count))*(i);

            Coordinate_2(pi,radar_l*(r-j)/r, center_w, center_h,&x, &y);

            CGContextAddLineToPoint(context, x, y);

        }

    }
    CGContextStrokePath(context);
}

#pragma mark - 画百分比占比线

- (void)buildPercent {

    for (int i = 0; i<self.items.count; i++) {
        ElementItem *item = self.items[i];
        // 获取画布
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(context, item.itemColor.CGColor);



        // 划线宽度
        CGContextSetLineWidth(context, 1);
        //        CGContextMoveToPoint(context, center_w, center_h-radar_l +radar_l*(1-[item.itemPercent[0] floatValue]));
        for (int j = 0; j<=item.itemPercent.count; j++) {
            float x   = 0;
            float y   = 0;
            double pi = (M_PI*2.0/(self.elements.count))*(j);
            //            Coordinate_2(pi, radar_l, center_w, center_h,&x, &y);
            if (j < item.itemPercent.count) {
                Coordinate_2(pi, radar_l*[item.itemPercent[j] floatValue], center_w, center_h,&x, &y);
            }else{
                Coordinate_2(pi, radar_l*[item.itemPercent[0] floatValue], center_w, center_h,&x, &y);

            }

            //            Coordinate_2(pi,radar_l*(r-j)/r, center_w, center_h,&x, &y);

            //            if (j == self.elements.count) {
            //                //终点，最终回到开始点坐标
            //                CGContextAddLineToPoint(context, center_w, center_h-radar_l +radar_l*(1-[item.itemPercent[0] floatValue]+0.5));
            //            } else {
            //                double pi = (M_PI*2.0/(self.items.count))*(j+0.5);
            //                Coordinate_2(pi,radar_l*[item.itemPercent[j] floatValue], center_w, center_h,&x, &y);
            if (j ==0) {
                CGContextMoveToPoint(context, x, y);
            }else{
                CGContextAddLineToPoint(context, x, y);
            }
        }
        CGContextSetFillColorWithColor(context, item.itemColor.CGColor);
        CGContextDrawPath(context, kCGPathFill);//绘制填充
        CGContextStrokePath(context);
    }

}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self drawBody];
    // 画分割线
    [self buildPart];
    //    // 画百分比占比
    [self buildPercent];

}

#pragma mark - 百分比占比label

- (UILabel *)buildPartLabelWithText:(NSString *)text Frame:(CGRect)frame{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.textAlignment = NSTextAlignmentRight;
    label.font = TextFont(10);
    label.text = text;
    return label;
}

#pragma mark - 能力测试方面label

- (UILabel *)buildElementLabelWithText:(NSString *)text Frame:(CGRect)frame Alignment:(NSTextAlignment)alignment {
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.textAlignment = alignment;
    label.font = TextFont(10);
    label.text = text;
    return label;
}

- (void)addAbilitysWithElements:(NSArray <ElementItem*>*)elements {
    [self.items addObjectsFromArray: elements];
    for (int i = 0; i < self.items.count; i++) {
        ElementItem *element = self.items[i];
        Item *item = [[Item alloc]initWithFrame:CGRectMake(WIDTH-LENGTH(116)-LENGTH(70)*i, 0, LENGTH(56), LENGTH(10))];
        item.itemLabel.text = element.itemName;
        item.colorView.backgroundColor = element.itemColor;
        [self.abilityBGView addSubview:item];
    }

    [self setNeedsDisplay];
}

#pragma mark - 能力评估的几个模块

- (void)abillityOptions {

    //    // 能力评估
    //    self.ablilityLabel = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-LENGTH(45), LENGTH(5), LENGTH(60), LENGTH(15))];
    //    self.ablilityLabel.textAlignment = NSTextAlignmentRight;
    //    self.ablilityLabel.font = [UIFont boldSystemFontOfSize:LENGTH(15)];
    //    self.ablilityLabel.text = @"能力评估";
    //    [self addSubview:self.ablilityLabel];

    // 能力苹果模块
    //    self.abilityBGView = [[UIView alloc] initWithFrame:CGRectMake(LENGTH(30), LENGTH(25), WIDTH-LENGTH(60), LENGTH(10))];
    //    [self addSubview:self.abilityBGView];
}


#pragma mark ---------是否显示下面标签
- (void)setDownts:(BOOL)downts{
    if (downts == YES) {
        WS(ws);
        RanderDownLabel *lastview;
        for (int i =0 ; i<_items.count; i++) {
            ElementItem *element = _items[i];
            RanderDownLabel * view = [RanderDownLabel new];
            view.element = element;
            [self addSubview:view];
            if (i == 0) {
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(ws);
                    make.bottom.mas_equalTo(ws);
                }];
            }else{
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.width.mas_equalTo(lastview.mas_width);
                    make.left.mas_equalTo(lastview.mas_right);
                    make.bottom.mas_equalTo(ws);
                }];
            }
            if (i == _items.count-1) {
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.mas_equalTo(ws);
                }];
            }
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(LENGTH(20));
            }];
            lastview = view;
        }
    }
}
@end
