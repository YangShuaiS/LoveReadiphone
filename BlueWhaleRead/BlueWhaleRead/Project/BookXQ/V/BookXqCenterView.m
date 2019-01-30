//
//  BookXqCenterView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/29.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BookXqCenterView.h"
#import "BookXqTopCollectionView.h"
#import "BookTopLabel.h"

@implementation BookXqCenterView{
    BookXqTopCollectionView * collection;
    UIScrollView * scrollView;
    BookTopLabel * longtext;
    FLAnimatedImageView* sanjiao;
    FLAnimatedImageView * backImageView;



}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    backImageView = [FLAnimatedImageView new];
    backImageView.image = UIIMAGE(@"下");
    [self addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(LENGTH(103),LENGTH(31));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(5);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(5);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(10), 0, LENGTH(10));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collection = [[BookXqTopCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:collection];
    
    [collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.left.and.right.mas_equalTo(ws);
    }];
    
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    //    scrollView.bounces = NO;
    [self addSubview:scrollView];
    
    longtext = [BookTopLabel new];
    [scrollView addSubview:longtext];
    
    [longtext mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(14));
        make.top.equalTo(self->scrollView.mas_top).with.offset(0);
        make.right.equalTo(ws).with.offset(-LENGTH(14));
        make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(0);
    }];
    
    
    BaseLabel * zhankai = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(85,117,117)  LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:zhankai];
    [zhankai mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->scrollView.mas_bottom).with.offset(LENGTH(10));
        make.centerX.mas_equalTo(ws);
        //        make.bottom.equalTo(ws.mas_bottom).with.offset(-LENGTH(20));
        make.width.mas_equalTo(LENGTH(140));
        make.height.mas_equalTo(LENGTH(50));
    }];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->collection.mas_bottom).with.offset(LENGTH(12));
        make.left.equalTo(ws).with.offset(LENGTH(14));
        make.right.equalTo(ws).with.offset(-LENGTH(0));
        make.height.mas_equalTo(self->longtext.mas_height);
        //        make.height.mas_equalTo(LENGTH(65));
        
        //        make.bottom.equalTo(ws.view).with.offset(-TabBarHeight);
    }];
    
    
    zhankai.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
    //将手势添加到需要相应的view中去
    [zhankai addGestureRecognizer:tapGesture1];
    
    sanjiao = [FLAnimatedImageView new];
    sanjiao.image = UIIMAGE(@"icon_文章_下箭头收起");
    [self addSubview:sanjiao];
    
    [sanjiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->scrollView.mas_bottom).with.offset(LENGTH(10));
        make.centerX.mas_equalTo(ws);
        make.bottom.equalTo(ws.mas_bottom).with.offset(-LENGTH(20));
        make.width.mas_equalTo(LENGTH(12));
        make.height.mas_equalTo(LENGTH(7));
    }];
}
- (void)tapGesture1{
    sanjiao.image = longtext.longlabel.numberOfLines ==0?UIIMAGE(@"icon_文章_下箭头收起"):UIIMAGE(@"icon_文章_上箭头收起");
    
    //    longtext.numberOfLines = longtext.numberOfLines>0?0:4;
    longtext.longlabel.numberOfLines = longtext.longlabel.numberOfLines>0?0:4;
    [longtext layoutIfNeeded];
    [scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self->longtext);
    }];
}

- (void)setModel:(BookXQbookModel *)model{
    _model = model;
    collection.itemArray = model.tags;
    longtext.longlabel.text = model.info;

}
- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    [backImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ws.frame.size.height);
    }];
    //    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, LENGTH(600));
    
}
@end
