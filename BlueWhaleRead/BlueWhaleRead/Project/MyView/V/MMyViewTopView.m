//
//  MMyViewTopView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MMyViewTopView.h"
#import "MyTopErWeiMaView.h"
@implementation MMyViewTopView{
    FLAnimatedImageView * UserImageView;
    BaseLabel * name;
    BaseLabel * banji;
    
    BaseLabel * YDFJ;
    BaseLabel * YDJF;
    BaseLabel * BJPM;
    
    FLAnimatedImageView * xingbie ;
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
    self.backgroundColor = RGBA(255, 255, 255, 1);
    UIView * backview = [UIView new];
    backview.backgroundColor = RGBA(255, 255, 255, 1);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(8));
        make.left.mas_equalTo(ws).with.offset(LENGTH(22));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(22));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(8));
    }];
    
    backview.layer.shadowColor = RGB(26, 26, 26).CGColor;
    backview.layer.shadowOffset = CGSizeMake(0,3);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    backview.layer.shadowRadius = LENGTH(15);
    backview.layer.shadowOpacity = 0.1;
    
    UserImageView = [FLAnimatedImageView new];
    UserImageView.backgroundColor = RGB(226,224,224);
    UserImageView.layer.cornerRadius = LENGTH(35);
    UserImageView.layer.masksToBounds = YES;
    [self addSubview:UserImageView];
    [UserImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backview).with.offset(LENGTH(16));
        make.centerX.mas_equalTo(backview);
        make.height.and.width.mas_equalTo(LENGTH(70));
    }];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(68, 68, 68) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"姓名"];
    name.numberOfLines = 2;
    [self addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->UserImageView.mas_bottom).with.offset(LENGTH(13));
        make.centerX.mas_equalTo(backview);
//        make.width.mas_equalTo(backview).multipliedBy(0.8);
    }];
    
    xingbie = [FLAnimatedImageView new];
//    xingbie.backgroundColor = RGB(226,224,224);
    [self addSubview:xingbie];
    [xingbie mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->name.mas_centerY);
        make.left.mas_equalTo(self->name.mas_right).with.offset(LENGTH(2));
        make.width.mas_equalTo(LENGTH(13));
        make.height.mas_equalTo(LENGTH(13));
    }];
    
    
    banji = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(68, 68, 68) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"班级"];
    [self addSubview:banji];
    [banji mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->name.mas_bottom).with.offset(LENGTH(6));
        make.centerX.mas_equalTo(backview);
        make.width.mas_equalTo(backview).multipliedBy(0.8);
    }];
    
    BaseLabel * tdfj = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(108,107,107) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"等级"];
    [self addSubview:tdfj];
    
    BaseLabel * tdjf = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(108,107,107) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"积分"];
    [self addSubview:tdjf];
    
    BaseLabel * ydjf = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(108,107,107) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"班级排名"];
    [self addSubview:ydjf];
    
    YDFJ = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(108,107,107) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:YDFJ];
    
    YDJF = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(108,107,107) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:YDJF];
    
    BJPM = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(108,107,107) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:BJPM];
    
    [tdfj mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->banji.mas_bottom).with.offset(LENGTH(20));
        make.left.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(tdjf.mas_width);
    }];
    
    [YDFJ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tdfj.mas_bottom).with.offset(LENGTH(6));
        make.centerX.mas_equalTo(tdfj.mas_centerX);
    }];
    
    
    [tdjf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(tdfj.mas_centerY);
        make.left.equalTo(tdfj.mas_right).with.offset(0);
        make.width.mas_equalTo(ydjf.mas_width);
    }];
    [YDJF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tdjf.mas_bottom).with.offset(LENGTH(6));
        make.centerX.mas_equalTo(tdjf.mas_centerX);
    }];
    
    [ydjf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(tdfj.mas_centerY);
        make.left.equalTo(tdjf.mas_right).with.offset(0);
        make.right.mas_equalTo(ws);
        make.width.mas_equalTo(tdfj.mas_width);
    }];
    [BJPM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ydjf.mas_bottom).with.offset(LENGTH(6));
        make.centerX.mas_equalTo(ydjf.mas_centerX);
        make.bottom.mas_equalTo(backview.mas_bottom).with.offset(-LENGTH(22));
    }];
    
    UIImageView * erweima = [UIImageView new];
    erweima.contentMode = UIViewContentModeScaleAspectFit;
    erweima.image = UIIMAGE(@"二维码icon");
    [backview addSubview:erweima];
    [erweima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backview).with.offset(LENGTH(26));
        make.right.mas_equalTo(backview).with.offset(-LENGTH(30));
        make.width.and.height.mas_equalTo(LENGTH(23));
    }];
    
    backview.userInteractionEnabled = YES;
    erweima.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backview)];
    //将手势添加到需要相应的view中去
    [erweima addGestureRecognizer:tapviewtap];}

- (void)setModel:(MyUserInfo *)model{
    _model = model;
    name.text = model.name;
    banji.text = [NSString stringWithFormat:@"%@%@",model.grade[@"name"],model.clazz[@"name"]];
    UIImage * img;
    
    if (model.sex == 1) {
        xingbie.image = UIIMAGE(@"组 302");
    }else{
        xingbie.image = UIIMAGE(@"组 301");
    }
    if (model.sex == 1) {
        img = UIIMAGE(ZHANWEITUTXN);
    }else{
        img = UIIMAGE(ZHANWEITUTXV);
    }
    [UserImageView sd_setImageWithURL:URLIMAGE(model.avatar) placeholderImage:img];
    YDFJ.text = [NSString stringWithFormat:@"Lv %@",model.level];
    YDJF.text = model.score;
    BJPM.text = model.myRank;
    
    
}




- (void)backview{
    WS(ws);
    MyTopErWeiMaView * view = [MyTopErWeiMaView new];
    [[self viewController].view.window addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo([ws viewController].view);
    }];
}
@end
