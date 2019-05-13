//
//  BuyUserPraiseView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/25.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyUserPraiseView.h"

@implementation BuyUserPraiseView

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
    self.backgroundColor = [UIColor whiteColor];
    BaseLabel * hytc = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFontCu(17) TextAlignment:NSTextAlignmentCenter Text:@"用户好评"];
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
    
    BaseLabel * subtitlelabel = [[BaseLabel alloc] initWithTxteColor:RGB(135,135,135) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"您给与的肯定，是我们永远的勋章"];
    subtitlelabel.numberOfLines = 0;
    [self addSubview:subtitlelabel];
    [subtitlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(hytc.mas_bottom).with.offset(LENGTH(10));
        make.left.mas_equalTo(ws).with.offset(LENGTH(27));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(27));
    }];
    
    UIImage * goodpl = UIIMAGE(@"组136");
    UIImageView * downimage = [UIImageView new];
    downimage.contentMode = UIViewContentModeScaleAspectFit;
    downimage.image = goodpl;
    [self addSubview:downimage];
    [downimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(subtitlelabel.mas_bottom).with.offset(LENGTH(10));
        make.centerX.mas_equalTo(ws);
        make.size.mas_equalTo(CGSizeMake(LENGTH(goodpl.size.width), LENGTH(goodpl.size.height)));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(10));
    }];
}

@end
