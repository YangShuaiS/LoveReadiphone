//
//  NHNavView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/19.
//  Copyright © 2019 YS. All rights reserved.
//

#import "NHNavView.h"
#import "TKAlltaskViewController.h"
@implementation NHNavView
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
    self.backgroundColor = [UIColor whiteColor];
    BaseLabel * title = [[BaseLabel alloc] initWithTxteColor:RGB(10, 10, 10) LabelFont:TextFontCu(26) TextAlignment:NSTextAlignmentLeft Text:@"任务中心"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(16));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(16));
        make.left.mas_equalTo(ws).with.offset(LENGTH(17));
    }];
    
    BaseLabel * subtitle = [[BaseLabel alloc] initWithTxteColor:RGB(10, 10, 10) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentRight Text:@"参加新手任务，赢取超级大奖！"];
    [self addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(title);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(17)-LENGTH(15));
    }];

    
    UIImageView * rightImageView = [UIImageView new];
    rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    rightImageView.image = UIIMAGE(@"backhei");
    rightImageView.transform = CGAffineTransformMakeRotation(M_PI);
    [self addSubview:rightImageView];
    [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(subtitle);
        make.left.mas_equalTo(subtitle.mas_right).with.offset(LENGTH(1));
        make.width.mas_equalTo(LENGTH(7));
        make.height.mas_equalTo(LENGTH(14));
    }];
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(push)];
    [self addGestureRecognizer:tap];
}
- (void)push{
    TKAlltaskViewController * vc = [TKAlltaskViewController new];
    [[self viewController].navigationController pushViewController:vc animated:YES];
}
@end
