//
//  NBCmenuView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef NS_ENUM(NSInteger, NBCmenuViewStyle) {
    NBCmenuViewStyleRefinish = 1,//
    NBCmenuViewStyleimage = 2,//
};
typedef void(^GenBlock)(void);
@interface NBCmenuView : BaseView
@property(nonatomic,copy)GenBlock block;
@property(nonatomic,assign)NBCmenuViewStyle styles;
@property(nonatomic,strong)BaseLabel * label;

@end
