//
//  BookXQReadThoughtModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface BookXQReadThoughtModel : BaseModel
@property (nonatomic, copy) NSString * author;
@property (nonatomic, copy) NSString * author_info;//作者学校 年级 由xxx老师推荐
@property (nonatomic, copy) NSString * book_id;
@property (nonatomic, copy) NSString * content;
@property (nonatomic, copy) NSString * school;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * article_flag;
@property (nonatomic, copy) NSString * article_img;
@property (nonatomic, copy) NSString * show_flag;


@property(nonatomic,assign) NSInteger cellstyle;


@end
