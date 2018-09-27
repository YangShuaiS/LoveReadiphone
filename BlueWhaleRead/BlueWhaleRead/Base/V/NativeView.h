//
//  NativeView.h
//  BoVolumes
//
//  Created by 杨帅 on 2018/4/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#import "BaseLabel.h"
#import "BaseButton.h"
#import "BaseTableView.h"
@protocol NavDelegate // 代理传值方法
- (void)NavLeftClick;
- (void)NavCenterClick;
- (void)NavRightClick;
@end
@interface NativeView : BaseView
- (instancetype)initWithLeftImage:(NSString *)image
                            Title:(NSString *)title
                       RightTitle:(NSString *)rightTitle
                      NativeStyle:(NavStyle)nativeStyle;
@property(nonatomic,assign)NavStyle nativeStyle;
@property (nonatomic, weak) id <NavDelegate> delegate;
@property(nonatomic,strong) NSString * title;

@end
