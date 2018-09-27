//
//  DTLianXUanXIang.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "DTLianXUanXIang.h"

@implementation DTLianXUanXIang{
    BaseLabel * Title;
}

- (void)weixuanzhong{
    self.backgroundColor = RGB(255, 255, 255);
    Title.textColor = RGB(85,137,230);
}
- (void)xuanzhong{
    self.backgroundColor = RGB(254, 165, 79);
    Title.textColor = RGB(255,255,255);

}
- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = RGB(255, 255, 255);
        self.zhuangtai = NO;
        [self addView];
    }
    return self;
}
- (void)addView{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = LENGTH(10);
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(85, 137, 230) LabelFont:TextFontCu(15) TextAlignment:NSTextAlignmentLeft Text:@"案我是答案我是答案我是答案我是答案案我是答案我是答案我是答案我是答"];
    Title.numberOfLines = 0;
    [self addSubview:Title];
    
    WS(ws);
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(LENGTH(4));
        make.right.equalTo(ws).with.offset(-LENGTH(4));
        make.bottom.equalTo(ws).with.offset(0);
    }];
}
- (void)setName:(NSString *)name{
    _name = name;
    Title.text = name;
//    Title.numberOfLines = 0;

}


@end
