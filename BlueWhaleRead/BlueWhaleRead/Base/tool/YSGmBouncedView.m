//
//  YSGmBouncedView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/23.
//  Copyright © 2019 YS. All rights reserved.
//

#import "YSGmBouncedView.h"

@implementation YSGmBouncedView{
    UIView * backView;
    BaseLabel * label;
    UIImageView * imageView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
- (instancetype)initWithMessage:(NSString *)message{
    self = [super init];
    if (self) {
        [self addview:message];
    }
    return self;
}
- (void)addview:(NSString *)message{
    WS(ws);
    self.backgroundColor = [UIColor clearColor];
    backView = [UIView new];
    backView.backgroundColor = RGB(0, 0, 0);
    backView.layer.masksToBounds = YES;
    backView.layer.cornerRadius = LENGTH(5);
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
    }];
    
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    effectView.userInteractionEnabled = NO;
    [backView addSubview:effectView];
    [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->backView);
    }];
    
    label = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFontCu(LENGTH(15)) TextAlignment:NSTextAlignmentCenter Text:message];
    [backView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->backView).with.insets(UIEdgeInsetsMake(LENGTH(5), LENGTH(5), LENGTH(5), LENGTH(5)));
    }];
}
- (void)AddWindow{
    WS(ws);
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo([UIApplication sharedApplication].delegate.window);
    }];
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [ws remoview];
    });
}

- (void)remoview{
    [UIView animateWithDuration:0.5 animations:^{
        self->backView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (instancetype)initWithMessage:(NSString *)message
                      ImageView:(NSString *)image{
    self = [super init];
    if (self) {
        [self addview:message ImageView:image];
    }
    return self;
}

- (void)addview:(NSString *)message ImageView:(NSString *)image{
    WS(ws);
    self.backgroundColor = [UIColor clearColor];
    backView = [UIView new];
    backView.backgroundColor = RGB(0, 0, 0);
    backView.layer.masksToBounds = YES;
    backView.layer.cornerRadius = LENGTH(5);
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
    }];
    
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    effectView.userInteractionEnabled = NO;
    [backView addSubview:effectView];
    [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->backView);
    }];
    
    imageView = [UIImageView new];
    imageView.image = UIIMAGE(image);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [backView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->backView).with.offset(LENGTH(5));
        make.centerX.mas_equalTo(self->backView);
        make.size.mas_equalTo(CGSizeMake(LENGTH(18), LENGTH(18)));
    }];
    
    label = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFontCu(LENGTH(15)) TextAlignment:NSTextAlignmentCenter Text:message];
    [backView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageView.mas_bottom).with.offset(LENGTH(5));
        make.left.mas_equalTo(self->backView).with.offset(LENGTH(5));
        make.right.mas_equalTo(self->backView).with.offset(-LENGTH(5));
        make.bottom.mas_equalTo(self->backView).with.offset(-LENGTH(5));
    }];
}
- (void)AddWindowRemo:(BOOL)remo{
    WS(ws);
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo([UIApplication sharedApplication].delegate.window);
    }];
    if (remo == YES) {
        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [ws remoview];
        });
    }

}
@end
