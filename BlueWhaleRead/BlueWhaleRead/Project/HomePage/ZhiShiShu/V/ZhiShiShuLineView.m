//
//  ZhiShiShuLineView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuLineView.h"

@implementation ZhiShiShuLineView
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    BaseLabel * lastlabel;
    WS(ws);
    for (ZhiShiShuLineModel * model in itemarray) {
        NSMutableArray * imagarrya = model.img;

        FLAnimatedImageView * imageviewtop = [FLAnimatedImageView new];
        
        BaseView * topview = [BaseView new];
        [self addSubview:topview];
        [topview mas_makeConstraints:^(MASConstraintMaker *make) {
            if (!lastlabel) {
                make.left.mas_equalTo(ws);
            }else{
                make.left.mas_equalTo(lastlabel.mas_right).with.offset(LENGTH(26));
            }
            make.top.mas_equalTo(ws).with.offset(LENGTH(5));
            make.width.mas_equalTo(LENGTH(40));
            make.height.mas_equalTo(LENGTH(3));
        }];
        NSString * imageurlvilogo = [NSString stringWithFormat:@"%@%@",ZSTX,imagarrya[0]];
        [imageviewtop sd_setImageWithURL:[NSURL URLWithString:imageurlvilogo] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            UIImage *backgroundImage = image;
            backgroundImage = [self scaleImage:backgroundImage toScale:0.5];
            UIColor *backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
            [topview setBackgroundColor:backgroundColor];
            CGFloat he = image.size.height/2;
            if (he>=0&&he<=1) {
                he = 1;
            }
            [topview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(LENGTH(he));
            }];
        }];
        
        FLAnimatedImageView * imageviewdown = [FLAnimatedImageView new];
        BaseView * downview = [BaseView new];
        [self addSubview:downview];
        [downview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(topview.mas_left).with.offset(LENGTH(5));
        make.top.mas_equalTo(topview.mas_bottom).with.offset(LENGTH(2));
//            make.bottom.mas_equalTo(ws).with.offset(-LENGTH(5));
            make.width.mas_equalTo(LENGTH(40));
            make.height.mas_equalTo(LENGTH(3));
        }];
        NSString * imageurlvilogo1 = [NSString stringWithFormat:@"%@%@",ZSTX,imagarrya[1]];
        [imageviewdown sd_setImageWithURL:[NSURL URLWithString:imageurlvilogo1] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            UIImage *backgroundImage = image;
            backgroundImage = [self scaleImage:backgroundImage toScale:0.5];
            UIColor *backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
            [downview setBackgroundColor:backgroundColor];
            CGFloat he = image.size.height/2;
            if (he>=0&&he<=1) {
                he = 1;
            }
            [downview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(LENGTH(he));
            }];
        }];
        
        BaseLabel * label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[BaseObject colorWithHexString:_textcolor] LabelFont:TextFontCu(11) TextAlignment:NSTextAlignmentLeft Text:model.name];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(downview.mas_right).with.offset(LENGTH(5));
            make.top.and.bottom.mas_equalTo(ws);
//            make.centerY.mas_equalTo(ws);
        }];
        lastlabel = label;
    }
    [lastlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws);
    }];
}


- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
    
}
@end
