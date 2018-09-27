//
//  ShiCiLiangModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/22.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "SCLListMOdel.h"
@interface ShiCiLiangModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, copy) NSString * GlossaryId;//字id
@property (nonatomic, copy) NSString * GlossaryMeaning;//字意思
@property (nonatomic, copy) NSString * GlossaryPicture;//字图片
@property (nonatomic, copy) NSString * GlossaryScore;//识字数


@property (nonatomic, assign) NSInteger TestTime;//测试次数

@property (nonatomic, strong) NSMutableArray *FakeVocabulary;
+ (void)InitializeModel;
@end
