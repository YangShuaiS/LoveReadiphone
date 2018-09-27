//
//  DTDanXuanCollectionViewCell.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/23.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MedalXQDelegate // 代理传值方法
@optional
- (void)PushFriendViewCOntroller:(PushModel *)model;
@end
@interface DTDanXuanCollectionViewCell : UICollectionViewCell<BaseViewDelegate>
@property (nonatomic,assign)DaTiStyle style;
@property (nonatomic,assign)NSInteger EndCell;

@property (nonatomic, weak) id <MedalXQDelegate> delegate;

@property(nonatomic,strong)BookProblemsModel * model;
@property(nonatomic,strong)SZLListModel * szorci;//识字或者识词文字and图model
@property(nonatomic,strong)SCLListMOdel * scorci;//识字或者识词文字and图model

@property (nonatomic,assign)DtLastOrNext dtdownstyle;

- (TiStyleModel *)cellTiMuModel;//

@property(nonatomic,strong)TiStyleModel * stylemodel;

@property(nonatomic,strong)NSString * bookName;
@end
