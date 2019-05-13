//
//  ZhiShiShuShareView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/1.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZhiShiShuShareView : BaseView
@property(nonatomic,strong)NSString * zstid;//知识图id

@property(nonatomic,assign)NSInteger type;//知识网ort脉络图  1   2

@property(nonatomic,assign)ZhiShiShuModel * model;
@end

NS_ASSUME_NONNULL_END
