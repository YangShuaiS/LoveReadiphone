//
//  NKRClassificationCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NKRClassificationCollectionViewCell.h"

@implementation NKRClassificationCollectionViewCell{
    FLAnimatedImageView * bakimageview;
    
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
    
    bakimageview = [FLAnimatedImageView new];
    bakimageview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:bakimageview];
    [bakimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
}

- (void)setModel:(NKRClassificationModel *)model{
    _model = model;
    [bakimageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTXIMAGEURL,model.img]]];
   
}

@end
