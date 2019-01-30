//
//  levelListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/3.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface levelListModel : BaseModel
@property (nonatomic, copy) NSString * img;
@property (nonatomic, copy) NSString * proverbImg;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * title;

@property (nonatomic, assign) NSInteger zt;//选中状态,1选中，2未选中昂

@end

NS_ASSUME_NONNULL_END
