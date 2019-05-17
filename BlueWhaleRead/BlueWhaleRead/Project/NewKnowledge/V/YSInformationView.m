//
//  YSInformationView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "YSInformationView.h"
@implementation YSInformationView{
    FLAnimatedImageView * imageView;
    BaseLabel * onetitle;
    BaseLabel * twotitle;
    
    UIImageView * dgbj;
    FLAnimatedImageView * dg;
    
    UIView * backview;
    BaseLabel * geshu;
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
    self.backgroundColor = [UIColor clearColor];
    imageView = [FLAnimatedImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = LENGTH(5);
    imageView.backgroundColor = RGB(239, 239, 239);
    [self addSubview:imageView];
    
    onetitle = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:onetitle];
    
    twotitle = [[BaseLabel alloc] initWithTxteColor:RGB(175, 175, 175) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:twotitle];
    
    dgbj = [UIImageView new];
    dgbj.layer.cornerRadius = LENGTH(3);
    dgbj.layer.borderColor = RGB(255, 255, 255).CGColor;
    dgbj.layer.borderWidth = 1;
    dgbj.layer.backgroundColor = RGBA(0, 0, 0,0.2).CGColor;
    [imageView addSubview:dgbj];
    [dgbj mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageView.mas_top).with.offset(LENGTH(8));
        make.right.mas_equalTo(self->imageView.mas_right).with.offset(-LENGTH(8));
        make.size.mas_equalTo(CGSizeMake(LENGTH(15), LENGTH(15)));
    }];
    
    dgbj.hidden = YES;
    
    dg = [FLAnimatedImageView new];
    dg.contentMode = UIViewContentModeScaleAspectFit;
    [dgbj addSubview:dg];
    [dg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->dgbj);
        make.left.mas_equalTo(self->dgbj).with.offset(LENGTH(3));
        make.right.mas_equalTo(self->dgbj).with.offset(-LENGTH(3));
    }];
    
    backview = [UIView new];
    backview.backgroundColor = RGBA(239, 189, 39, 0.9);
    [imageView addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.bottom.mas_equalTo(self->imageView);
        make.height.mas_equalTo(LENGTH(17));
    }];
    
    geshu = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:@"999"];
    [backview addSubview:geshu];
    [geshu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.mas_equalTo(self->backview);
        make.right.mas_equalTo(self->backview).with.offset(-LENGTH(9));
    }];
    
    UIImageView * yanjing = [UIImageView new];
    yanjing.contentMode = UIViewContentModeScaleAspectFit;
    yanjing.image = UIIMAGE(@"观看量-图标");
    [backview addSubview:yanjing];
    [yanjing mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->backview);
        make.left.mas_equalTo(self->backview).with.offset(LENGTH(10));
        make.right.mas_equalTo(self->geshu.mas_left).with.offset(-LENGTH(5));
        make.size.mas_equalTo(CGSizeMake(LENGTH(13), LENGTH(10)));
    }];
}

- (void)setStyle:(YSInformationViewStyle)style{
    _style = style;
    switch (style) {
        case YSInformationViewStyleBigImageAmdOndTwoTitle:
            [self upYSInformationViewStyleBigImageAmdOndTwoTitle];
            break;
        case YSInformationViewStyleSomleImageAndOnetTitle:
            [self upYSInformationViewStyleSomleImageAndOnetTitle];
            break;
        case YSInformationViewStyleSomleImageAndTwotTitle:
            [self upYSInformationViewStyleSomleImageAndTwotTitle];
            break;
             
        default:
            break;
    }
}
- (void)upYSInformationViewStyleBigImageAmdOndTwoTitle{
    WS(ws);
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(self->imageView.mas_width).multipliedBy(1.423312);
    }];
    
    [onetitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageView.mas_bottom).with.offset(LENGTH(10));
        make.height.mas_equalTo(LENGTH(14));
        make.left.and.right.mas_equalTo(ws);
    }];
    
    [twotitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->onetitle.mas_bottom).with.offset(LENGTH(3));
        make.height.mas_equalTo(LENGTH(12));
        make.left.and.right.mas_equalTo(ws);
    }];
}
- (void)upYSInformationViewStyleSomleImageAndOnetTitle{
    WS(ws);
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(self->imageView.mas_width).multipliedBy(0.552147);
    }];
    
    [onetitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageView.mas_bottom).with.offset(LENGTH(10));
        make.height.mas_equalTo(LENGTH(14));
        make.left.and.right.mas_equalTo(ws);
    }];
}

- (void)upYSInformationViewStyleSomleImageAndTwotTitle{
    WS(ws);
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(self->imageView.mas_width).multipliedBy(0.552147);
    }];
    
    [onetitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageView.mas_bottom).with.offset(LENGTH(10));
        make.height.mas_equalTo(LENGTH(14));
        make.left.and.right.mas_equalTo(ws);
    }];
    
    [twotitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->onetitle.mas_bottom).with.offset(LENGTH(3));
        make.height.mas_equalTo(LENGTH(12));
        make.left.and.right.mas_equalTo(ws);
    }];
}

- (void)upyuanjiao{
    [self.superview layoutIfNeeded];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:backview.bounds byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(LENGTH(5),LENGTH(5))];
    //创建 layer
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = backview.bounds;
    //赋值
    maskLayer.path = maskPath.CGPath;
    backview.layer.mask = maskLayer;
}

- (void)setModel:(NKRKnowledgeModel *)model{
    _model = model;
    if (model.related_type == 1) {
        if (model.inter == 1) {
            [imageView sd_setImageWithURL:URLIMAGE(model.banner_img1)];
        }else{
            [imageView sd_setImageWithURL:URLIMAGE(model.banner_img)];
        }
    }else if (model.related_type == 2){
        if (model.inter == 1) {
            [imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTXIMAGEURL,model.banner_img1]]];
        }else{
            [imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTXIMAGEURL,model.banner_img]]];
        }
    }else{
        
    }
    if (_bkzt == 1) {
        if (model.duigou == 1) {
            dg.image = UIIMAGE(@"单选");
        }else{
            dg.image = UIIMAGE(@"");
            
        }
    }
    onetitle.text = model.title;
    twotitle.text = model.banner_foreword;
    geshu.text = model.read_times;
    if ([geshu.text isEqualToString:@""]) {
        backview.hidden = YES;
    }else{
        backview.hidden = NO;
    }
    [self upyuanjiao];
}

- (void)setBkzt:(NSInteger)bkzt{
    _bkzt = bkzt;
    if (bkzt == 1) {
        dgbj.hidden = NO;
    }else{
        dgbj.hidden = YES;
    }
}

@end
