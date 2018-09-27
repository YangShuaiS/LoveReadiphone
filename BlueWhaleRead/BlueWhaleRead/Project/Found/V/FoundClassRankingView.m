//
//  FoundClassRankingView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundClassRankingView.h"
#import "FoundClass.h"
#import "MedalPaiHangBangViewController.h"
#import "FriendViewController.h"
@implementation FoundClassRankingView{
//    BaseLabel * Title;
//    BaseView * backView;
//    BaseView * centerview;
    NSMutableArray * array;
    
    BaseLabel * xunZhangLabeOne;
    BaseLabel * xunZhangLabeTwo;
    BaseLabel * xunZhangLabeThree;
    NSMutableArray * xunzhangarray;
    NSMutableArray * touxiangarray;
    NSMutableArray * buttonarray;
    NSMutableArray * namearray;
    
    FLAnimatedImageView * userImage;
    BaseLabel * UserName;
    FLAnimatedImageView * backImageView;
    
    NSInteger heights;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
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
    xunzhangarray = [NSMutableArray array];
    touxiangarray = [NSMutableArray array];
    namearray = [NSMutableArray array];
    buttonarray = [NSMutableArray array];
    
    backImageView = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, LENGTH(235))];
    backImageView.image = UIIMAGE(@"bg_勋章排行");
    backImageView.layer.masksToBounds = YES;
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:backImageView];
//    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(ws);
//    }];
    backImageView.userInteractionEnabled = YES;
    self.userInteractionEnabled = YES;
    FLAnimatedImageView * centerImageView = [FLAnimatedImageView new];
    centerImageView.image = UIIMAGE(@"bg_勋章排行_中方块");
    [backImageView addSubview:centerImageView];
    [centerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->backImageView.mas_centerX);
        make.bottom.mas_equalTo(self->backImageView.mas_bottom);
        make.width.mas_equalTo(LENGTH(113.5));
        make.height.mas_equalTo(LENGTH(74.5));
    }];
    
    FLAnimatedImageView * leftImageView = [FLAnimatedImageView new];
    leftImageView.image = UIIMAGE(@"bg_勋章排行_左方块");
    [backImageView addSubview:leftImageView];
    [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(centerImageView.mas_left);
        make.bottom.mas_equalTo(self->backImageView.mas_bottom);
        make.width.mas_equalTo(LENGTH(112));
        make.height.mas_equalTo(LENGTH(52.5));
    }];

    FLAnimatedImageView * rightImageView = [FLAnimatedImageView new];
    rightImageView.image = UIIMAGE(@"bg_勋章排行_右方块");
    [backImageView addSubview:rightImageView];
    [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(centerImageView.mas_right).with.offset(-LENGTH(1));
        make.bottom.mas_equalTo(self->backImageView.mas_bottom);
        make.width.mas_equalTo(LENGTH(114));
        make.height.mas_equalTo(LENGTH(42));
    }];
    
    xunZhangLabeOne = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"勋章"];
    [centerImageView addSubview:xunZhangLabeOne];
    
    xunZhangLabeTwo = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"勋章"];
    [leftImageView addSubview:xunZhangLabeTwo];
    
    xunZhangLabeThree = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"勋章"];
    [rightImageView addSubview:xunZhangLabeThree];
    
    [xunZhangLabeOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(centerImageView.mas_centerX);
        make.top.mas_equalTo(centerImageView.mas_top).with.offset(LENGTH(15));
    }];

    [xunZhangLabeTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(leftImageView.mas_centerX);
        make.top.mas_equalTo(leftImageView.mas_top).with.offset(LENGTH(10));
    }];
    
    [xunZhangLabeThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(rightImageView.mas_centerX);
        make.top.mas_equalTo(rightImageView.mas_top).with.offset(LENGTH(5));
    }];
    [xunzhangarray addObject:xunZhangLabeOne];
    [xunzhangarray addObject:xunZhangLabeTwo];
    [xunzhangarray addObject:xunZhangLabeThree];
    
    
    FLAnimatedImageView * touxiangone = [FLAnimatedImageView new];
    touxiangone.image = UIIMAGE(@"icon_勋章排行榜默认头像");
    touxiangone.layer.masksToBounds = YES;
    touxiangone.layer.cornerRadius = LENGTH(23);
    touxiangone.layer.borderWidth = LENGTH(2);
    touxiangone.layer.borderColor = RGB(255,255,255).CGColor;
    [backImageView addSubview:touxiangone];
    [touxiangone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(centerImageView.mas_top).with.offset(-LENGTH(26));
        make.centerX.mas_equalTo(centerImageView.mas_centerX);
        make.width.mas_equalTo(LENGTH(46));
        make.height.mas_equalTo(LENGTH(46));
    }];
    
    touxiangone.userInteractionEnabled = YES;
    BaseButton * oneButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [oneButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [touxiangone addSubview:oneButton];
    [oneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(touxiangone);
    }];
    
    FLAnimatedImageView * touxiangtwo = [FLAnimatedImageView new];
    touxiangtwo.image = UIIMAGE(@"icon_勋章排行榜默认头像");
    touxiangtwo.layer.masksToBounds = YES;
    touxiangtwo.layer.cornerRadius = LENGTH(21);
    touxiangtwo.layer.borderWidth = LENGTH(2);
    touxiangtwo.layer.borderColor = RGB(255,255,255).CGColor;
    [backImageView addSubview:touxiangtwo];
    [touxiangtwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(leftImageView.mas_top).with.offset(-LENGTH(29));
        make.centerX.mas_equalTo(leftImageView.mas_centerX);
        make.width.mas_equalTo(LENGTH(42));
        make.height.mas_equalTo(LENGTH(42));
    }];
    
    touxiangtwo.userInteractionEnabled = YES;
    BaseButton * twoButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [twoButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [touxiangtwo addSubview:twoButton];
    [twoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(touxiangtwo);
    }];
    
    FLAnimatedImageView * touxianthree = [FLAnimatedImageView new];
    touxianthree.image = UIIMAGE(@"icon_勋章排行榜默认头像");
    touxianthree.layer.masksToBounds = YES;
    touxianthree.layer.cornerRadius = LENGTH(18);
    touxianthree.layer.borderWidth = LENGTH(2);
    touxianthree.layer.borderColor = RGB(255,255,255).CGColor;
    [backImageView addSubview:touxianthree];
    [touxianthree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(rightImageView.mas_top).with.offset(-LENGTH(29));
        make.centerX.mas_equalTo(rightImageView.mas_centerX);
        make.width.mas_equalTo(LENGTH(36));
        make.height.mas_equalTo(LENGTH(36));
    }];
    
    touxianthree.userInteractionEnabled = YES;
    BaseButton * threeButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [threeButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [touxianthree addSubview:threeButton];
    [threeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(touxianthree);
    }];
    
    
    [touxiangarray addObject:touxiangone];
    [touxiangarray addObject:touxiangtwo];
    [touxiangarray addObject:touxianthree];
    
    [buttonarray addObject:oneButton];
    [buttonarray addObject:twoButton];
    [buttonarray addObject:threeButton];


    BaseLabel * name1 = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"虚位以待"];
    [rightImageView addSubview:name1];
    
    BaseLabel * name2 = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"虚位以待"];
    [rightImageView addSubview:name2];
    
    BaseLabel * name3 = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"虚位以待"];
    [rightImageView addSubview:name3];
    [name1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(touxiangone.mas_centerX);
        make.top.mas_equalTo(touxiangone.mas_bottom).with.offset(LENGTH(5));
    }];
    [name2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(touxiangtwo.mas_centerX);
        make.top.mas_equalTo(touxiangtwo.mas_bottom).with.offset(LENGTH(5));
    }];
    [name3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(touxianthree.mas_centerX);
        make.top.mas_equalTo(touxianthree.mas_bottom).with.offset(LENGTH(5));
    }];
    
    [namearray addObject:name1];
    [namearray addObject:name2];
    [namearray addObject:name3];

    FLAnimatedImageView * topimageone = [FLAnimatedImageView new];
    topimageone.image = UIIMAGE(@"icon_勋章排行第1");
    [backImageView addSubview:topimageone];
    
    FLAnimatedImageView * topimagetwo = [FLAnimatedImageView new];
    topimagetwo.image = UIIMAGE(@"icon_勋章排行第2");
    [backImageView addSubview:topimagetwo];
    
    FLAnimatedImageView * topimagethree = [FLAnimatedImageView new];
    topimagethree.image = UIIMAGE(@"icon_勋章排行第3");
    [backImageView addSubview:topimagethree];
    
    [topimageone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(touxiangone.mas_centerX);
        make.bottom.mas_equalTo(touxiangone.mas_top).with.offset(LENGTH(0));
        make.width.mas_equalTo(LENGTH(56));
        make.height.mas_equalTo(LENGTH(27));
    }];
    
    [topimagetwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(touxiangtwo.mas_centerX);
        make.bottom.mas_equalTo(touxiangtwo.mas_top).with.offset(LENGTH(0));
        make.width.mas_equalTo(LENGTH(48));
        make.height.mas_equalTo(LENGTH(23));
    }];

    [topimagethree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(touxianthree.mas_centerX);
        make.bottom.mas_equalTo(touxianthree.mas_top).with.offset(LENGTH(0));
        make.width.mas_equalTo(LENGTH(44.5));
        make.height.mas_equalTo(LENGTH(21.5));
    }];
    
