//
//  HomeInterestGroupCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeInterestGroupCollectionViewCell.h"
#import "HotFire.h"
@implementation HomeInterestGroupCollectionViewCell
{
    BaseView * backView;
    FLAnimatedImageView * imageView;
    BaseLabel * Title;
    BaseLabel * ren;
    FLAnimatedImageView * rentouImage;
    
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
    backView = [BaseView new];
    backView.backgroundColor = RANDOMCOLOR;
    backView.layer.borderWidth = 1;
    backView.layer.borderColor = [UIColor blackColor].CGColor;
    backView.layer.cornerRadius = LENGTH(10);
    backView.layer.masksToBounds = YES;
    [self.contentView addSubview:backView];
    
    imageView = [FLAnimatedImageView new];
    imageView.backgroundColor = RANDOMCOLOR;
    imageView.layer.cornerRadius = LENGTH(10);
    imageView.layer.masksToBounds = YES;
    [backView addSubview:imageView];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font15) TextAlignment:NSTextAlignmentCenter Text:CHANGWENZI];
    //    Title.numberOfLines = 2;
    [backView addSubview:Title];
    
    rentouImage = [FLAnimatedImageView new];
    rentouImage.backgroundColor = RANDOMCOLOR;
    [backView addSubview:rentouImage];
    
    ren = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font11) TextAlignment:NSTextAlignmentLeft Text:@"9999人"];
    [backView addSubview:ren];
    
    HotFire * huo = [HotFire new];
    [backView addSubview:huo];
    huo.inter = 3;
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->backView.mas_top).with.offset(LENGTH(5));
        make.left.equalTo(self->backView.mas_left).with.offset(LENGTH(5));
        make.right.equalTo(self->backView.mas_right).with.offset(-LENGTH(5));
        make.height.mas_equalTo(self->imageView.mas_width);
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->imageView.mas_bottom).with.offset(LENGTH(10));
        make.left.equalTo(self->backView.mas_left).with.offset(LENGTH(5));
        make.right.equalTo(self->backView.mas_right).with.offset(-LENGTH(5));
    }];
    
    [rentouImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self->backView.mas_bottom).with.offset(-LENGTH(10));
        make.left.equalTo(self->backView.mas_left).with.offset(LENGTH(5));
        make.height.mas_equalTo(LENGTH(18));
        make.width.mas_equalTo(LENGTH(18));
    }];
    
    [ren mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->rentouImage.mas_centerY);
        make.left.equalTo(self->rentouImage.mas_right).with.offset(LENGTH(12));
        make.right.equalTo(self->backView.mas_right).with.offset(-LENGTH(12));
    }];
    
    [huo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->rentouImage.mas_centerY);
        make.right.equalTo(self->backView.mas_right).with.offset(-LENGTH(14));
    }];
}

- (void)setModel:(LINSHI *)model{
    _model = model;
    imageView.image = UIIMAGE(ZHANWEITU);
    Title.text = model.title;
    [rentouImage sd_setImageWithURL:URLIMAGE(model.imageurl) placeholderImage:UIIMAGE(ZHANWEITU)];
    
}
@end
