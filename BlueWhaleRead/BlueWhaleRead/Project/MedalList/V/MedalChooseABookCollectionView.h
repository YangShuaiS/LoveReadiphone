//
//  MedalChooseABookCollectionView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseCollectionView.h"
typedef void(^ChooseMedalbool)(void);

@interface MedalChooseABookCollectionView : BaseCollectionView
@property(nonatomic,strong)NSMutableArray * itemArray;
@property(nonatomic,assign)NSInteger stylejia;//样式，1为带加号
@property(nonatomic,copy)ChooseMedalbool block;
@property (nonatomic, assign) NSInteger Booknumber;
@end
