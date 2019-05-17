//
//  knowledgeGradeModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/20.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "KnowledgegraphlistModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface knowledgeGradeModel : BaseModel
@property (nonatomic, copy) NSString * _id;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, strong) knowledgeGradeModel * knowledge;
@property (nonatomic, copy) NSString * knowledge_info;
@property (nonatomic, copy) NSString * knowledge_width_img;

@end

NS_ASSUME_NONNULL_END
