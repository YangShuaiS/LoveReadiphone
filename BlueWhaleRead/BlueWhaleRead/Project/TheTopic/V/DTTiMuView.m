//
//  DTTiMuView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/24.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "DTTiMuView.h"

@implementation DTTiMuView{
    BaseView * backView;
    BaseLabel * title;
    NSString * TiXing;
    NSInteger inter;
    
    FLAnimatedImageView * imageView;
    
    BaseLabel * leixing;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = LENGTH(10);
    self.layer.borderWidth = 1;
    self.layer.borderColor = RGB(255, 255, 255).CGColor;
    self.backgroundColor = RGB(32,186,242);
//    backView = [BaseView new];
//    [self addSubview:backView];
//    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(ws);
//    }];
    leixing = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(254,165,79) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@""];
    leixing.backgroundColor = RGB(255,255,255);
    leixing.layer.masksToBounds = YES;
    leixing.layer.cornerRadius = LENGTH(11);
    [self addSubview:leixing];
    
    [leixing mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(10));
        make.centerY.equalTo(ws);
        make.height.mas_equalTo(LENGTH(22));
        make.width.mas_equalTo(LENGTH(38));

    }];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentLeft Text:@""];
    title.numberOfLines = 0;
    [self addSubview:title];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(8));
        make.right.equalTo(ws).with.offset(-LENGTH(16));
        make.left.equalTo(self->leixing.mas_right).with.offset(LENGTH(5));
        make.bottom.equalTo(ws).with.offset(-LENGTH(8));
    }];
    
    imageView = [FLAnimatedImageView new];
    [self addSubview:imageView];
}
- (void)setStyle:(DaTiStyle)style{
    _style = style;
        switch (style) {
            case DTDanXuanStyle:
                TiXing = @"单选";
                break;
            case DTDuoXuanStyle:
                TiXing = @"多选";
                break;
            case DTPaiXuStyle:
                TiXing = @"排序";
                break;
            case DTLianXianStyle:
                TiXing = @"连线";
                break;
            case CTPaiXuStyle:
                [leixing mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.width.mas_equalTo(0);
                }];
                TiXing = @"";
                break;
            case DTShiZiTu:
                [leixing mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.width.mas_equalTo(0);
                }];
                TiXing = @"";
                inter = 9;
                [self addDtShiZi];
                break;
            default:
                break;
        }
    
}
- (void)setTiMuText:(NSString *)TiMuText{
    _TiMuText = TiMuText;
//    AttributedStringModel * model = [AttributedStringModel new];
//    model.textString = [NSString stringWithFormat:@"%@%@",TiXing,TiMuText];
//    model.bianString = TiXing;
//    model.fount = 24;
//    model.color = RGB(253,188,74);
//    NSArray * modelarray = @[model];
//    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
//    title.text = model.textString;
//    title.attributedText = AttributedStr;
    leixing.text = TiXing;
    title.text = TiMuText;
//    title.text = @"asdasdasd看得见的卡组的阿卡奥斯卡大家阿卡科技卡机安静的金卡安静 啊卡刷包奥会计师安静阿克江卡卡卡";
}
- (void)setImage:(NSString *)image{
    _image = image;
    [imageView sd_setImageWithURL:URLIMAGE(image) placeholderImage:UIIMAGE(ZHANWEITU)];
}
- (void)layoutSubviews{
    [super layoutSubviews];
//    CAShapeLayer *border = [CAShapeLayer layer];
//    border.cornerRadius = LENGTH(20);
//    //虚线的颜色
//    border.strokeColor = [UIColor whiteColor].CGColor;
//    //填充的颜色
//    border.fillColor = [UIColor clearColor].CGColor;
//
//    //设置路径
////    border.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
//    border.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:LENGTH(20)].CGPath;
//
//    border.frame = self.bounds;
//    //虚线的宽度
//    border.lineWidth = 1.f;
//
//    //设置线条的样式
//    //    border.lineCap = @"square";
//    //虚线的间隔
//    border.lineDashPattern = @[@4, @2];
//
//    [self.layer addSublayer:border];
    
    if (inter == 9) {
        
    }else{
        CGSize  size = title.frame.size;
        [title mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(size.height);
        }];
    }

}

- (void)addDtShiZi{
    [title removeFromSuperview];
    WS(ws);
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.equalTo(ws).with.offset(LENGTH(25));
        make.bottom.equalTo(ws).with.offset(-LENGTH(25));
        make.width.mas_equalTo(LENGTH(160));
        make.height.mas_equalTo(LENGTH(160));
    }];
}
@end
