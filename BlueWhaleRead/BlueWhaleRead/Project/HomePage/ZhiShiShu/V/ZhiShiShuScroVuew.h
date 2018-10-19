//
//  ZhiShiShuScroVuew.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/17.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

@interface ZhiShiShuScroVuew : BaseView<UIScrollViewDelegate,NavDelegate>
@property(nonatomic,strong) NSString * itemid;

@end
