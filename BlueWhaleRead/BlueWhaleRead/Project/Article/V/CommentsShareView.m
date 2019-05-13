//
//  CommentsShareView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/9.
//  Copyright © 2019 YS. All rights reserved.
//

#import "CommentsShareView.h"

@implementation CommentsShareView{
    UIImageView * leftimageview;
    UIImageView * Rightiamgeview;
    BaseLabel * label;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    leftimageview = [self addiamageview];
    leftimageview.image = UIIMAGE(@"未勾选");
    [self addSubview:leftimageview];
    [leftimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.centerY.mas_equalTo(ws);
        make.size.mas_equalTo(CGSizeMake(LENGTH(8), LENGTH(8)));
    }];
    
    Rightiamgeview = [self addiamageview];
    [self addSubview:Rightiamgeview];
    [Rightiamgeview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->leftimageview.mas_right).with.offset(LENGTH(8));
        make.top.and.bottom.mas_equalTo(ws);
        make.size.mas_equalTo(CGSizeMake(LENGTH(20), LENGTH(20)));
    }];
    
    label = [[BaseLabel alloc] initWithTxteColor:RGB(175,175,175) LabelFont:TextFont(10) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws);
        make.centerY.mas_equalTo(ws);
        make.left.mas_equalTo(self->Rightiamgeview.mas_right).with.offset(LENGTH(6));
    }];
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * qxtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [self addGestureRecognizer:qxtap];
}

-(void)setStyles:(NSInteger)styles{
    _styles = styles;
    if (styles == 0) {
        label.text = @"微信";
        Rightiamgeview.image = UIIMAGE(@"微信-2");
    }else{
        label.text = @"朋友圈";
        Rightiamgeview.image = UIIMAGE(@"朋友圈-2");
    }
    leftimageview.image = UIIMAGE(@"未勾选");
}

- (void)click{
    if (_zt == 0) {
        _zt = 1;
        if (_styles == 0) {
            Rightiamgeview.image = UIIMAGE(@"微信1");
        }else{
            Rightiamgeview.image = UIIMAGE(@"朋友圈1");
        }
        leftimageview.image = UIIMAGE(@"已勾选");

    }else{
        _zt = 0;
        if (_styles == 0) {
            Rightiamgeview.image = UIIMAGE(@"微信-2");
        }else{
            Rightiamgeview.image = UIIMAGE(@"朋友圈-2");
        }
        leftimageview.image = UIIMAGE(@"未勾选");
    }
    self.blocks(_styles);
}

- (void)setZt:(NSInteger)zt{
    _zt = zt;
    if (_zt == 0) {
        if (_styles == 0) {
            Rightiamgeview.image = UIIMAGE(@"微信-2");
        }else{
            Rightiamgeview.image = UIIMAGE(@"朋友圈-2");
        }
        leftimageview.image = UIIMAGE(@"未勾选");
    }else{
        if (_styles == 0) {
            Rightiamgeview.image = UIIMAGE(@"微信1");
        }else{
            Rightiamgeview.image = UIIMAGE(@"朋友圈1");
        }
        leftimageview.image = UIIMAGE(@"已勾选");
    }
}
- (UIImageView *)addiamageview{
    UIImageView * imageview =[ UIImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    return imageview;
}
@end
