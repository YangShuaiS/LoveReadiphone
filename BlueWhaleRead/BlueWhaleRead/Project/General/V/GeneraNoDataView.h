//
//  GeneraNoDataView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#pragma mark -------------- 图表样式
typedef NS_ENUM(NSInteger, NoDtaaViewStyle) {
    NoDtaaViewStyleImageLabel = 0,
    NoDtaaViewStyleLabelClick = 1,
    NoDtaaViewStyleImageLabelClick=2,
    NoDtaaViewStyleUpData=3,
    NoDtaaViewStyleBiaoGe = 4,
};
typedef void(^GenBlockView)(void);
@interface GeneraNoDataView : BaseView
@property(nonatomic,assign)NoDtaaViewStyle style;
@property(nonatomic,strong) NSString * image;
@property(nonatomic,strong) NSString * titlename;
@property(nonatomic,strong) NSString * clickName;
@property(nonatomic,strong) NSMutableArray * imageArray;
@property(nonatomic,copy)GenBlockView block;

@end
