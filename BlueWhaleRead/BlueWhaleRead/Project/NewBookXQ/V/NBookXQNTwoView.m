//
//  NBookXQNTwoView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/18.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NBookXQNTwoView.h"

@implementation NBookXQNTwoView{
    UIImageView * bookimage;
    BaseLabel * title;
    BaseLabel * subtitle;
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
    WS(ws);
    bookimage = [UIImageView new];
    bookimage.image = UIIMAGE(@"发现_你的同学_书缺省位置");
    bookimage.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:bookimage];
    [bookimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.centerY.mas_equalTo(ws);
        make.size.mas_equalTo(CGSizeMake(22, 31.5));
    }];
    
    UIImageView * xian = [UIImageView new];
    xian.image = UIIMAGE(@"书线");
    [bookimage addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.and.left.mas_equalTo(self->bookimage);
        make.width.mas_equalTo(2);
    }];
    
    title = [[BaseLabel alloc] initWithTxteColor:RGB(68, 68, 68) LabelFont:[UIFont fontWithName:@"PingFang-TC" size:FontSize(14)] TextAlignment:NSTextAlignmentLeft Text:@"书籍详情"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->bookimage);
        make.left.mas_equalTo(self->bookimage.mas_right).with.offset(6);
        make.right.mas_equalTo(ws);
    }];
    subtitle = [[BaseLabel alloc] initWithTxteColor:RGB(153,153,153) LabelFont:[UIFont fontWithName:@"PingFang-SC-Regular" size:10] TextAlignment:NSTextAlignmentLeft Text:@"阅读分级： 分值： "];
    subtitle.minimumScaleFactor = 0;
    [self addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->title.mas_bottom);
        make.left.mas_equalTo(self->bookimage.mas_right).with.offset(6);
        make.right.mas_equalTo(ws);
    }];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bookimage.bounds byRoundingCorners:UIRectCornerBottomRight | UIRectCornerTopRight cornerRadii:CGSizeMake(2,2)];
    //创建 layer
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = bookimage.bounds;
    //赋值
    maskLayer.path = maskPath.CGPath;
    bookimage.layer.mask = maskLayer;
}
- (void)setModel:(BookXQModel *)model{
    _model = model;
    [bookimage sd_setImageWithURL:URLIMAGE(model.book.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    title.text = model.book.name;
    
    NSString * str = [NSString stringWithFormat:@"阅读分级：%@ 分值：%@",model.book.levels,model.book.b_score];
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = str;
    model1.bianString = model.book.levels;
    model1.color = RGB(102,102,102);
    
    AttributedStringModel * model2 = [AttributedStringModel new];
    model2.textString = str;
    model2.bianString = model.book.b_score;
    model2.color = RGB(102,102,102);
    NSArray * modelarray = @[model1,model2];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    subtitle.attributedText = AttributedStr;
}
@end
