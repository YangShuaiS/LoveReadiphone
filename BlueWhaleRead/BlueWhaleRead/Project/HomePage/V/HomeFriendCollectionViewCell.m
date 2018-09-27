//
//  HomeFriendCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeFriendCollectionViewCell.h"
#import "FiendOrMedalView.h"
@implementation HomeFriendCollectionViewCell{
    BaseView * backView;
    FLAnimatedImageView * imageView;
    BaseLabel * Title;
    
    BaseView * touxiangview;
    
    FiendOrMedalView * touxiang;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    
    backView = [BaseView new];
    backView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:backView];
    
    imageView = [FLAnimatedImageView new];
    imageView.layer.shadowOpacity = 0.4;
    imageView.layer.shadowColor = [UIColor blackColor].CGColor;
    imageView.layer.shadowRadius = 2.f;
    imageView.layer.shadowOffset = CGSizeMake(0,0);
    //保障不变形，如果无其他形状，可不改
//    imageView.layer.masksToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [backView addSubview:imageView];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@""];
    Title.numberOfLines = 2;
    [backView addSubview:Title];
    
//    touxiangview = [BaseView new];
//    [self.contentView addSubview:touxiangview];
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->backView.mas_top).with.offset(2);
        make.left.equalTo(self->backView.mas_left).with.offset(2);
        make.right.equalTo(self->backView.mas_right).with.offset(-2);
        make.height.mas_equalTo(LENGTH(141.5));
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->imageView.mas_bottom).with.offset(LENGTH(13.5));
        make.left.equalTo(self->backView.mas_left).with.offset(0);
        make.right.equalTo(self->backView.mas_right).with.offset(0);
    }];
//    
//    [touxiangview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self->backView.mas_bottom).with.offset(0);
//        make.left.mas_equalTo(ws);
//        make.right.mas_equalTo(ws);
//        make.height.mas_equalTo(25);
//    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(LENGTH(22),LENGTH(40.5));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(10);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(10);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    touxiang = [[FiendOrMedalView alloc] initWithLayOut:flowLayout];
    [touxiang BanSliding];
    [self.contentView addSubview:touxiang];
    [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(20));
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(40.5));
        make.bottom.mas_equalTo(ws.mas_bottom).with.offset(-LENGTH(14.5));
    }];
    
//    NSMutableArray * touxiangarray = [NSMutableArray array];
//    for (int i = 0 ; i < 3; i++) {
//        FLAnimatedImageView * touxiang = [FLAnimatedImageView new];
//        touxiang.backgroundColor = RANDOMCOLOR;
//        touxiang.layer.cornerRadius = LENGTH(25/2);
//        touxiang.layer.masksToBounds = YES;
//        [touxiangarray addObject:touxiang];
//    }
//    FLAnimatedImageView * lastTX;
//    for (int i = 0; i < touxiangarray.count; i++) {
//        FLAnimatedImageView * view = touxiangarray[i];
//        [touxiangview addSubview:view];
//        if (!lastTX) {
//            [view mas_makeConstraints:^(MASConstraintMaker *make) {
//                //                make.left.equalTo(self->scrollView.mas_left).with.offset(0);
//                //                make.right.equalTo(self->scrollView.mas_right).with.offset(0);
//                make.bottom.equalTo(self->touxiangview.mas_bottom).with.offset(0);
//                //                make.top.equalTo(ws.view).with.offset(0);
//                make.left.equalTo(self->touxiangview.mas_left).with.offset(0);
//                make.width.mas_equalTo(LENGTH(25));
//                make.height.mas_equalTo(LENGTH(25));
//            }];
//        }else{
//            [view mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.bottom.equalTo(self->touxiangview.mas_bottom).with.offset(0);
//                make.left.equalTo(lastTX.mas_right).with.offset(LENGTH(10));
//                make.width.mas_equalTo(LENGTH(25));
//                make.height.mas_equalTo(LENGTH(25));
//            }];
//        }
//        if (i == touxiangarray.count-1) {
//            [view mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.right.equalTo(self->touxiangview.mas_right).with.offset(0);
//            }];
//        }
//        lastTX = view;
//    }
    
}
- (void)setNav:(UINavigationController *)nav{
    touxiang.nav = nav;
}
-  (void)color{
    
//    backView.backgroundColor = RANDOMCOLOR;
//    imageView.backgroundColor = RANDOMCOLOR;
}
- (void)setModel:(BookFriendModel *)model{
    [imageView sd_setImageWithURL:URLIMAGE(model.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    Title.text = model.name;
    NSMutableArray * array = [NSMutableArray array];
    [array addObjectsFromArray:model.studentList];
    touxiang.itemarray = array;
}
@end
