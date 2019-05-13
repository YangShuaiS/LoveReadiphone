//
//  ShareZhiShiTuView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/17.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
@interface ShareZhiShiTuView : BaseView
- (instancetype)initWithType:(NSInteger)type;
@property(nonatomic,strong) FenXiangModel * model;
@property(nonatomic,assign)ZhiShiShuModel * zhishishuModel;
@property(nonatomic,assign)NSInteger now;//2完成

@end

NS_ASSUME_NONNULL_END
