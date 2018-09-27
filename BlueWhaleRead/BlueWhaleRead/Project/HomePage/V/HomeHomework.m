//
//  HomeHomework.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeHomework.h"
#import "ClassDTViewController.h"
#import "HomeWorkTableView.h"
typedef enum : NSUInteger {
    Fade = 1,                   //淡入淡出
    Push,                       //推挤
    Reveal,                     //揭开
    MoveIn,                     //覆盖
    Cube,                       //立方体
    SuckEffect,                 //吮吸
    OglFlip,                    //翻转
    RippleEffect,               //波纹
    PageCurl,                   //翻页
    PageUnCurl,                 //反翻页
    CameraIrisHollowOpen,       //开镜头
    CameraIrisHollowClose,      //关镜头
    CurlDown,                   //下翻页
    CurlUp,                     //上翻页
    FlipFromLeft,               //左翻转
    FlipFromRight,              //右翻转
    
} AnimationType;
@implementation HomeHomework{
    
    FLAnimatedImageView * leftImage;
//    BaseLabel * title;
//    BaseLabel * rightImage;
//    FLAnimatedImageView * userimage;
    NSTimer *timer;
    
//    NSInteger inter;
    NSInteger inters;
    
    BaseView * backView ;
    HomeWorkTableView * tabview;
//    NSString * str;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    backView = [BaseView new];
    backView.backgroundColor = [UIColor whiteColor];
//    backView.layer.cornerRadius = LENGTH(10);
//    backView.layer.masksToBounds = YES;
    [self addSubview:backView];
//    [viewarray addObject:backView];
    //
    //    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"班级\n动态"];
    //    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"BDZYJT--GB1-0" size:13.66f] range:NSMakeRange(0, 5)];
    //    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:150.0f/255.0f green:164.0f/255.0f blue:213.0f/255.0f alpha:1.0f] range:NSMakeRange(0, 5)];
    
    leftImage = [FLAnimatedImageView new];
    leftImage.image = UIIMAGE(@"icon-首页-班级动态");
    [backView addSubview:leftImage];
    tabview = [HomeWorkTableView new];
    [backView addSubview:tabview];
    
//    rightImage = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(15) TextAlignment:NSTextAlignmentRight Text:@""];
//    [backView addSubview:rightImage];
//
//    userimage = [FLAnimatedImageView new];
//    userimage.image = UIIMAGE(ZHANWEITUTX);
//    [backView addSubview:userimage];
//
//    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(19) TextAlignment:NSTextAlignmentLeft Text:@""];
//    [backView addSubview:title];
    
    WS(ws);
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(LENGTH(38));
    }];
    
    [leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->backView.mas_left).with.offset(LENGTH(26));
        make.centerY.mas_equalTo(self->backView.mas_centerY);
        make.height.mas_offset(LENGTH(29));
        make.width.mas_offset(LENGTH(29));
    }];
    
    [tabview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(11));
        make.top.equalTo(self->backView).with.offset(0);
        make.bottom.equalTo(self->backView).with.offset(0);
        make.right.equalTo(self->backView.mas_right);
    }];
    
//    [rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self->backView.mas_right).with.offset(-LENGTH(26));
//        make.centerY.mas_equalTo(self->userimage.mas_centerY);
//    }];
//
//    [userimage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(30));
//        make.centerY.mas_equalTo(self->leftImage.mas_centerY);
//        make.height.mas_offset(LENGTH(28));
//        make.width.mas_offset(LENGTH(28));
//    }];
//
//    [title mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self->userimage.mas_right).with.offset(LENGTH(16));
//        make.right.equalTo(self->rightImage.mas_left).with.offset(-LENGTH(12));
//        make.centerY.mas_equalTo(self->userimage.mas_centerY);
//
//    }];
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
    //将手势添加到需要相应的view中去
    [self addGestureRecognizer:tapGesture1];    // 创建定时器
//        NSTimer *timer = [NSTimer timerWithTimeInterval:3.5 target:self selector:@selector(test) userInfo:nil repeats:YES];
//        // 将定时器添加到runloop中，否则定时器不会启动
//        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}
//- (void)test{
//    CGRect lastframetouxiang = userimage.frame;
//    CGRect titleframetouxiang = title.frame;
//    CGRect rightImageframelast = rightImage.frame;
//
//    [UIView animateWithDuration:3 animations:^{
//        CGRect frame = self->userimage.frame;
//        frame.origin.y = -self->backView.frame.size.height;
//        self->userimage.frame = frame;
//
//        CGRect titleframe = self->title.frame;
//        titleframe.origin.y = -self->backView.frame.size.height;
//        self->title.frame = titleframe;
//
//        CGRect  rightImageframe= self->rightImage.frame;
//        rightImageframe.origin.y = -self->backView.frame.size.height;
//        self->rightImage.frame = rightImageframe;
//    } completion:^(BOOL finished) {
//        self->userimage.frame = lastframetouxiang;
//        self->title.frame = titleframetouxiang;
//        self->rightImage.frame = rightImageframelast;
//        self->title.text = [NSString stringWithFormat:@"%@%ld",self->title.text,self->inter];
//        self->inter++;
//    }];
//
//}

- (void)tapGesture1{
    ClassDTViewController * vc = [ClassDTViewController new];
    [self.nav pushViewController:vc animated:YES];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
}
- (void)setItemarray:(NSMutableArray *)itemarray{
//    _itemarray = itemarray;
    _itemarray = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        [_itemarray addObjectsFromArray:itemarray];
    }
    tabview.itemarray = _itemarray;
    [timer invalidate];
    timer = nil;
    inters = 1;
    [self fan];
    timer = [NSTimer timerWithTimeInterval:6 target:self selector:@selector(fan) userInfo:nil repeats:YES];
    // 将定时器添加到runloop中，否则定时器不会启动
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
}
- (void)fan{
    if (inters < _itemarray.count-1) {
        inters++;
        [tabview Next:inters];
    }else{
        inters = 1;
        [tabview OneCell:inters];
    }
    
//    DynamicListModel * model = _itemarray[inters];
//    title.text = [NSString stringWithFormat:@"%@",model.code];
////    rightImage.text = model.time;
//    UIImage * img;
//    if (model.sex == 1) {
//        img = UIIMAGE(ZHANWEITUTXN);
//    }else{
//        img = UIIMAGE(ZHANWEITUTXV);
//    }
//    [userimage sd_setImageWithURL:URLIMAGE(model.avatar) placeholderImage:img];
//    NSString *subtypeString;
//    subtypeString = kCATransitionFromTop;
//    [self transitionWithType:@"CurlUp" WithSubtype:subtypeString ForView:self];

}
#pragma CATransition动画实现
/**
 *  动画效果实现
 *
 *  @param type    动画的类型 在开头的枚举中有列举,比如 CurlDown//下翻页,CurlUp//上翻页
 ,FlipFromLeft//左翻转,FlipFromRight//右翻转 等...
 *  @param subtype 动画执行的起始位置,上下左右
 *  @param view    哪个view执行的动画
 */
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view {
//    CATransition *animation = [CATransition animation];
//    animation.duration = 0.7f;
//    animation.type = type;
//    if (subtype != nil) {
//        animation.subtype = subtype;
//    }
//    //    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
//    [view.layer addAnimation:animation forKey:@"animation"];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
@end
