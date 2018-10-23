//
//  UserLoginClickView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserLoginClickView.h"

@implementation UserLoginClickView{
    NSString * title;
    BaseLabel * dl;
    BaseView * backview;
}

- (instancetype)initWithImage:(NSString *)image
                         Text:(NSString *)text
                        Style:(UserLoginClickStyle)userstyle{
    self = [super init];
    if (self) {
        title = text;
        [self addview:userstyle];
    }
    return self;
}
- (void)addview:(UserLoginClickStyle)userstyle{
    switch (userstyle) {
        case UserLoginClickStyleNoml:
            [self addNoml];
            break;
        case UserLoginClickStyleImgAndTitle:

            break;
        default:
            break;
    }
}
- (void)addNoml{
    WS(ws);
    backview = [BaseView new];
    backview.backgroundColor = RGB(82,199,198);
    backview.layer.cornerRadius = LENGTH(25);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    backview.layer.shadowColor = RGB(82, 199, 198).CGColor;
    backview.layer.shadowOffset = CGSizeMake(0,2.5);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    backview.layer.shadowRadius = LENGTH(15);
    backview.layer.shadowOpacity = 0.3;
    
    dl = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:title];
    [backview addSubview:dl];
    [dl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->backview);
    }];
    backview.userInteractionEnabled = YES;
    //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
    //将手势添加到需要相应的view中去
    [backview addGestureRecognizer:tapGesture1];
}
- (void)whitherBacler{
    backview.backgroundColor = RGB(255,255,255);
    backview.layer.shadowColor = RGB(1, 39, 39).CGColor;
    backview.layer.shadowOffset = CGSizeMake(0,5);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    backview.layer.shadowRadius = LENGTH(13);
    backview.layer.shadowOpacity = 0.07;
    dl.textColor = RGB(56,180,179);
}
- (void)tapGesture1{
    self.block();
}

@end
