//
//  GFAddressPicker.h
//  地址选择器
//
//  Created by 1暖通商城 on 2017/5/10.
//  Copyright © 2017年 1暖通商城. All rights reserved.
//

#import "BaseView.h"
@protocol GFAddressPickerDelegate <NSObject>
@optional
/** 代理方法返回省市区*/
- (void)GFAddressPickerWithProvince:(UserCitySmolModel *)province
                                          city:(UserCitySmolModel *)city area:(UserCitySmolModel *)area;
/** 取消代理方法*/
- (void)GFAddressPickerCancleAction;
@end
@interface GFAddressPicker : BaseView

/** 省 */
@property (nonatomic, strong) NSString *province;
/** 市 */
@property (nonatomic, strong) NSString *city;
/** 区 */
@property (nonatomic, strong) NSString *area;
@property (nonatomic, weak) id<GFAddressPickerDelegate> delegate;
- (void)updateAddressAtProvince:(NSString *)province city:(NSString *)city town:(NSString *)town;
/** 内容字体 */
@property (nonatomic, strong) UIFont *font;
@end
