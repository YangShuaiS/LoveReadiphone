//
//  FoundGoodArticleModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface FoundGoodArticleModel : BaseModel
@property (nonatomic, copy) NSString * article_img;
@property (nonatomic, copy) NSString * author;
@property (nonatomic, copy) NSString * author_info;
@property (nonatomic, copy) NSString * book_id;
@property (nonatomic, copy) NSString * content;
@property (nonatomic, copy) NSString * ssid;

@end
