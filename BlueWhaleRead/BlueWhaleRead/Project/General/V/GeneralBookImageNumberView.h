//
//  GeneralBookImageNumberView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

@interface GeneralBookImageNumberView : BaseView
- (instancetype)initWithLayOut:(UICollectionViewFlowLayout*)layout;

@property (nonatomic, assign) NSInteger allinter;
@property (nonatomic, assign) NSInteger haveinter;

@end
