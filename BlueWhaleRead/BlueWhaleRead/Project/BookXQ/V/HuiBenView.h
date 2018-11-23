//
//  HuiBenView.h
//  DiaoYanDemoS
//
//  Created by 杨帅 on 2018/11/16.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
@interface HuiBenView : BaseView<UIScrollViewDelegate>
@property(nonatomic,strong)NSString * pngfile;
@property(nonatomic,strong)NSArray * pngarray;
@end
