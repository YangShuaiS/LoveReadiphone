//
//  LeiDaTuOnlyUser.h
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/18.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

/**
*  能力评估方向  基础评估、实践评估、专业评估、
*/
@interface ElementItem : NSObject
/**
 *  评估名字
 */
@property (copy, nonatomic) NSString *itemName;
/**
 *  评估ID 预留
 */
@property (copy, nonatomic) NSString *itemID;
/**
 *  代表该评估方向的颜色
 */
@property (strong, nonatomic) UIColor  *itemColor;
/**
 *  各项评估结果的百分比数组
 */
@property (strong, nonatomic) NSArray  *itemPercent;

@end

/**
 *  评估模型UI
 */
@interface Item : UIView
@property (strong, nonatomic) UIView *colorView;
@property (strong, nonatomic) UILabel *itemLabel;
@end

@interface LeiDaTuOnlyUser : BaseView
- (instancetype)initWithRadarElements:(NSArray *)elements lengthColor:(UIColor *)lengthColor;
- (void)addAbilitysWithElements:(NSArray <ElementItem*>*)elements;

@property (assign, nonatomic) BOOL downts;//下面提示

@end