//    backView = [BaseView new];
//    backView.backgroundColor = BEIJINGCOLOR;
//    backView.layer.cornerRadius = LENGTH(10);
//    backView.layer.masksToBounds = YES;
//    [self addSubview:backView];
    
//    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font20) TextAlignment:NSTextAlignmentCenter Text:@"本周勋章排名"];
//    [self addSubview:Title];
//    WS(ws);
//
//    centerview = [BaseView new];
//    centerview.backgroundColor = BEIJINGCOLOR;
//    [self addSubview:centerview];
//
//    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(ws).with.offset(LENGTH(37));
//        make.left.equalTo(ws).with.offset(LENGTH(0));
//        make.right.equalTo(ws).with.offset(-LENGTH(0));
//    }];
//    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(50));
//        make.left.equalTo(ws).with.offset(LENGTH(98));
//        make.right.equalTo(ws).with.offset(-LENGTH(98));
//        make.bottom.equalTo(ws).with.offset(-LENGTH(46));
//        make.height.mas_equalTo(self->backView.mas_width).multipliedBy(0.345);
//    }];
//    [centerview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->backView.mas_top).with.offset(-LENGTH(13));
//        make.width.mas_equalTo(LENGTH(190));
//        make.bottom.equalTo(self->backView.mas_bottom).with.offset(0);
//        make.centerX.mas_equalTo(self->backView.mas_centerX);
//    }];
//
//    array = [NSMutableArray array];
//    for (int i = 0; i < 3; i++) {
//        FoundClass * view = [FoundClass new];
//        [array addObject:view];
//        if (i == 0) {
//            [backView addSubview:view];
//
//            [view mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(self->backView.mas_top).with.offset(0);
//                make.bottom.equalTo(self->backView.mas_bottom).with.offset(0);
//                make.left.equalTo(self->backView.mas_left).with.offset(0);
//                make.right.equalTo(self->centerview.mas_left).with.offset(0);
//            }];
//        }else if (i == 1){
//            [centerview addSubview:view];
//
//            [view mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(self->centerview.mas_top).with.offset(0);
//                make.bottom.equalTo(self->centerview.mas_bottom).with.offset(0);
//                make.left.equalTo(self->centerview.mas_left).with.offset(0);
//                make.right.equalTo(self->centerview.mas_right).with.offset(0);
//            }];
//        }else{
//            [backView addSubview:view];
//            [view mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(self->backView.mas_top).with.offset(LENGTH(5));
//                make.bottom.equalTo(self->backView.mas_bottom).with.offset(0);
//                make.left.equalTo(self->centerview.mas_right).with.offset(0);
//                make.right.equalTo(self->backView.mas_right).with.offset(0);
//            }];
//        }
//    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
//    backImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    CGPoint point1 = CGPointMake(centerview.frame.origin.x, centerview.frame.origin.y+LENGTH(13));
//    CGPoint point2 = CGPointMake(centerview.frame.origin.x-LENGTH(10), centerview.frame.origin.y+LENGTH(13));
//    CGPoint point3 = CGPointMake(centerview.frame.origin.x, centerview.frame.origin.y+LENGTH(120));
//    [path moveToPoint:point1];
//    [path addLineToPoint:point2];
//    [path addLineToPoint:point3];
//    [path addLineToPoint:point1];
//    CAShapeLayer * animLayer = [CAShapeLayer layer];
//    animLayer.path = path.CGPath;
//    //            animLayer.fillColor = [UIColor clearColor].CGColor;
//    animLayer.lineWidth = 1.f;
//    animLayer.strokeColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:0.5].CGColor;
//    animLayer.fillColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:0.5].CGColor;
//    
//    [self.layer addSublayer:animLayer];
//    CGFloat path1x = centerview.frame.origin.x + centerview.frame.size.width;
//    UIBezierPath *path1 = [UIBezierPath bezierPath];
//    CGPoint point11 = CGPointMake(path1x, centerview.frame.origin.y+LENGTH(13));
//    CGPoint point22 = CGPointMake(path1x+LENGTH(10), centerview.frame.origin.y+LENGTH(13));
//    CGPoint point33 = CGPointMake(path1x, centerview.frame.origin.y+LENGTH(120));
//    [path1 moveToPoint:point11];
//    [path1 addLineToPoint:point22];
//    [path1 addLineToPoint:point33];
//    [path1 addLineToPoint:point11];
//    CAShapeLayer * animLayer1 = [CAShapeLayer layer];
//    animLayer1.path = path1.CGPath;
//    //            animLayer.fillColor = [UIColor clearColor].CGColor;
//    animLayer1.lineWidth = 1.f;
//    animLayer1.strokeColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:0.5].CGColor;
//    animLayer1.fillColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:0.5].CGColor;
//    
//    [self.layer addSublayer:animLayer1];
}
- (void)setStyles:(RankingStyle)styles{
    _styles = styles;
    switch (_styles) {
        case RankingStyleAll:
            [self addall];
            break;
        case RankingStyleSmall:
            
            break;
        default:
            break;
    }
}
- (void)addall{
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(164,108,10) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"月勋章排行"];
    [backImageView addSubview:title];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->backImageView.mas_centerX);
        make.top.mas_equalTo(self->backImageView.mas_top).with.offset(LENGTH(21.5));
    }];
    
    userImage = [FLAnimatedImageView new];
    userImage.image = UIIMAGE(ZHANWEITUTX);
    userImage.layer.masksToBounds = YES;
    userImage.layer.cornerRadius = LENGTH(11);
    userImage.layer.borderColor = [UIColor whiteColor].CGColor;
    userImage.layer.borderWidth = LENGTH(2);
    [backImageView addSubview:userImage];
    [userImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->backImageView.mas_top).with.offset(LENGTH(22.5));
        make.right.mas_equalTo(self->backImageView.mas_right).with.offset(-LENGTH(44));
        make.width.mas_equalTo(LENGTH(22));
        make.height.mas_equalTo(LENGTH(22));
    }];
    
    UserName = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(191,132,29) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:@"我在第 30 名"];
    [backImageView addSubview:UserName];
    [UserName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->userImage.mas_bottom).with.offset(LENGTH(3));
        make.centerX.mas_equalTo(self->userImage.mas_centerX);
    }];
    
    FLAnimatedImageView * rightClick = [FLAnimatedImageView new];
    rightClick.image = UIIMAGE(@"icon_勋章排行_箭头");
    [backImageView addSubview:rightClick];
    
    [rightClick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->userImage.mas_centerY);
        make.left.mas_equalTo(self->userImage.mas_right).with.offset(LENGTH(5));
        make.width.mas_equalTo(LENGTH(31.5));
        make.height.mas_equalTo(LENGTH(10.5));
    }];
    
    BaseView * backview = [BaseView new];
    [backImageView addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->userImage.mas_centerY);
        make.left.mas_equalTo(self->userImage.mas_left).with.offset(-LENGTH(10));
        make.right.mas_equalTo(self->backImageView.mas_right).with.offset(-LENGTH(10));
        make.height.mas_equalTo(50);
    }];
    
    backview.userInteractionEnabled = YES;
    backImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cklickMore)];
    [backview addGestureRecognizer:tap1];
}

