//
//  NBXQDownView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NBXQDownView.h"
#import "NBXQMENUView.h"
@implementation NBXQDownView{
    NBXQMENUView * men;

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
    self.backgroundColor = [UIColor whiteColor];
    WS(ws);
    UIView * topview = [UIView new];
    topview.backgroundColor = RGBA(219,215,214,0.9);
    topview.layer.masksToBounds = YES;
    topview.layer.cornerRadius = LENGTH(5)/2;
    [self addSubview:topview];
    [topview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(4));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(35));
        make.height.mas_equalTo(LENGTH(5));
    }];
    
    men = [NBXQMENUView new];
    [self addSubview:men];
    [men mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(10));
        make.left.and.right.and.bottom.mas_equalTo(ws);
    }];
    __weak NBXQDownView * blockSelf = self;
    [men setBlock:^(NSInteger inter) {
        blockSelf.block(inter);
    }];
    [men setBlocky:^(CGFloat scroY, BOOL end) {
        blockSelf.blocky(scroY, end);
    }];

}
- (void)setControllerArray:(NSMutableArray *)controllerArray{
    _controllerArray = controllerArray;
    if (men.titarray.count > 0) {
        men.controllerArray = controllerArray;
    }
}
- (void)setTitarray:(NSArray *)titarray{
    _titarray = titarray;
    if (men.titarray.count == 0) {
        men.titarray = titarray;
    }
}
- (void)setClickinter:(NSInteger)clickinter{
    _clickinter = clickinter;
    men.clickinter = clickinter;
}

- (void)setNfclick:(NSInteger)nfclick{
    _nfclick = nfclick;
    men.nfclick = nfclick;
}
@end
