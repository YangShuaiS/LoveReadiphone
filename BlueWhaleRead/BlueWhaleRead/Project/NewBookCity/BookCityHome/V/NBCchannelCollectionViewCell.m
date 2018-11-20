//
//  NBCchannelCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBCchannelCollectionViewCell.h"

@implementation NBCchannelCollectionViewCell{
    FLAnimatedImageView * bakimageview;
    FLAnimatedImageView * moreimageview;

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
    self.backgroundColor = RGB(37,214,213);
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = LENGTH(8);
    
    bakimageview = [FLAnimatedImageView new];
    bakimageview.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:bakimageview];
    [bakimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    moreimageview = [FLAnimatedImageView new];
    moreimageview.image = UIIMAGE(@"查看更多");
    moreimageview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:moreimageview];
    [moreimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
        make.width.and.height.mas_equalTo(ws.mas_width).multipliedBy(0.3);
    }];
    moreimageview.hidden = YES;
}
- (void)setModel:(NBCclassificationModel *)model{
    _model = model;
    moreimageview.hidden = YES;
    bakimageview.hidden = NO;
    [bakimageview sd_setImageWithURL:URLIMAGE(model.banner_img)];
}
- (void)setGd:(NSString *)gd{
    moreimageview.hidden = NO;
    bakimageview.hidden = YES;
}
@end
