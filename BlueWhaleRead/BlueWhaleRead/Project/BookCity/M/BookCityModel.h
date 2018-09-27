//
//  BookCityModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "BookFenjiModel.h"
#import "CityBookListModel.h"
#import "CityBadgeListModel.h"
#import "CityOrderBookModel.h"
#import "CityTypeListModel.h"
#import "CityReadBalanceModel.h"

#import "CityTopBiaoreadBalanceModel.h"
@interface BookCityModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property(nonatomic,assign)NSInteger totalCount;

@property(nonatomic,strong) NSMutableArray * bookList;//书列表
@property(nonatomic,strong) NSMutableArray * catalogList;//分类列表
@property(nonatomic,strong) NSMutableArray * levels;//等级列表
@property(nonatomic,strong) NSMutableArray * sort;//排序列表
//@property(nonatomic,strong) NSMutableArray * studentBalance;//学生平衡指数

@property(nonatomic,strong) CityTopBiaoreadBalanceModel * readBalance;
//@property(nonatomic,strong) CityReadBalanceModel * readBalance;

+ (void)InitializeModel;

@end
