//
//  BookTableViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "JKStarDisplayView.h"

@interface BookTableViewCell : BaseTableViewCell
@property(nonatomic,assign)BookCaseStyle bookCase;
@property(nonatomic,strong)JKStarDisplayView *jKStarDisplayView;
@property(nonatomic,strong)CityBookListModel * model;
@property(nonatomic,strong)AllBookListModel * allmodel;
@property(nonatomic,strong)UnreadBookModel * unreadBookModel;
@property(nonatomic,strong)ReadbookModel * readBookModel;

@property(nonatomic,strong)BaseView * lastview;

//写在Model后
- (void)CellColorStyleXZ;
@end
