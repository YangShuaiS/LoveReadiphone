//
//  TKIssueCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKIssueCollectionViewCell.h"
#import "TKIssueCollectView.h"
@implementation TKIssueCollectionViewCell
{
    TKIssueCollectView * taskView;
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
    taskView = [TKIssueCollectView new];
    [self addSubview:taskView];
    [taskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)setModel:(TKPstudentListModel *)model{
    _model = model;
    taskView.model = model;
}
@end
