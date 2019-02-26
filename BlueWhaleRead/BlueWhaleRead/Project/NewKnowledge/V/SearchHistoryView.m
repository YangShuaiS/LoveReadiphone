//
//  SearchHistoryView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/15.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "SearchHistoryView.h"
#import "SearchHistoryCollectionView.h"
#import "SearchFlowLayout.h"
@implementation SearchHistoryView{
    SearchHistoryCollectionView * collectView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    BaseLabel * title = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFontCu(14) TextAlignment:NSTextAlignmentLeft Text:@"历史搜索"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(17));
        make.top.mas_equalTo(ws).with.offset(LENGTH(14));
    }];
    
    UIImageView * imageView = [UIImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = UIIMAGE(@"形状3");
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
        make.centerY.mas_equalTo(title);
        make.width.mas_equalTo(LENGTH(12));
        make.height.mas_equalTo(LENGTH(12));
    }];
    
    UIView * click = [UIView new];
    [self addSubview:click];
    [click mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.bottom.mas_equalTo(title.mas_bottom).with.offset(LENGTH(17));
        make.right.mas_equalTo(ws);
        make.left.mas_equalTo(imageView.mas_left).with.offset(-LENGTH(17));
    }];
    
    click.userInteractionEnabled = YES;
    UITapGestureRecognizer *backtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    //将手势添加到需要相应的view中去
    [click addGestureRecognizer:backtap];
    
    SearchFlowLayout *flowLayout = [[SearchFlowLayout alloc] init];
//        flowLayout.itemSize = CGSizeMake(10,10);
    flowLayout.estimatedItemSize = CGSizeMake(20, 60);  // layout约束这边必须要用estimatedItemSize才能实现自适应,使用itemSzie无效
    
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(8);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(8);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(17), 0, LENGTH(17));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[SearchHistoryCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(17));
        make.left.and.right.mas_equalTo(ws); 
        make.bottom.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(60)+LENGTH(8));
    }];
    
    collectView.itemarray = [[NSUserDefaults standardUserDefaults] objectForKey:SEARCHHISTORY];
    [collectView setBlock:^(NSString * _Nonnull string) {
        ws.block(string);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(denglu) name:SEARCHHISTORY object:nil];
}

- (void)denglu{
    collectView.itemarray = [[NSUserDefaults standardUserDefaults] objectForKey:SEARCHHISTORY];
}
-(void)layoutSubviews{
    [super layoutSubviews];
}
- (void)click{
    NSMutableArray * array = [NSMutableArray array];
    [[NSUserDefaults standardUserDefaults] setObject:array forKey:SEARCHHISTORY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSNotification *notification =[NSNotification notificationWithName:SEARCHHISTORY object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}
@end