-(void)setMonthBadgeList:(FoundMonthModel *)monthBadgeList{
    _monthBadgeList = monthBadgeList;
    //    for (int i = 0; i < itemarray.count; i++) {
    NSInteger geshu;
    if (monthBadgeList.studentList.count>xunzhangarray.count) {
        geshu = 3;
    }else{
        geshu = monthBadgeList.studentList.count;
    }
    for (int i = 0; i < geshu; i++) {
        FoundbadgeRankModel * models = monthBadgeList.studentList[i];
        BaseLabel * label = xunzhangarray[i];
        NSString * xunzhang = @"勋章";
        NSString * xunzhanggeshu = [NSString stringWithFormat:@"%@",models.monthBadgeNum];
        NSString * allstr = [NSString stringWithFormat:@"%@ %@",xunzhang,xunzhanggeshu];
        AttributedStringModel * model = [AttributedStringModel new];
        model.textString = allstr;
        model.bianString = xunzhanggeshu;
        model.fount = 15;
        model.color = RGB(228,131,61);
        NSArray * modelarray = @[model];
        NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
        label.attributedText = AttributedStr;
        
        if ([models.monthBadgeNum isEqualToString:@"0"]) {
            BaseLabel * name = namearray[i];
            name.text = @"虚席以待";

        }else{
        FLAnimatedImageView * touxiang = touxiangarray[i];
        UIImage * img;
        if (models.sex == 1) {
            img = UIIMAGE(ZHANWEITUTXN);
        }else{
            img = UIIMAGE(ZHANWEITUTXV);
        }
        [touxiang sd_setImageWithURL:URLIMAGE(models.avatar) placeholderImage:img];
        BaseButton * button = buttonarray[i];
        button.tag = [models.ssid integerValue];
        
        BaseLabel * name = namearray[i];
        name.text = models.name;
        
        FoundClass * view = array[i];
        view.model = monthBadgeList.studentList[i];
        }
    }
    UserName.text = [NSString stringWithFormat:@"我在第 %ld 名",monthBadgeList.myRank+1];
    UIImage * imgs;
    if (monthBadgeList.sex == 1) {
        imgs = UIIMAGE(ZHANWEITUTXN);
    }else{
        imgs = UIIMAGE(ZHANWEITUTXV);
    }
    [userImage sd_setImageWithURL:URLIMAGE(monthBadgeList.myAvatar) placeholderImage:imgs];
}

