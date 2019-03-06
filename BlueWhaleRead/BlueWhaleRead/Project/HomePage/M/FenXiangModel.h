//
//  FenXiangModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface FenXiangModel : BaseModel
@property (nonatomic, copy) NSString * content;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * img;
@property (nonatomic, copy) NSString * status;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * type;
@property (nonatomic, copy) NSString * url;



@property (nonatomic, copy) NSString * share_img;
@property (nonatomic, copy) NSString * share_preview_img;

@end
