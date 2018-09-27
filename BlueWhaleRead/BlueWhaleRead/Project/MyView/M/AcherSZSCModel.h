//
//  AcherSZSCModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface AcherSZSCModel : BaseModel
//@property(nonatomic,copy)NSString * classAllLiteracy;
//@property(nonatomic,copy)NSString * classAllGlossary;
@property(nonatomic,assign)NSInteger classAllLiteracy;
@property(nonatomic,assign)NSInteger classAllGlossary;
@property(nonatomic,assign)CGFloat standard;
@property(nonatomic,assign)NSInteger maxLiteracyNum;
@property(nonatomic,assign)NSInteger maxGlossaryNum;

@property(nonatomic,assign)NSInteger myLiteracy;
@property(nonatomic,assign)NSInteger myGlossary;


@property(nonatomic,strong) NSMutableArray * myMonthGlossary;
@property(nonatomic,strong) NSMutableArray * myMonthLiteracy;

@end
