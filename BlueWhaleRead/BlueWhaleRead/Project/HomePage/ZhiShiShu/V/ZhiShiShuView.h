//
//  ZhiShiShuView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/17.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

@interface ZhiShiShuView : BaseView
@property(nonatomic,strong)ZhiShiShuDataModel * data;
@property(nonatomic,strong)BaseView * lastview;
- (void)huadong;
@end
