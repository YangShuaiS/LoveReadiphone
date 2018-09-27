//
//  BookCityXunZhang.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookCityXunZhang.h"

@implementation BookCityXunZhang{
    FLAnimatedImageView * imageView;
    BaseLabel * names;
    UIView * view;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addView];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    view.layer.cornerRadius = self.frame.size.height/2;
}
- (void)addView{
    view = [UIView new];
    view.backgroundColor = RGB(226,238,238);
//    view.layer.cornerRadius = LENGTH(18);
    view.layer.masksToBounds = YES;
    [self addSubview:view];
    
    imageView = [FLAnimatedImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    imageView.backgroundColor = RANDOMCOLOR;
    //    leftImage.layer.borderWidth = 5;
    //    leftImage.layer.borderColor = [UIColor blackColor].CGColor;
//    imageView.layer.cornerRadius = LENGTH(13);
//    imageView.layer.masksToBounds = YES;
    [view addSubview:imageView];
    
    names = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:@"勋章名"];
    [view addSubview:names];
    WS(ws);
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left).with.offset(LENGTH(6));
        make.centerY.mas_equalTo(view.mas_centerY);
        make.width.mas_equalTo(LENGTH(26));
        make.height.mas_equalTo(self->imageView.mas_width).multipliedBy(1);
//        make.height.mas_equalTo(LENGTH(26));
    }];
    
    [names mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->imageView.mas_right).with.offset(LENGTH(0));
        make.right.mas_equalTo(view.mas_right).with.offset(LENGTH(-6));
        make.centerY.mas_equalTo(view.mas_centerY);
    }];
}
- (void)setModel:(CityBadgeListModel *)model{
    _model = model;
    [imageView sd_setImageWithURL:URLIMAGE(model.min_logo) placeholderImage:UIIMAGE(ZHANWEITUXZ)];
    names.text = model.name;
    
}
@end
