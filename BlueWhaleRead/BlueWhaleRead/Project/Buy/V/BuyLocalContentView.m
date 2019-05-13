//
//  BuyLocalContentView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/25.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyLocalContentView.h"

@implementation BuyLocalContentView
- (instancetype)initWithTitle:(NSString *)title
             SubTitle:(NSString *)subtitle
            DownImage:(NSString *)image{
    self = [super init];
    if (self) {
        [self addViewTitle:title SubTitle:subtitle DownImage:image];
    }
    return self;
}
- (void)addViewTitle:(NSString *)title
            SubTitle:(NSString *)subtitle
           DownImage:(NSString *)image{
    WS(ws);
    self.backgroundColor = [UIColor whiteColor];
    BaseLabel * hytc = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFontCu(17) TextAlignment:NSTextAlignmentCenter Text:title];
    [self addSubview:hytc];
    [hytc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(ws).with.offset(LENGTH(30));
    }];
    
    UIImageView * lefthg = [UIImageView new];
    lefthg.contentMode = UIViewContentModeScaleAspectFit;
    lefthg.image = UIIMAGE(@"皇冠");
    [self addSubview:lefthg];
    [lefthg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(hytc);
        make.right.mas_equalTo(hytc.mas_left).with.offset(-LENGTH(6));
        make.size.mas_equalTo(CGSizeMake(LENGTH(21), LENGTH(13)));
    }];
    
    UIImageView * righthg = [UIImageView new];
    righthg.contentMode = UIViewContentModeScaleAspectFit;
    righthg.image = UIIMAGE(@"皇冠");
    [self addSubview:righthg];
    [righthg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(hytc);
        make.left.mas_equalTo(hytc.mas_right).with.offset(LENGTH(6));
        make.size.mas_equalTo(CGSizeMake(LENGTH(21), LENGTH(13)));
    }];
    
    BaseLabel * subtitlelabel = [[BaseLabel alloc] initWithTxteColor:RGB(135,135,135) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:subtitle];
    subtitlelabel.numberOfLines = 0;
    [self addSubview:subtitlelabel];
    [subtitlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(hytc.mas_bottom).with.offset(LENGTH(10));
        make.left.mas_equalTo(ws).with.offset(LENGTH(27));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(27));
    }];
    
    UIImage * images = UIIMAGE(image);
    UIImageView * imageView = [UIImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = images;
    CGFloat imhei = WIDTH/images.size.width*1.0*images.size.height;
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(subtitlelabel.mas_bottom).with.offset(LENGTH(10));
        make.left.and.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(10));
        make.height.mas_equalTo(imhei);
    }];
}
@end
