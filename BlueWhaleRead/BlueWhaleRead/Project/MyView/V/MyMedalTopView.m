//
//  MyMedalTopView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#pragma mark------------页面有问题，布局还是图片问题
#import "MyMedalTopView.h"
#import "FiendOrMedalView.h"
#import "MedalListXQViewController.h"
@implementation MyMedalTopView{
    FLAnimatedImageView * imageView;
    FLAnimatedImageView * xzimageView;
    BaseLabel * Title;
    BaseLabel * ydreiend;
    FiendOrMedalView * touxiang;
    FLAnimatedImageView * backImageView;

}

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];

}
-(void)setupUI{
    WS(ws);
    backImageView = [FLAnimatedImageView new];
//    backImageView.backgroundColor = RANDOMCOLOR;
    backImageView.image = UIIMAGE(@"bg-我的勋章");
    [self addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
        make.height.mas_equalTo(1);
    }];
    
    imageView = [FLAnimatedImageView new];
    imageView.image = UIIMAGE(@"bg_喜得勋章");
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(0));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(105));
        make.height.mas_equalTo(LENGTH(105));
    }];
    xzimageView = [FLAnimatedImageView new];
    xzimageView.image = UIIMAGE(ZHANWEITUXZ);
    xzimageView.contentMode = UIViewContentModeScaleAspectFit;
    [imageView addSubview:xzimageView];
    [xzimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self->imageView);
        make.width.mas_equalTo(LENGTH(60));
        make.height.mas_equalTo(self->xzimageView.mas_width).multipliedBy(1);
    }];
    
    
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFontling(17) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:Title];
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->imageView.mas_bottom).with.offset(LENGTH(0));
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);

    }];
    
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(LENGTH(30),LENGTH(30));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(4.5);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(4.5);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    touxiang = [[FiendOrMedalView alloc] initWithLayOut:flowLayout];
    touxiang.backgroundColor = [UIColor clearColor];
    touxiang.inter = 6;
    [self addSubview:touxiang];
    [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(25));
        make.centerX.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(30));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(12.5));
    }];
//    NSMutableArray * array = [NSMutableArray array];
//    for (int i = 0; i < 30; i++) {
//        ReadPeopleModel * model = [ReadPeopleModel new];
//        model.ssid = @"1";
//        model.avatar = @"23";
//        [array addObject:model];
//    }
//    touxiang.itemarray= array;
    
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.itemSize = CGSizeMake(LENGTH(48),LENGTH(48));
//    //定义每个UICollectionView 横向的间距
//    flowLayout.minimumLineSpacing = LENGTH(10);
//    //定义每个UICollectionView 纵向的间距
//    flowLayout.minimumInteritemSpacing = LENGTH(10);
//    //定义每个UICollectionView 的边距距
//    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(0), 0, LENGTH(0));//上左下右
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//
//    friendView = [[MyFriendHeadImaage alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
//    friendView.style = FriendHeadImage;
//    [self addSubview:friendView];
//    [friendView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(25));
//        make.centerX.mas_equalTo(ws);
//        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(36));
//        make.width.mas_equalTo(WIDTH*2);
//        make.height.mas_equalTo(LENGTH(48));
//    }];
    
    
    ydreiend = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFontling(11) TextAlignment:NSTextAlignmentLeft Text:@"300人点亮中"];
    [self addSubview:ydreiend];
    [ydreiend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->touxiang.mas_centerY).with.offset(LENGTH(0));
        make.left.equalTo(self->touxiang.mas_right).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(0);
    }];
    
    BaseLabel * label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFontling(17) TextAlignment:NSTextAlignmentCenter Text:@"本周最受欢迎勋章"];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self->touxiang.mas_top).with.offset(-LENGTH(5));
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        
    }];
    
    self.userInteractionEnabled = YES;
    backImageView.userInteractionEnabled = YES;
    imageView.userInteractionEnabled = YES;
    xzimageView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [xzimageView addGestureRecognizer:tap];
}
- (void)tap{
    
//    if (_model.badge.badge_id.length>0) {
        MedalListXQViewController * vc = [MedalListXQViewController new];
        vc.itemid = _model.badge.ssid;
        [self.nav pushViewController:vc animated:YES];
//    }
}
- (void)setItemarray:(NSString *)itemarray{
//    [friendView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(8*LENGTH(48)+7*LENGTH(10));
//    }];
}

- (void)setModel:(MyBadgeListModel *)model{
    _model = model;
    [xzimageView sd_setImageWithURL:URLIMAGE(model.badge.min_logo) placeholderImage:UIIMAGE(ZHANWEITUXZ)];
    touxiang.nav = self.nav;
    touxiang.itemarray= model.badgestudent;
    ydreiend.text = [NSString stringWithFormat:@"%lu人点亮中",(unsigned long)model.badgestudent.count];
}
@end
