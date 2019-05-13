//
//  ArticleShareAnyOnelyView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/8.
//  Copyright © 2019 YS. All rights reserved.
//

#import "ArticleShareAnyOnelyView.h"

@implementation ArticleShareAnyOnelyView{
    UIImageView * imageview;
    BaseLabel * titleLabel;
}

- (instancetype)initWithImage:(NSString *)image
                        Title:(NSString *)string{
    self = [super init];
    if (self) {
        [self addviewWithImage:image Title:string];
    }
    return self;
}
- (void)addviewWithImage:(NSString *)image
                   Title:(NSString *)string{
    WS(ws);
    UIView * backview = [UIView new];
    backview.layer.cornerRadius = LENGTH(16.5);
    backview.layer.borderWidth = 1;
    backview.layer.borderColor = RGB(228,228,228).CGColor;
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    imageview = [UIImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.image = UIIMAGE(image);
    [backview addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backview).with.offset(LENGTH(14));
        make.centerY.mas_equalTo(ws);
        make.size.mas_equalTo(CGSizeMake(LENGTH(20), LENGTH(20)));
    }];
    
    titleLabel = [[BaseLabel alloc] initWithTxteColor:RGB(27, 27, 27) LabelFont:TextFont(10) TextAlignment:NSTextAlignmentLeft Text:string];
    [backview addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->imageview.mas_right).with.offset(LENGTH(5));
        make.right.mas_equalTo(backview).with.offset(-LENGTH(5));
        make.centerY.mas_equalTo(ws);
    }];
}

- (void)ClickDianZanWithImage:(NSString *)image
                        Title:(NSString *)string{
    imageview.image = UIIMAGE(image);
    titleLabel.text = string;
}

@end
