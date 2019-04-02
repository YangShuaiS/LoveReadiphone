//
//  ZhiShiShuDataModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface ZhiShiShuDataModel : BaseModel
@property(nonatomic,strong)NSString * _id;//id
@property(nonatomic,strong)NSMutableArray * axis;//h竖轴
@property(nonatomic,strong)NSString * bg_color;//背景颜色
@property(nonatomic,strong)NSString * bg_img;//背景图
@property(nonatomic,strong)NSString * created_at;//创建时间
@property(nonatomic,strong)NSString * name;//体系名称
@property(nonatomic,strong)NSMutableArray * point;//内容
@property(nonatomic,strong)NSMutableArray * relation;//线
@property(nonatomic,strong)NSString * style_id;//样式id
@property(nonatomic,strong)NSString * txt_color;//字颜色
@property(nonatomic,strong)NSString * updated_at;//更新时间
@property(nonatomic,strong)NSString * knowledge_info;//最上面文本
@property(nonatomic,strong)NSString * knowledge_type;//1为  体系   2为知识图

@property(nonatomic,strong)NSMutableArray * line_type;//线样式
@property(nonatomic,strong)NSMutableArray * relation_type;//关系样式
@property(nonatomic,strong)NSMutableArray * vi_type;//
@property(nonatomic,strong)NSMutableArray * arrow;
@property(nonatomic,strong)NSMutableArray * click;//最下面数组

@property (nonatomic, assign) NSInteger is_collect;//0未收昂


@property (nonatomic, strong) NSMutableArray *knowledgeGrade;//体系title
@property (nonatomic, strong) NSMutableArray *bookList;//书
@property (nonatomic, strong) NSMutableArray *bannerKnowledgeList;//相关体系
@end
