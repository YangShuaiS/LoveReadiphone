//
//  HproverbView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HproverbView.h"
#import "NBCmenuView.h"

@implementation HproverbView{
    FLAnimatedImageView * imageview;
    NBCmenuView * navMenu;//
    UIImageView * backimage;

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
    WS(ws);
    navMenu = [NBCmenuView new];
//    navMenu.styles = NBCmenuViewStyleimage;
    navMenu.label.text = @"每日格言";
    [self addSubview:navMenu];
    [navMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(0);
    }];

    
    UIView * backview = [UIView new];
    backview.backgroundColor = RGB(255, 255, 255);
    backview.layer.shadowColor = RGB(171, 171, 171).CGColor;
    backview.layer.shadowOffset = CGSizeMake(0,1);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    backview.layer.shadowRadius = LENGTH(12);
    backview.layer.shadowOpacity = 0.18;
    backview.layer.cornerRadius = LENGTH(12);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->navMenu.mas_bottom);
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(14));
    }];
    
    backimage = [UIImageView new];
    backimage.contentMode = UIViewContentModeScaleToFill;
    [backview addSubview:backimage];
    backimage.layer.cornerRadius = LENGTH(12);
    backimage.layer.masksToBounds = YES;
    
    
    imageview = [FLAnimatedImageView new];
    imageview.contentMode = UIViewContentModeScaleToFill;
//    imageview.layer.cornerRadius = LENGTH(12);
    imageview.layer.masksToBounds = YES;

    [backview addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(backview).with.insets(UIEdgeInsetsMake(LENGTH(18), LENGTH(13), LENGTH(18), LENGTH(13)));
    }];
    
    [backimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(backview);
    }];
    
}

- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    if (itemArray.count>0) {
        WS(ws);
        NHProverbModel * model = itemArray[0];
        [imageview sd_setImageWithURL:URLIMAGE(model.img) completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if (image != nil) {
                [ws upimage:image];
            }
        }];
        [backimage sd_setImageWithURL:URLIMAGE(model.proverbImg)];
        
    }
}
- (void)upimage:(UIImage *)image{
    CGFloat bl = image.size.height/image.size.width*1.000;
    [imageview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self->imageview.mas_width).multipliedBy(bl);
    }];
}
- (void)layoutSubviews{
    [super layoutSubviews];
//    self.layer.cornerRadius = LENGTH(12);
//    backimage.layer.cornerRadius = LENGTH(12);
//    imageview.layer.cornerRadius = LENGTH(12);

}
@end
