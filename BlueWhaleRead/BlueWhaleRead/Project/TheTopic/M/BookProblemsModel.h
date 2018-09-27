//
//  BookProblemsModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface BookProblemsModel : BaseModel
@property (nonatomic, copy) NSString * ability;
@property (nonatomic, copy) NSString * book_id;
@property (nonatomic, assign) NSInteger correct_num;//正确数
@property (nonatomic, assign) NSInteger feedback_num;//反馈数
@property (nonatomic, copy) NSString * option1;
@property (nonatomic, copy) NSString * option2;
@property (nonatomic, copy) NSString * option3;
@property (nonatomic, copy) NSString * option4;
@property (nonatomic, copy) NSString * option5;
@property (nonatomic, copy) NSString * option6;
@property (nonatomic, copy) NSString * option7;
@property (nonatomic, copy) NSString * option8;
@property (nonatomic, copy) NSString * option9;
@property (nonatomic, copy) NSString * optionx;
@property (nonatomic, copy) NSString * question;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * status;
@property (nonatomic, assign) NSInteger type;
@end
