//
//  NBTBookDanCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NBTBookDanCollectionViewCell.h"

@implementation NBTBookDanCollectionViewCell{
    UIImageView * imageview;
    CGFloat cellwidth;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    imageview = [UIImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}


- (void)setModel:(BookDanModel *)model{
    [imageview sd_setImageWithURL:URLIMAGE(model.rank_theme_img) completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        [self->imageview mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(LENGTH(image.size.width/3));
        }];
    }];
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey: [NSString stringWithFormat:@"%@%@",IMAGEURL,_model.rank_theme_img]];
    CGFloat imgw;
    imgw = image.size.width/3;
    if (!image) {
        imgw = WIDTH/2-LENGTH(20)-LENGTH(10);
    }
    UICollectionViewLayoutAttributes *attributes = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
    CGRect rect = CGRectMake(0, 0, imgw, LENGTH(38));
    attributes.frame = rect;
    return attributes;

}
@end
