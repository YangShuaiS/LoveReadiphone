//
//  BuyAllModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/24.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseModel.h"
#import "BuyInterestsModel.h"
#import "BuyPackage.h"
#import "PackageTypeModel.h"
#import "BuyorderModel.h"
#import "OrderModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BuyAllModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, strong) NSMutableArray *productInfoIos;//价格
@property (nonatomic, strong) MyUserInfo * student;//0否
@property (nonatomic, strong) NSMutableArray *bookList;//精选好书
@property (nonatomic, strong) NSMutableArray *yuBookList;//推荐好书
@property (nonatomic, strong) NSMutableArray *yuBannerList;//

+ (void)InitializeModel;

@end

NS_ASSUME_NONNULL_END
