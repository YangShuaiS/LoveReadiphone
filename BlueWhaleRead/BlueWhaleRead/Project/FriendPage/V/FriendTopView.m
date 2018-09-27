//
//  FriendTopView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FriendTopView.h"

@implementation FriendTopView{
    FLAnimatedImageView * UserImage;
    BaseLabel * Name;
    BaseLabel * LV;
    BaseLabel * JFALL;//积分
    BaseLabel * YDLALL;//阅读量
    BaseLabel * BJPMALL;//班级排名
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    
    BaseView * backView = [BaseView new];
    backView.backgroundColor = [UIColor whiteColor];
    backView.layer.masksToBounds = YES;
//    backView.layer.cornerRadius = LENGTH(10);
    [self addSubview:backView];
    
    BaseView * inagev = [BaseView new];
    inagev.backgroundColor = RGBA(0x00, 0x00, 0x00, 0.2);
    inagev.layer.shadowColor = [UIColor blackColor].CGColor;
    inagev.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    inagev.layer.shadowRadius = LENGTH(2);
    inagev.layer.shadowOpacity = 1;
//    inagev.layer.masksToBounds = YES;
    inagev.layer.cornerRadius = LENGTH(37);
    [self addSubview:inagev];
    
    
    UserImage  = [FLAnimatedImageView new];
    UserImage.layer.masksToBounds = YES;
    UserImage.layer.cornerRadius = LENGTH(35);
//    UserImage.layer.shadowOpacity = 0.2;

    [self addSubview:UserImage];
    
    Name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(77,77,77) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@""];
    [backView addSubview:Name];
    
    BaseLabel * LVALL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(153,153,153) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@"等级"];
    [backView addSubview:LVALL];
    
    LV = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(102, 102, 102) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"lv999"];
    [backView addSubview:LV];
    
    BaseLabel * JF = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(153,153,153) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@"积分"];
    [backView addSubview:JF];
    
    JFALL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(102, 102, 102) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"999"];
    [backView addSubview:JFALL];
    
    BaseLabel * YDL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(153,153,153) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@"阅读量"];
    [backView addSubview:YDL];
    
    YDLALL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(102, 102, 102) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"999"];
    [backView addSubview:YDLALL];
    
    BaseLabel * BJPM = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(153,153,153) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@"班级排名"];
    [backView addSubview:BJPM];
    
    BJPMALL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(102, 102, 102) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"999"];
    [backView addSubview:BJPMALL];
    
    
    
    WS(ws);
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(27));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
    }];
    
    [inagev mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_top).with.offset(-LENGTH(27));
        make.centerX.mas_equalTo(backView.mas_centerX);
        make.width.mas_equalTo(LENGTH(74));
        make.height.mas_equalTo(LENGTH(74));

    }];
    [UserImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_top).with.offset(-LENGTH(26));
        make.centerX.mas_equalTo(backView.mas_centerX);
        make.width.mas_equalTo(LENGTH(70));
        make.height.mas_equalTo(LENGTH(70));
    }];
    
    [Name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(backView.mas_centerX);
        make.top.equalTo(self->UserImage.mas_bottom).with.offset(LENGTH(10));
    }];
    
    [LVALL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backView.mas_left).with.offset(0);
        make.right.mas_equalTo(JF.mas_left).with.offset(0);
        make.top.mas_equalTo(self->Name.mas_bottom).with.offset(LENGTH(16));
        make.width.mas_equalTo(JF.mas_width);
        
    }];
    
    [LV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(LVALL.mas_bottom).with.offset(LENGTH(5));
        make.centerX.mas_equalTo(LVALL.mas_centerX);
        make.width.mas_equalTo(LVALL.mas_width);
    }];
    
    [JF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(LVALL.mas_right).with.offset(0);
        make.right.mas_equalTo(YDL.mas_left).with.offset(0);
        make.top.mas_equalTo(self->Name.mas_bottom).with.offset(LENGTH(16));
        make.width.mas_equalTo(YDL.mas_width);
    }];
    
    [JFALL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(JF.mas_bottom).with.offset(LENGTH(5));
        make.centerX.mas_equalTo(JF.mas_centerX);
        make.width.mas_equalTo(JF.mas_width);
    }];

    [YDL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(JF.mas_right).with.offset(0);
        make.right.mas_equalTo(BJPM.mas_left).with.offset(0);
        make.top.mas_equalTo(self->Name.mas_bottom).with.offset(LENGTH(16));
        make.width.mas_equalTo(BJPM.mas_width);
    }];

    [YDLALL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(YDL.mas_bottom).with.offset(LENGTH(5));
        make.centerX.mas_equalTo(YDL.mas_centerX);
        make.width.mas_equalTo(YDL.mas_width);
    }];
    
    [BJPM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(YDL.mas_right).with.offset(0);
        make.right.mas_equalTo(backView.mas_right).with.offset(0);
        make.top.mas_equalTo(self->Name.mas_bottom).with.offset(LENGTH(16));
        make.width.mas_equalTo(YDL.mas_width);

    }];
    
    [BJPMALL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(BJPM.mas_bottom).with.offset(LENGTH(5));
        make.centerX.mas_equalTo(BJPM.mas_centerX);
        make.width.mas_equalTo(BJPM.mas_width);
        make.bottom.equalTo(backView.mas_bottom).with.offset(-LENGTH(18));
    }];
}
- (void)setUsermodel:(FriendUserModel *)usermodel{
    _usermodel = usermodel;
    UIImage * img;
    if (usermodel.sex == 1) {
        img = UIIMAGE(ZHANWEITUTXN);
    }else{
        img = UIIMAGE(ZHANWEITUTXV);
    }
    [UserImage sd_setImageWithURL:URLIMAGE(usermodel.avatar) placeholderImage:img];
    Name.text = usermodel.name;
    LV.text = usermodel.level;
    JFALL.text = usermodel.score;
    YDLALL.text = usermodel.readNum;
    BJPMALL.text = usermodel.rank;
}
@end