- (void)setMonthList:(MonthstudentModel *)monthList{
    _monthList = monthList;
    
    NSInteger geshu = 0;
    if (monthList.studentList.count>xunzhangarray.count) {
      
        for (int i = 0; i < 3; i++) {
            MyClassModel * model = monthList.studentList[i+1];
            if ([model.monthBadgeNum isEqualToString:@"0"]) {
            }else{
                geshu++;
            }
        }
    }else{
        geshu = monthList.studentList.count;
    }
    for (int i = 0; i < geshu; i++) {
        MyClassModel * models = monthList.studentList[i+1];
        BaseLabel * label = xunzhangarray[i];
        NSString * xunzhang = @"勋章";
        NSString * xunzhanggeshu = [NSString stringWithFormat:@"%@",models.monthBadgeNum];
        NSString * allstr = [NSString stringWithFormat:@"%@ %@",xunzhang,xunzhanggeshu];
        AttributedStringModel * model = [AttributedStringModel new];
        model.textString = allstr;
        model.bianString = xunzhanggeshu;
        model.fount = 15;
        model.color = RGB(228,131,61);
        NSArray * modelarray = @[model];
        NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
        label.attributedText = AttributedStr;
        
        FLAnimatedImageView * touxiang = touxiangarray[i];
        UIImage * img;
        if (models.sex == 1) {
            img = UIIMAGE(ZHANWEITUTXN);
        }else{
            img = UIIMAGE(ZHANWEITUTXV);
        }
        [touxiang sd_setImageWithURL:URLIMAGE(models.avatar) placeholderImage:img];
        
        BaseButton * button = buttonarray[i];
        button.tag = [models.ssid integerValue];
        
        BaseLabel * name = namearray[i];
        name.text = models.name;
        
        FoundClass * view = array[i];
        view.model = monthList.studentList[i];
    }
}
- (void)cklickMore{
    MedalPaiHangBangViewController * vc = [MedalPaiHangBangViewController new];
    [self.nav pushViewController:vc animated:YES];
}
- (void)click:(BaseButton *)button{
    FriendViewController * vc = [FriendViewController new];
    vc.itemid = [NSString stringWithFormat:@"%ld",(long)button.tag];
    [self.nav pushViewController:vc animated:YES];
}
@end
