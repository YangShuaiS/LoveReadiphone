//
//  ZhiShiShuView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/17.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef void(^click)(CGRect frame);
@interface ZhiShiShuView : BaseView
@property(nonatomic,strong)ZhiShiShuDataModel * data;
@property(nonatomic,strong)BaseView * lastview;
@property(nonatomic,assign)CGFloat sizey;
@property(nonatomic,copy)click block;

- (void)huadong;
@end
