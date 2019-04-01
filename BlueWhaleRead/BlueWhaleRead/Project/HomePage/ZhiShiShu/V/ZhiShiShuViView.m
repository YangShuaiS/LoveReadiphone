//
//  ZhiShiShuViView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuViView.h"

@implementation ZhiShiShuViView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    BaseLabel * lastlabel;
    WS(ws);
    for (ZhiShiShuViTypeModel * model in itemarray) {
        FLAnimatedImageView * imageview = [FLAnimatedImageView new];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageview];
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            if (!lastlabel) {
                make.left.mas_equalTo(ws);
            }else{
                make.left.mas_equalTo(lastlabel.mas_right).with.offset(LENGTH(10));
            }
            make.top.and.bottom.mas_equalTo(ws);
            make.width.mas_equalTo(LENGTH(26));
            make.height.mas_equalTo(LENGTH(26));
        }];
        NSString * imageurlvilogo = [NSString stringWithFormat:@"%@%@",ZSTX,model.img];
        [imageview sd_setImageWithURL:[NSURL URLWithString:imageurlvilogo]];
        
        BaseLabel * label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[BaseObject colorWithHexString:_textcolor Alpha:1] LabelFont:TextFontCu(11) TextAlignment:NSTextAlignmentLeft Text:model.name];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageview.mas_right).with.offset(LENGTH(5));
            make.centerY.mas_equalTo(ws);
        }];
        lastlabel = label;
    }
    [lastlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws);
    }];
}

@end
