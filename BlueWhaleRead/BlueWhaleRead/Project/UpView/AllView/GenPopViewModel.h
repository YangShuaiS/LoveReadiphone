//
//  GenPopViewModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

@interface GenPopViewModel : BaseView
@property(nonatomic,copy)NSString * title;
@property(nonatomic,copy)NSString * subtitle;
@property(nonatomic,copy)NSString * imageurl;
@property(nonatomic,assign)NSInteger task_num;
@property (nonatomic, assign) CGFloat studentCompletedNum;//学生完成数
@property(nonatomic,copy)NSMutableArray * itemarray;
@property(nonatomic,strong)MedalListXqModel * model;


@end
