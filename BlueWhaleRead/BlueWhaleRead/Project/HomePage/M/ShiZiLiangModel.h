//
//  ShiZiLiangModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/22.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "SZLListModel.h"
@interface ShiZiLiangModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, copy) NSString * LiteracyId;//字id
@property (nonatomic, copy) NSString * LiteracyMeaning;//字意思
@property (nonatomic, copy) NSString * LiteracyPicture;//字图片
@property (nonatomic, copy) NSString * LiteracyScore;//识字数


@property (nonatomic, assign) NSInteger TestTime;//测试次数

@property (nonatomic, strong) NSMutableArray *FakeWord;
+ (void)InitializeModel;

@end
