//
//  GeneralBookImageNumberView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GeneralBookImageNumberView.h"
#import "GeneralBookImageNumberCollectionView.h"

@implementation GeneralBookImageNumberView

{
    GeneralBookImageNumberCollectionView * collectView;
}
- (instancetype)initWithLayOut:(UICollectionViewFlowLayout *)layout{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addView:layout];
    }
    return self;
}

- (void)addView:(UICollectionViewLayout*)layout{
    WS(ws);
    collectView = [[GeneralBookImageNumberCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:layout];
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(LENGTH(0));
        
    }];
}

- (void)setAllinter:(NSInteger)allinter{
    _allinter = allinter;
    collectView.allinter = allinter;
}
- (void)setHaveinter:(NSInteger)haveinter{
    _haveinter = haveinter;
    collectView.haveinter =haveinter;
    
}

@end
