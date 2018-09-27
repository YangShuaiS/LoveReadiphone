//
//  MyMedalView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyMedalView.h"
#import "GeneralMedalView.h"
#import "MedalChooseABookCollectionView.h"
#import "FiendOrMedalView.h"
#import "JInDuHeadImage.h"

#import "MedalListXQViewController.h"
#import "FriendViewController.h"
#define DLIngColor RGB(1,195,193);
@implementation MyMedalView{
    FLAnimatedImageView * imageView;
    GeneralMedalView * MedalView;
    BaseLabel * title;
    BaseLabel * time;
    BaseView * MedalZt;//勋章状态
    BaseLabel * medalLabel;
    MedalChooseABookCollectionView * BookList;
    FLAnimatedImageView * MyImage;
    FLAnimatedImageView * VS;
    BaseLabel * UserName;
    FiendOrMedalView * touxiang;
    

}

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    
    imageView = [FLAnimatedImageView new];
    imageView.image = UIIMAGE(@"bg_勋章背景_首页");
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = LENGTH(10);
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(8));
        make.left.mas_equalTo(ws).with.offset(LENGTH(11.5));
        make.width.mas_equalTo(LENGTH(100));
        make.height.mas_equalTo(LENGTH(66.5));
    }];
    
//    UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    UIVisualEffectView *mohu = [[UIVisualEffectView alloc] initWithEffect:beffect];
//    [imageView addSubview:mohu];
//    [mohu mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self->imageView);
//    }];
    
    MedalView = [GeneralMedalView new];
    MedalView.upjl = LENGTH(6);
    [imageView addSubview:MedalView];
    [MedalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self->imageView);
        make.width.mas_equalTo(LENGTH(60));
        make.height.mas_equalTo(LENGTH(60));
    }];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->imageView.mas_top).with.offset(LENGTH(5));
        make.left.equalTo(self->imageView.mas_right).with.offset(LENGTH(10));
    }];
    
    time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->imageView.mas_bottom).with.offset(LENGTH(6));
        make.centerX.mas_equalTo(self->imageView.mas_centerX);
    }];
    
    MedalZt = [BaseView new];
    MedalZt.backgroundColor = DLIngColor;
    [self addSubview:MedalZt];
    [MedalZt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->title.mas_centerY);
        make.right.mas_equalTo(ws.mas_right).with.offset(-LENGTH(16));
        make.width.mas_equalTo(LENGTH(66));
        make.height.mas_equalTo(LENGTH(20));
    }];
    
    medalLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:WhitColor LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@"点亮中"];
    medalLabel.layer.borderWidth = 1;
    medalLabel.layer.borderColor = WhitColor.CGColor;
    [MedalZt addSubview:medalLabel];
    [medalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->MedalZt).with.insets(UIEdgeInsetsMake(LENGTH(1), LENGTH(1), LENGTH(1), LENGTH(1)));
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(LENGTH(23),LENGTH(31));
    //    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(2);
    //    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(2);
    //    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    BookList = [[MedalChooseABookCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
    [self addSubview:BookList];
    [BookList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->imageView.mas_right).with.offset(LENGTH(14));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(0));
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(8));
        make.height.mas_equalTo(LENGTH(31));
    }];
    
    BaseView * xian = [BaseView new];
    xian.backgroundColor = RGB(194,206,206);
    [self addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->time.mas_bottom).with.offset(LENGTH(12));
        make.left.mas_equalTo(ws).with.offset(LENGTH(15));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(15));
        make.height.mas_equalTo(1);
    }];
    
    MyImage = [FLAnimatedImageView new];
    MyImage.layer.masksToBounds = YES;
    MyImage.layer.cornerRadius = LENGTH(20);
    MyImage.image = UIIMAGE(@"ZHANWEITUXZ");
    [self addSubview:MyImage];
    [MyImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(xian.mas_bottom).with.offset(LENGTH(5));
        make.left.mas_equalTo(ws).with.offset(LENGTH(12));
        make.width.mas_equalTo(LENGTH(40));
        make.height.mas_equalTo(LENGTH(40));

    }];
    
    UserName = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:@"名字"];
    [self addSubview:UserName];
    [UserName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->MyImage.mas_bottom).with.offset(LENGTH(3));
        make.centerX.mas_equalTo(self->MyImage.mas_centerX);
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(10));
    }];
    
    VS = [FLAnimatedImageView new];
    VS.image = UIIMAGE(@"icon_勋章_vs");
    [self addSubview:VS];
    [VS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->MyImage.mas_centerY);
        make.left.mas_equalTo(self->MyImage.mas_right).with.offset(LENGTH(8));
        make.width.mas_equalTo(LENGTH(14.5));
        make.height.mas_equalTo(LENGTH(16));
    }];
    
    UICollectionViewFlowLayout *flowLayout1 = [[UICollectionViewFlowLayout alloc] init];
    flowLayout1.itemSize = CGSizeMake(LENGTH(40),LENGTH(60));
    //定义每个UICollectionView 横向的间距
    flowLayout1.minimumLineSpacing = LENGTH(8);
    //定义每个UICollectionView 纵向的间距
    flowLayout1.minimumInteritemSpacing = LENGTH(8);
    //定义每个UICollectionView 的边距距
    flowLayout1.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
    flowLayout1.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    touxiang = [[FiendOrMedalView alloc] initWithLayOut:flowLayout1];
    touxiang.backgroundColor = [UIColor clearColor];
    [self addSubview:touxiang];
    [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->MyImage.mas_top);
        make.left.mas_equalTo(self->VS.mas_right).with.offset(LENGTH(10));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(25));
        make.height.mas_equalTo(LENGTH(60));
    }];
    
