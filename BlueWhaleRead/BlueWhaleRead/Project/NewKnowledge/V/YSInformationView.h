//
//  YSInformationView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface YSInformationView : BaseView
typedef NS_ENUM(NSInteger, YSInformationViewStyle) {
    YSInformationViewStyleBigImageAmdOndTwoTitle = 1,
    YSInformationViewStyleSomleImageAndOnetTitle = 2,
    YSInformationViewStyleSomleImageAndTwotTitle = 3,
};
@property (nonatomic,assign)  YSInformationViewStyle style;
@property(nonatomic,strong)NKRKnowledgeModel * model;

@end

NS_ASSUME_NONNULL_END
