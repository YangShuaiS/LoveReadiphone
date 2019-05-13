//
//  MMyViewTopView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MMyViewTopView.h"
#import "MyTopErWeiMaView.h"
#import "BaseNavigationViewController.h"
#import "UserLoginViewController.h"
#import "MyMessageViewController.h"

#import "PersonXuanZeZhaoPian.h"
#import "PersonalViewController.h"
@implementation MMyViewTopView{
    FLAnimatedImageView * UserImageView;
    BaseLabel * name;
    BaseLabel * banji;
    BaseLabel * nianji;

    
    BaseLabel * YDFJ;
    BaseLabel * YDJF;
    BaseLabel * BJPM;
    
    CAGradientLayer *gradientLayer0;
    UIView * style;
    BaseLabel *clickLabel;

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
    UIImageView *topview = [UIImageView new];
    topview.image = UIIMAGE(@"顶部-背景");
    topview.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:topview];
    [topview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.and.left.and.right.mas_equalTo(ws);
        make.edges.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(10));

    }];
    
    topview.layer.shadowOpacity = 1;
    topview.layer.shadowColor = RGBA(240,240,240,1).CGColor;
    topview.layer.shadowRadius = LENGTH(7);
    topview.layer.shadowOffset = CGSizeMake(0,LENGTH(5));
    
    UIImageView * erweima = [UIImageView new];
    erweima.contentMode = UIViewContentModeScaleAspectFit;
    erweima.image = UIIMAGE(@"二维码");
    [topview addSubview:erweima];
    [erweima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topview).with.offset(StatusBar+LENGTH(39));
        make.right.mas_equalTo(topview).with.offset(-LENGTH(16));
        make.width.and.height.mas_equalTo(LENGTH(17));
    }];
    
    topview.userInteractionEnabled = YES;
    erweima.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backview)];
    //将手势添加到需要相应的view中去
    [erweima addGestureRecognizer:tapviewtap];
//    
//    UIImageView * xinxi = [UIImageView new];
//    xinxi.contentMode = UIViewContentModeScaleAspectFit;
//    xinxi.image = UIIMAGE(@"消息");
//    [topview addSubview:xinxi];
//    [xinxi mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(topview).with.offset(StatusBar+10);
//        make.right.mas_equalTo(topview).with.offset(-LENGTH(20));
//        make.width.and.height.mas_equalTo(LENGTH(25));
//    }];
//    
//    xinxi.userInteractionEnabled = YES;
//    UITapGestureRecognizer * tapview = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xinxi)];
//    //将手势添加到需要相应的view中去
//    [xinxi addGestureRecognizer:tapview];
    
    UIView * userbackview = [UIView new];
    userbackview.backgroundColor = [UIColor whiteColor];
    userbackview.layer.cornerRadius = LENGTH(34);
    userbackview.layer.shadowOpacity = 1;
    userbackview.layer.shadowColor = RGBA(73, 58, 18,0.6).CGColor;
    userbackview.layer.shadowRadius = 1.0f;
    userbackview.layer.shadowOffset = CGSizeMake(0,0);
    [self addSubview:userbackview];
    [userbackview mas_makeConstraints:^(MASConstraintMaker *make) {

    }];
    
    UserImageView = [FLAnimatedImageView new];
    UserImageView.layer.masksToBounds = YES;
    UserImageView.layer.cornerRadius = LENGTH(30);
    UserImageView.layer.borderColor = [[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f] CGColor];
    UserImageView.layer.borderWidth = 4;
    UserImageView.layer.backgroundColor = [[UIColor colorWithRed:255.0f/255.0f green:214.0f/255.0f blue:215.0f/255.0f alpha:1.0f] CGColor];

    [topview addSubview:UserImageView];
    [UserImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(39)+StatusBar);
        make.left.mas_equalTo(ws).with.offset(LENGTH(30));
        make.size.mas_equalTo(CGSizeMake(LENGTH(60), LENGTH(60)));
    }];
    UserImageView.layer.shadowOpacity = 1;
    UserImageView.layer.shadowColor = RGBA(194,194,194,1).CGColor;
    UserImageView.layer.shadowRadius = LENGTH(9);
    UserImageView.layer.shadowOffset = CGSizeMake(0,0);
    
    
