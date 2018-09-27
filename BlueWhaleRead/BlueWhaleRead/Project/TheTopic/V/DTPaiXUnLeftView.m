//
//  DTPaiXUnLeftView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/24.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "DTPaiXUnLeftView.h"

@implementation DTPaiXUnLeftView{
    BaseLabel * mix;
}


-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    BaseLabel * max = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(148, 129, 42) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"第一"];
    max.backgroundColor = RGB(252, 228, 117);
    max.layer.masksToBounds = YES;
    max.layer.cornerRadius = LENGTH(17);
    [self addSubview:max];
    
    BaseLabel * dian = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(252,228,117) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"·\n·\n·\n"];
    dian.numberOfLines = 0;
    [self addSubview:dian];
    
    mix = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(148, 129, 42) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"最后"];
    mix.backgroundColor = RGB(252, 228, 117);
    mix.layer.masksToBounds = YES;
    mix.layer.cornerRadius = LENGTH(17);
    [self addSubview:mix];
    
    WS(ws);
    [max mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(0);
        make.left.mas_equalTo(ws).with.offset(0);
        make.right.mas_equalTo(ws).with.offset(0);
        make.height.mas_equalTo(LENGTH(34));
        make.width.mas_equalTo(LENGTH(34));
    }];
    
    [dian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
        make.top.mas_equalTo(max.mas_bottom);
        make.bottom.mas_equalTo(self->mix.mas_top);
    }];
//
    [mix mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws).with.offset(0);
        make.left.mas_equalTo(ws).with.offset(0);
        make.right.mas_equalTo(ws).with.offset(0);
        make.height.mas_equalTo(LENGTH(34));
        make.width.mas_equalTo(LENGTH(34));
    }];
    
}
- (void)setInter:(NSInteger)inter{
    switch (inter) {
        case 1:
            mix.text = @"第一";
            break;
        case 2:
            mix.text = @"第二";

            break;
        case 3:
            mix.text = @"第三";

            break;
        case 4:
            mix.text = @"第四";

            break;
        case 5:
            mix.text = @"第五";

            break;
        case 6:
            mix.text = @"第六";

            break;
        case 7:
            mix.text = @"第七";

            break;
        case 8:
            mix.text = @"第八";

            break;
        case 9:
            mix.text = @"第九";

            break;
        case 10:
            mix.text = @"第十";

            break;

        default:
            break;
    }
}
@end
