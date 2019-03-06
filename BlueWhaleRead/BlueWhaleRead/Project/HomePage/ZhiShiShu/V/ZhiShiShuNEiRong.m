//
//  ZhiShiShuNEiRong.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuNEiRong.h"
#import "ZhiShiShuXQView.h"
@implementation ZhiShiShuNEiRong{
    FLAnimatedImageView * imageview;
    BaseLabel * label;
    
    FLAnimatedImageView * textimag;
    BaseView * downView;
    
    BaseView * lastview;
    
}
- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
                                [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
                                UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
                                UIGraphicsEndImageContext();
                                
                                return scaledImage;
                                
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)donghua{
//    ZhiShiShuNeiRongModel * neirong = _neirong;
//    if ([neirong.flag isEqualToString:@""]||[neirong.flag isEqualToString:@"0"]) {
//
//    }else{
////        ZhiShiShuXQView * view = [ZhiShiShuXQView new];
////        view.itemid = neirong._id;
////        view.nav = self.nav;
////        [_lastview addSubview:view];
////
////        [view mas_makeConstraints:^(MASConstraintMaker *make) {
////            make.edges.mas_equalTo(ws.lastview);
////        }];
//    }
//
//    UIView * v = [UIView new];
//    v.backgroundColor = RGBA(0, 0, 0, 0.9);
//    [self addSubview:v];
//    WS(ws);
//    [v mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(ws);
//        make.width.and.height.mas_equalTo(1);
//    }];
//    [UIView animateWithDuration:1 animations:^{
//        [v mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.width.and.height.mas_equalTo(ws);
//        }];
//        [v layoutIfNeeded];
//    } completion:^(BOOL finished) {
//        [v removeFromSuperview];
//    }];
}
- (void)addview{
    WS(ws);
    
    imageview = [FLAnimatedImageView new];
//    imageview.layer.masksToBounds = YES;
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
//        make.right.mas_equalTo(ws);
        make.top.mas_equalTo(ws);
        make.width.mas_equalTo(0);
        make.height.mas_equalTo(0);
    }];

//    imageview.userInteractionEnabled = YES;
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(donghua)];
//    [imageview addGestureRecognizer:tap];
    
    downView = [BaseView new];
    downView.backgroundColor = [UIColor clearColor];
    [self addSubview:downView];
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->imageview);
        make.top.mas_equalTo(self->imageview.mas_bottom);
        make.bottom.mas_equalTo(ws);
    }];
    
    textimag = [FLAnimatedImageView new];
    textimag.contentMode = UIViewContentModeScaleAspectFit;
    [downView addSubview:textimag];
    [textimag mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->downView);
        make.left.mas_equalTo(self->downView);
        make.bottom.mas_equalTo(self->downView).with.offset(-LENGTH(5));
        make.width.mas_equalTo(LENGTH(32));
        make.height.mas_equalTo(LENGTH(32));
    }];
    
    label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(159,131,68) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@""];
    [downView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self->textimag);
        make.top.mas_equalTo(self->textimag.mas_top);
        make.left.mas_equalTo(self->textimag.mas_right).with.offset(LENGTH(5));
        make.right.mas_equalTo(self->downView);
    }];
    label.numberOfLines = 0;
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [self addGestureRecognizer:tap];

}
- (void)click{
    self.block(_neirong);
}
- (void)setNeirong:(ZhiShiShuNeiRongModel *)neirong{
    _neirong = neirong;
    NSString * imageurl = [NSString stringWithFormat:@"%@%@",ZSTX,neirong.pic];
    [self->imageview sd_setImageWithURL:[NSURL URLWithString:imageurl]];
    [self->imageview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(neirong.width*poinw);
        make.height.mas_equalTo(neirong.height*poinw);
    }];
//    [self->textimag sd_setImageWithURL:[NSURL URLWithString:imageurl]];
    label.text = neirong.name;
    if ([neirong.vi_logo isEqualToString:@""]) {
        label.textAlignment = NSTextAlignmentCenter;
        [textimag mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(LENGTH(0));
            make.height.mas_equalTo(LENGTH(0));
        }];
    }else{
        [textimag mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(LENGTH(32));
            make.height.mas_equalTo(LENGTH(32));
        }];
        label.textAlignment = NSTextAlignmentLeft;
    }