//    UserImageView.userInteractionEnabled = YES;
//    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userImage:)];
//    [UserImageView addGestureRecognizer:tapGesturRecognizer];

    
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0, 0, 0) LabelFont:TextFontCu(18) TextAlignment:NSTextAlignmentLeft Text:@"姓名"];
    [topview addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->UserImageView.mas_right).with.offset(LENGTH(15));
        make.top.mas_equalTo(self->UserImageView.mas_top).with.offset(LENGTH(5));
        make.height.mas_equalTo(LENGTH(17));
    }];
    
    style = [UIView new];
    style.layer.cornerRadius = LENGTH(8);
    [self addSubview:style];
    [style mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->name);
        make.left.mas_equalTo(self->name.mas_right).with.offset(LENGTH(6));
        make.height.mas_equalTo(LENGTH(16));
    }];
    
    //Gradient 0 fill for 圆角矩形 3
    gradientLayer0 = [[CAGradientLayer alloc] init];
    gradientLayer0.cornerRadius = LENGTH(8);
    gradientLayer0.colors = @[
                              (id)[UIColor colorWithRed:200.0f/255.0f green:170.0f/255.0f blue:119.0f/255.0f alpha:1.0f].CGColor,
                              (id)[UIColor colorWithRed:234.0f/255.0f green:208.0f/255.0f blue:161.0f/255.0f alpha:1.0f].CGColor];
    gradientLayer0.locations = @[@0, @1];
    [gradientLayer0 setStartPoint:CGPointMake(1, 1)];
    [gradientLayer0 setEndPoint:CGPointMake(1, 0)];
    
    clickLabel = [[BaseLabel alloc] initWithTxteColor:RGB(255,255,255) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:@"未开通会员"];
    [self addSubview:clickLabel];
    [clickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->style).with.insets(UIEdgeInsetsMake(0, LENGTH(7), 0, LENGTH(7)));
    }];
    
    style.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [style addGestureRecognizer:tap];
    
    banji = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(171, 171, 171) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"班级"];
    [topview addSubview:banji];
    [banji mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->name.mas_bottom).with.offset(LENGTH(12));
        make.left.mas_equalTo(self->UserImageView.mas_right).with.offset(LENGTH(15));
        make.height.mas_equalTo(LENGTH(12));

    }];
    
    nianji = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(171, 171, 171) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"班级"];
    [topview addSubview:nianji];
    [nianji mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->banji.mas_bottom).with.offset(LENGTH(8));
        make.left.mas_equalTo(self->UserImageView.mas_right).with.offset(LENGTH(15));
        make.height.mas_equalTo(LENGTH(12));
    }];
    
    
    
    UIView * backview = [UIView new];
    backview.backgroundColor = [UIColor clearColor];
    [topview addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->UserImageView.mas_bottom).with.offset(LENGTH(15));
        make.left.mas_equalTo(topview).with.offset(LENGTH(20));
        make.right.mas_equalTo(topview).with.offset(-LENGTH(20));
        make.bottom.mas_equalTo(topview).with.offset(-LENGTH(10));
    }];
    
    BaseLabel * tdfj = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(171,171,171) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"等级"];
    [backview addSubview:tdfj];
    
    BaseLabel * tdjf = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(171,171,171) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"积分"];
    [backview addSubview:tdjf];
    
    BaseLabel * ydjf = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(171,171,171) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"班级排名"];
    [backview addSubview:ydjf];
    
    YDFJ = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(38,38,38) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@""];
    [backview addSubview:YDFJ];
    
    YDJF = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(38,38,38) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@""];
    [backview addSubview:YDJF];
    
    BJPM = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(38,38,38) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@""];
    [backview addSubview:BJPM];
    
    [YDFJ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backview).with.offset(LENGTH(15));
        make.left.equalTo(backview).with.offset(0);
        make.width.mas_equalTo(self->YDJF.mas_width);
    }];
    
    [tdfj mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->YDFJ.mas_bottom).with.offset(LENGTH(1));
        make.centerX.mas_equalTo(self->YDFJ);
    }];
    
    [YDJF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backview).with.offset(LENGTH(15));
        make.left.equalTo(self->YDFJ.mas_right).with.offset(0);
        make.width.mas_equalTo(self->BJPM.mas_width);
    }];
    
    [tdjf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->YDJF.mas_bottom).with.offset(LENGTH(1));
        make.centerX.mas_equalTo(self->YDJF);
    }];

    [BJPM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backview).with.offset(LENGTH(15));
        make.left.equalTo(self->YDJF.mas_right).with.offset(0);
        make.right.mas_equalTo(backview);
        make.width.mas_equalTo(self->YDJF.mas_width);
    }];
    
    [ydjf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->BJPM.mas_bottom).with.offset(LENGTH(1));
        make.centerX.mas_equalTo(self->BJPM);
        make.bottom.mas_equalTo(backview.mas_bottom).with.offset(-LENGTH(16));
    }];
    
    UIView * pushV = [UIView new];
    [self addSubview:pushV];
    [pushV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.bottom.mas_equalTo(self->UserImageView);
        make.right.mas_equalTo(self->style);
    }];
    
    pushV.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(push)];
    [pushV addGestureRecognizer:tapGesturRecognizer];
}

