//
//  NHMingYanViewTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/26.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NHMingYanViewTableViewCell.h"

@implementation NHMingYanViewTableViewCell{
    FLAnimatedImageView * imageview;
    UIImageView * backimage;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    UIView * backview = [UIView new];
    backview.backgroundColor = RGB(255, 255, 255);
    backview.layer.shadowColor = RGB(171, 171, 171).CGColor;
    backview.layer.shadowOffset = CGSizeMake(0,1);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    backview.layer.shadowRadius = LENGTH(10);
    backview.layer.shadowOpacity = 0.18;
    backview.layer.cornerRadius = LENGTH(12);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(10));
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(10));
    }];
    
    backimage = [UIImageView new];
    backimage.contentMode = UIViewContentModeScaleToFill;
    [backview addSubview:backimage];
    backimage.layer.cornerRadius = LENGTH(12);
//    backimage.layer.masksToBounds = YES;


    imageview = [FLAnimatedImageView new];
    imageview.contentMode = UIViewContentModeScaleToFill;
    //    imageview.layer.cornerRadius = LENGTH(12);
//    imageview.layer.masksToBounds = YES;

    [backview addSubview:imageview];
//    CGFloat bl = LENGTH(225)/LENGTH(984)*1.000;
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(backview).with.insets(UIEdgeInsetsMake(LENGTH(10), LENGTH(13), LENGTH(18), LENGTH(10)));
//        make.height.mas_equalTo(self->imageview.mas_width).multipliedBy(bl);
        make.height.mas_equalTo(LENGTH(71));
    }];

    [backimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(backview);
    }];
}

- (void)setModel:(NHProverbModel *)model{
    _model = model;
//    WS(ws);
//    [imageview sd_setImageWithURL:URLIMAGE(model.img) completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//        if (image != nil) {
//            [ws upimage:image];
//        }
//    }];
    [imageview sd_setImageWithURL:URLIMAGE(model.img)];
    [backimage sd_setImageWithURL:URLIMAGE(model.proverbImg)];
}
- (void)upimage:(UIImage *)image{
    CGFloat bl = image.size.height/image.size.width*1.000;
    [imageview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self->imageview.mas_width).multipliedBy(bl);
    }];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
