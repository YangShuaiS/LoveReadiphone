//
//  TKMytaskCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKMytaskCollectionViewCell.h"
#import "TKMytaskView.h"
@implementation TKMytaskCollectionViewCell{
    TKMytaskView * taskView;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    taskView = [TKMytaskView new];
    [self addSubview:taskView];
    [taskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)setModel:(TKMyListModel *)model{
    _model = model;
    taskView.model = model;
}
@end
