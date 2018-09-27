//
//  GeneralMedalView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GeneralMedalView.h"
#import "JInDuHeadImage.h"

@implementation GeneralMedalView{
    BaseView * bacViwe;
    JInDuHeadImage * MyImage;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addView];
    }
    return self;
}
- (void)addView{
    WS(ws);
    bacViwe = [BaseView new];
    bacViwe.backgroundColor = RGBA(255, 255, 255, 0);
    bacViwe.layer.masksToBounds = YES;
    [self addSubview:bacViwe];
    [bacViwe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    MyImage = [JInDuHeadImage new];
    MyImage.touxiang.image = UIIMAGE(ZHANWEITUXZ);
    MyImage.layer.masksToBounds = YES;
    MyImage.progress = 0;//进度
    [bacViwe addSubview:MyImage];
    [MyImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(2));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(2));
        make.top.mas_equalTo(ws).with.offset(LENGTH(2));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(2));

//        make.center.mas_equalTo(self->bacViwe);
//        make.width.mas_equalTo(self->bacViwe).with.offset(-LENGTH(10));
//        make.height.mas_equalTo(self->MyImage.mas_width).multipliedBy(0.8678);
//
//
        
//        make.edges.mas_equalTo(ws);
    }];
    
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    bacViwe.layer.cornerRadius = bacViwe.frame.size.width/2;
    MyImage.progressWidth = MyImage.frame.size.width/2;

}

- (void)setModel:(MedalBadgeListModel *)model{
    _model = model;
    [MyImage.touxiang sd_setImageWithURL:URLIMAGE(model.logo) placeholderImage:UIIMAGE(ZHANWEITUXZ)];

}
- (void)setImages:(NSString *)images{
    _images = images;
    [MyImage.touxiang sd_setImageWithURL:URLIMAGE(_images) placeholderImage:UIIMAGE(ZHANWEITUXZ)];

}
- (void)setFloatjidu:(CGFloat)floatjidu{
    _floatjidu = floatjidu;
    MyImage.progress = floatjidu;//进度
}

- (void)setUpjl:(NSInteger)upjl{
    _upjl = upjl;
    bacViwe.backgroundColor = RGBA(255, 255, 255, 0.8);
    MyImage.upjl = _upjl;
    
}
@end
