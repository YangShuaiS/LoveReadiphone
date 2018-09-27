//
//  SCLListMOdel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/22.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface SCLListMOdel : BaseModel
@property (nonatomic, copy) NSString * GlossaryId;
@property (nonatomic, copy) NSString * GlossaryVocabulary;


@property (nonatomic, copy) NSString * literacy_id;
@property (nonatomic, copy) NSString * picture;
@property (nonatomic, copy) NSString * meaning;

@property (nonatomic, assign) NSInteger type;
@property (nonatomic, copy) NSString * vocabulary1;
@property (nonatomic, copy) NSString * vocabulary2;
@property (nonatomic, copy) NSString * vocabulary3;
@property (nonatomic, copy) NSString * vocabulary4;
@end
