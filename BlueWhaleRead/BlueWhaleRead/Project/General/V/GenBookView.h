//
//  GenBookView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#import "JKStarDisplayView.h"
@interface GenBookView : BaseView
@property(nonatomic,assign)BookCaseStyle bookCase;
@property(nonatomic,strong)JKStarDisplayView *jKStarDisplayView;
@property(nonatomic,strong)CityBookListModel * model;
@property(nonatomic,strong)AllBookListModel * allmodel;
@property(nonatomic,strong)UnreadBookModel * unreadBookModel;
@property(nonatomic,strong)ReadbookModel * readBookModel;
@end
