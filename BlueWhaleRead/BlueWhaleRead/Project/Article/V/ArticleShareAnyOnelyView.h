//
//  ArticleShareAnyOnelyView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/8.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
#pragma mark -------------- MenuStyle
typedef NS_ENUM(NSInteger, ArticleShareAnyOnelyViewStyle) {
    ArticleShareAnyOnelyViewStyleDZ = 0,//点赞
    ArticleShareAnyOnelyViewStyleSC = 1, //收藏
};
@interface ArticleShareAnyOnelyView : BaseView
- (instancetype)initWithImage:(NSString *)image
                        Title:(NSString *)string;

- (void)ClickDianZanWithImage:(NSString *)image
                        Title:(NSString *)string;

- (void)ClickShouCangWithImage:(NSString *)image
                        Title:(NSString *)string;
@end

NS_ASSUME_NONNULL_END
