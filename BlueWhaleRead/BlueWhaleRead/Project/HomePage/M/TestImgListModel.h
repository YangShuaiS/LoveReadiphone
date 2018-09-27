//
//  TestImgListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface TestImgListModel : BaseModel
@property(nonatomic,copy)NSString * item_id;
@property(nonatomic,copy)NSString * logo;
@property(nonatomic,copy)NSString * seq;


@property(nonatomic,copy)NSString * image;
@property(nonatomic,copy)NSString * title;
@property(nonatomic,assign)NSInteger style;//0无蒙版，1有
@end
