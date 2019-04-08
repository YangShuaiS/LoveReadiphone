//
//  ZhiShiShuClickDownView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/2.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ZhiShiShuClickDownView.h"
#import "ZhiShiShuShuViewController.h"
@implementation ZhiShiShuClickDownView{
    UIImageView * imageview;
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
    imageview = [UIImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(donghua)];
        [self addGestureRecognizer:tap];
}
- (void)setModel:(ZhiShiShuDownClickModel *)model{
    _model = model;
    NSString * imageurl = [NSString stringWithFormat:@"%@%@",ZSTXIMAGEURL,model.img];
    [imageview sd_setImageWithURL:[NSURL URLWithString:imageurl]];
    [imageview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(model.width*poinw);
        make.height.mas_equalTo(model.height*poinw);
    }];
}

- (void)donghua{
    if (_model.click_type == 1) {
        ZhiShiShuShuViewController  * vc = [ZhiShiShuShuViewController new];
        vc.itemid = _model.click_to_id;
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }
}
@end