- (void)push{
    PersonalViewController * vc = [PersonalViewController new];
    [[self viewController].navigationController pushViewController:vc animated:YES];
}

- (void)setModel:(MyUserInfo *)model{
    _model = model;
    if (model.is_member == 0) {
        clickLabel.text = @"未开通会员";
    }else{
        clickLabel.text = @"已开通会员";
    }
    name.text = model.name;
    banji.text = [NSString stringWithFormat:@"%@%@",model.grade.name,model.clazz.name];
    nianji.text = model.school.name;
    UIImage * img;
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
    if ([Me.is_rebot isEqualToString:@"2"]) {
        MyTopErWeiMaView * view = [MyTopErWeiMaView new];
        [[self viewController].view.window addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo([ws viewController].view);
        }];
    }else{
        BaseNavigationViewController * homenav = [[BaseNavigationViewController alloc] initWithRootViewController:[UserLoginViewController new]];
        [[self viewController] presentViewController:homenav animated:YES completion:^{
            
        }];
    }
    
}

- (void)xinxi{
    if ([Me.is_rebot isEqualToString:@"2"]) {
        MyMessageViewController *  vc = [MyMessageViewController new];
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }else{
        BaseNavigationViewController * homenav = [[BaseNavigationViewController alloc] initWithRootViewController:[UserLoginViewController new]];
        [[self viewController] presentViewController:homenav animated:YES completion:^{
            
        }];
    }
    

}

- (void)userImage:(UITapGestureRecognizer *)tap{
    WS(ws);
    PersonXuanZeZhaoPian * xuanze = [PersonXuanZeZhaoPian new];
    xuanze.nav = [self viewController].navigationController;
    [[self viewController].tabBarController.view addSubview:xuanze];
    [xuanze mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo([ws viewController].tabBarController.view);
    }];
    [xuanze setBlock:^(UIImage *image) {
        [ws updataImage:image];
    }];
}
- (void)updataImage:(UIImage *)image{
    UserImageView.image = image;
    NSData * imageData = UIImageJPEGRepresentation(image, 0.5);
    
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_SCTP];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    //    1.创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //2.上传文件
    [manager POST:url parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSString * str = [BaseObject getCurrentTimes];
        str = [NSString stringWithFormat:@"%@.jpg",str];
        //上传文件参数
        [formData appendPartWithFileData:imageData name:@"fileid" fileName:str mimeType:@"image/jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //打印上传进度
        CGFloat progress = 100.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
        NSLog(@"%f",progress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        MJExtensionLog(@"请求成功：%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //请求失败
        //            MJExtensionLog(@"请求失败：%@",error);
        
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    gradientLayer0.frame = style.bounds;
    [style.layer addSublayer:gradientLayer0];
    
}

- (void)click{
    
}
@end
