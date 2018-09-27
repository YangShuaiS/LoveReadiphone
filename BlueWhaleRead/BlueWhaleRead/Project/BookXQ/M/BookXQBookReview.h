//
//  BookXQBookReview.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface BookXQBookReview : BaseModel


@property (nonatomic, copy) NSString * author;
@property (nonatomic, copy) NSString * book_id;
@property (nonatomic, copy) NSString * content;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * status;

@property (nonatomic, assign) NSInteger cellstyle;
@end
