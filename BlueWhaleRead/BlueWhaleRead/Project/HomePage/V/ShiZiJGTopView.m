//
//  ShiZiJGTopView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ShiZiJGTopView.h"

@implementation ShiZiJGTopView{
    FLAnimatedImageView * imageView;
    BaseLabel * szl;
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
    imageView = [FLAnimatedImageView new];
    imageView.image = UIIMAGE(ZHANWEITU);
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    szl = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(252, 87, 119) LabelFont:TextFont(30) TextAlignment:NSTextAlignmentCenter Text:@"小朋友你的识字量为："];
    [self addSubview:szl];
    [szl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(ws.mas_top).with.offset(LENGTH(58));
    }];
    
    NSString * string = @"小朋友你的识字量为：";
    NSString * szltext = @"200";
    NSString * szlall = [NSString stringWithFormat:@"%@字",szltext];
    NSString * onetextstr = [NSString stringWithFormat:@"%@%@",string,szlall];
    AttributedStringModel * model = [AttributedStringModel new];
    model.textString = onetextstr;
    model.bianString = szlall;
    model.fount = 40;
    NSArray * modelarray = @[model];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    szl.attributedText = AttributedStr;
}

@end
