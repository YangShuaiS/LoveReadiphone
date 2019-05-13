//
//  StareMoreView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/8.
//  Copyright © 2019 YS. All rights reserved.
//

#import "StareMoreView.h"
#import "StareFiveView.h"
@implementation StareMoreView{
    StareFiveView * offview;
    StareFiveView * onview;
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
    offview = [[StareFiveView alloc] initWithImage:UIIMAGE(@"星星-灰") Count:5];
    [self addSubview:offview];
    [offview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(60));
    }];
    
    onview = [[StareFiveView alloc] initWithImage:UIIMAGE(@"星星-明") Count:5];
    [self addSubview:onview];
    onview.layer.masksToBounds = YES;

    [onview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.bottom.mas_equalTo(ws);
        make.width.mas_equalTo(0);
    }];
}

- (void)setRedValue:(CGFloat)redValue{
    _redValue = redValue;
    CGFloat jianju = 0.0;
    if (redValue > 0 && redValue <= 1) {
        jianju = 0;
    }else if (redValue > 1 && redValue <= 2){
        jianju = LENGTH(2);
    }else if (redValue > 2 && redValue <= 3){
        jianju = LENGTH(4);
    }else if (redValue > 3 && redValue <= 4){
        jianju = LENGTH(6);
    }else if (redValue > 4 && redValue <= 5){
        jianju = LENGTH(8);
    }
    CGFloat onwidth = jianju + redValue * LENGTH(10);
    [onview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(onwidth);

    }];
}
@end
