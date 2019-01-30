//
//  ZhiShiShuNEiRong.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef void(^ClickBlock)(ZhiShiShuNeiRongModel*model);

@interface ZhiShiShuNEiRong : BaseView
@property(nonatomic,strong)ZhiShiShuNeiRongModel * neirong;
@property(nonatomic,strong)ZhiShiShuDataModel * textmodel;
@property(nonatomic,copy)ClickBlock block;

- (void)addimage;
- (void)yinying;
- (void)wuyinying;
@end