//    label.text = @"水电费水电费\n水电费\n水电费水电费\n水电费";

    NSString * imageurlvilogo = [NSString stringWithFormat:@"%@%@",ZSTX,neirong.vi_logo];
    [self->textimag sd_setImageWithURL:[NSURL URLWithString:imageurlvilogo]];
    
    NSMutableArray * imagarrya = _neirong.underline;
    if (imagarrya.count == 0) {
        
    }else if (imagarrya.count == 1){
        [self addoneimahe];
    }else if (imagarrya.count == 2){
        [self addoneimahe];
        [self addtwoimage];
    }
    self.userInteractionEnabled = YES;
    if ([neirong.is_background isEqualToString:@"1"]) {
        self.userInteractionEnabled = NO;
    }else{
        if ([neirong.flag isEqualToString:@""]||[neirong.flag isEqualToString:@"0"]) {
            self.userInteractionEnabled = NO;
        }
    }

    
}
- (void)addoneimahe{
    NSMutableArray * imagarrya = _neirong.underline;
    
    FLAnimatedImageView * imageviewtop = [FLAnimatedImageView new];
    BaseView * topview = [BaseView new];
    [downView addSubview:topview];
    [topview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->textimag.mas_right);
        make.top.mas_equalTo(self->label.mas_bottom).with.offset(LENGTH(2));
        make.right.mas_equalTo(self->downView).with.offset(LENGTH(5));
        make.height.mas_equalTo(3);
    }];
    NSInteger scale_screen = [UIScreen mainScreen].scale;
    NSMutableString *topimage = [[NSMutableString alloc] initWithString:imagarrya[0]];
    if (topimage.length >4) {
        if (scale_screen == 2) {
        }else if (scale_screen >= 3){
            [topimage insertString:@"_3x" atIndex:topimage.length-4];
        }
    }
    NSString * imageurlvilogo0 = [NSString stringWithFormat:@"%@%@",ZSTX,topimage];
    [imageviewtop sd_setImageWithURL:[NSURL URLWithString:imageurlvilogo0] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        UIImage *backgroundImage = image;
        backgroundImage = [self scaleImage:backgroundImage toScale:1.0/scale_screen];
        UIColor *backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
        [topview setBackgroundColor:backgroundColor];
        CGFloat he = image.size.height/scale_screen;
        if (he>=0&&he<=1) {
            he = 1;
        }
        [topview mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(he);
        }];
    }];
    lastview = topview;
}

- (void)addtwoimage{
    NSMutableArray * imagarrya = _neirong.underline;
    FLAnimatedImageView * imageviewdown = [FLAnimatedImageView new];
    BaseView * downview = [BaseView new];
    [self addSubview:downview];
    [downview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->lastview.mas_left).with.offset(LENGTH(5));
        make.top.mas_equalTo(self->lastview.mas_bottom).with.offset(LENGTH(2));
        make.right.mas_equalTo(self->downView).with.offset(LENGTH(10));
        make.height.mas_equalTo(LENGTH(3));
    }];
    NSInteger scale_screen = [UIScreen mainScreen].scale;
    NSMutableString *dowimage = [[NSMutableString alloc] initWithString:imagarrya[1]];
    if (dowimage.length >4) {
        
        if (scale_screen == 2) {
        }else if (scale_screen >=3){
            [dowimage insertString:@"_3x" atIndex:dowimage.length-4];
        }
    }
    
    NSString * imageurlvilogo1 = [NSString stringWithFormat:@"%@%@",ZSTX,dowimage];
    [imageviewdown sd_setImageWithURL:[NSURL URLWithString:imageurlvilogo1] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        UIImage *backgroundImage = image;
        backgroundImage = [self scaleImage:backgroundImage toScale:1.0/scale_screen];
        UIColor *backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
        [downview setBackgroundColor:backgroundColor];
        CGFloat he = image.size.height/scale_screen;
        if (he>=0&&he<=1) {
            he = 1;
        }
        [downview mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(he);
        }];
    }];
    lastview = downview;
}

- (void)setTextmodel:(ZhiShiShuDataModel *)textmodel{
    _textmodel =textmodel;
    label.textColor = [BaseObject colorWithHexString:textmodel.txt_color];

}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat flo = 0;
    if (imageview.frame.size.width>textimag.frame.size.width+LENGTH(5)+label.frame.size.width) {
        flo =imageview.frame.size.width;
    }else{
        flo = textimag.frame.size.width+LENGTH(5)+label.frame.size.width;
    }
    if (_neirong.width<=0) {
        [downView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self->imageview).with.offset(self->downView.frame.size.width/2);
        }];
    }
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(flo);
    }];
    

}
- (void)yinying{
    imageview.layer.shadowOpacity = 1;
    imageview.layer.shadowColor = RGBA(238,178,48,1).CGColor;
    imageview.layer.shadowRadius = 25.f;
    imageview.layer.shadowOffset = CGSizeMake(0,0);
}

- (void)wuyinying{
    imageview.layer.shadowOpacity = 0;
    imageview.layer.shadowRadius = 0;

}

@end