//    FLAnimatedImageView * sanjiao = [FLAnimatedImageView new];
//    sanjiao.image = UIIMAGE(@"icon_个人资料_箭头");
//    [self addSubview:sanjiao];
//    [sanjiao mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self->BookList.mas_centerY);
//        make.right.mas_equalTo(ws).with.offset(-LENGTH(55));
//    }];
    
//    BaseButton * anjiaobth = [BaseButton buttonWithType:UIButtonTypeCustom];
//    [anjiaobth addTarget:self action:@selector(MedalView ) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:anjiaobth];
//    [anjiaobth mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self->BookList.mas_centerY);
//        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
//        make.width.mas_equalTo(LENGTH(100));
//        make.height.mas_equalTo(LENGTH(50));
//
//    }];
    
    self.userInteractionEnabled = YES;
    imageView.userInteractionEnabled = YES;
    MedalView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(MedalView)];
    [MedalView addGestureRecognizer:tap];
    
    MyImage.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapMyImage = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(MyImage)];
    [MyImage addGestureRecognizer:tapMyImage];
}
- (void)MedalView{
    MedalListXQViewController * vc = [MedalListXQViewController new];
    vc.itemid = _model.ssid;
    [self.nav pushViewController:vc animated:YES];
}

- (void)MyImage{
    FriendViewController * vc = [FriendViewController new];
    vc.itemid = _model.student.ssid;
    [self.nav pushViewController:vc animated:YES];
}
- (void)setModel:(MyBadgeXQModel *)model{
    _model = model;
    MedalView.images = model.min_logo;
    CGFloat f = 1-1.000000001*model.studentBadgeNum/model.task_num;
    MedalView.floatjidu =f;

    title.text = model.name;
    UIImage * img;
    if (model.student.sex == 1) {
        img = UIIMAGE(ZHANWEITUTXN);
    }else{
        img = UIIMAGE(ZHANWEITUTXV);
    }
    [MyImage sd_setImageWithURL:URLIMAGE(model.student.avatar) placeholderImage:img];

    UserName.text = model.student.name;
    touxiang.nav = self.nav;
    touxiang.itemarray = model.badgeStudentList;

    BookList.nav = self.nav;
    BookList.Booknumber = model.task_num;
    BookList.itemArray = model.studentBadge;

    if (_model.is_completed == 1) {
        medalLabel.text = @"点亮中";
        MedalZt.backgroundColor = DLIngColor;
//        time.text = model.remain_days;
        imageView.alpha = 1;
    }else if (_model.is_completed == 2){
        medalLabel.text = @"已点亮";
        MedalZt.backgroundColor = RGB(255,167,96);
//        time.text = model.completed_time;

        imageView.alpha = 1;
    }else{
        medalLabel.text = @"已过期";
        MedalZt.backgroundColor = RGB(171,171,171);
//        time.text = model.expiry_time;
        imageView.alpha = 0.8;
    }
    
//    time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"2018-06-01 点亮"];
//    time.text = [NSString stringWithFormat:@"%@-%@-%@ 点亮",model]
}
- (void)layoutSubviews{
    [super layoutSubviews];
}
@end
