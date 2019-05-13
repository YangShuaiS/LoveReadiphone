//
//  LBTCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/22.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "LBTCollectionViewCell.h"

@implementation LBTCollectionViewCell{
    FLAnimatedImageView* imageview;}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    self.backgroundColor = [UIColor whiteColor];
    imageview = [FLAnimatedImageView new];
    imageview.contentMode = UIViewContentModeScaleToFill;
    imageview.layer.masksToBounds = YES;
    imageview.layer.cornerRadius = LENGTH(10);
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(0, LENGTH(17), 0, LENGTH(17)));
    }];
}

- (void)setModel:(LunboModel *)model{
    _model = model;
    [imageview sd_setImageWithURL:URLIMAGE(model.banner_img)];
}
- (void)setModelZT:(NBCclassificationModel *)modelZT{
    _modelZT = modelZT;
    NSString * url = [NSString stringWithFormat:@"%@%@",IMAGEURL,modelZT.banner_img];
    [imageview sd_setImageWithURL:[NSURL URLWithString:url]];

}
- (void)layoutSubviews{
    [super layoutSubviews];
}
@end
