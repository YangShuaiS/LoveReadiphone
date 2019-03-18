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
@implementation MMyViewTopView{
    FLAnimatedImageView * UserImageView;
    BaseLabel * name;
    BaseLabel * banji;
    BaseLabel * nianji;

    
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
    UIView *topview = [UIView new];
    topview.backgroundColor = RGBA(91,199,198,0.85);
    [self addSubview:topview];
    [topview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
    }];
    
    UIImageView * erweima = [UIImageView new];
    erweima.contentMode = UIViewContentModeScaleAspectFit;
    erweima.image = UIIMAGE(@"二维码");
    [topview addSubview:erweima];
    [erweima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topview).with.offset(StatusBar+10);
        make.right.mas_equalTo(topview).with.offset(-LENGTH(20));
        make.width.and.height.mas_equalTo(LENGTH(25));
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
    
    
    UserImageView = [FLAnimatedImageView new];
    UserImageView.backgroundColor = RGB(226,224,224);
    UserImageView.layer.cornerRadius = LENGTH(35);
    UserImageView.layer.masksToBounds = YES;
    [topview addSubview:UserImageView];
    [UserImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topview).with.offset(StatusBar+44);
        make.left.mas_equalTo(topview).with.offset(LENGTH(25));
        make.height.and.width.mas_equalTo(LENGTH(70));
        make.bottom.mas_equalTo(topview).with.offset(-LENGTH(65));
    }];
    
    UserImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userImage:)];
    [UserImageView addGestureRecognizer:tapGesturRecognizer];
    
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentLeft Text:@"姓名"];
    [topview addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->UserImageView.mas_right).with.offset(LENGTH(17));
        make.top.mas_equalTo(self->UserImageView.mas_top);
    }];
    
    xingbie = [FLAnimatedImageView new];
    [topview addSubview:xingbie];
    [xingbie mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->name.mas_centerY);
        make.left.mas_equalTo(self->name.mas_right).with.offset(LENGTH(2));
        make.width.mas_equalTo(LENGTH(13));
        make.height.mas_equalTo(LENGTH(13));
    }];
    
    banji = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"班级"];
    [topview addSubview:banji];
    [banji mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->name.mas_bottom).with.offset(LENGTH(6));
        make.left.mas_equalTo(self->UserImageView.mas_right).with.offset(LENGTH(17));
    }];
    
    nianji = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"班级"];
    [topview addSubview:nianji];
    [nianji mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->banji.mas_bottom).with.offset(LENGTH(2));
        make.left.mas_equalTo(self->UserImageView.mas_right).with.offset(LENGTH(17));
    }];
    
    
    
    UIView * backview = [UIView new];
    backview.backgroundColor = RGBA(255, 255, 255, 1);
    backview.layer.cornerRadius = LENGTH(10);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topview.mas_bottom).with.offset(-LENGTH(39));
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(10));
    }];
    
    backview.layer.shadowColor = RGB(171, 171, 171).CGColor;
    backview.layer.shadowOffset = CGSizeMake(0,4);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    backview.layer.shadowRadius = LENGTH(8);
    backview.layer.shadowOpacity = 0.24;
    
    BaseLabel * tdfj = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"等级"];
    [backview addSubview:tdfj];
    
    BaseLabel * tdjf = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"积分"];
    [backview addSubview:tdjf];
    
    BaseLabel * ydjf = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"班级排名"];
    [backview addSubview:ydjf];
    
    YDFJ = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFont(19) TextAlignment:NSTextAlignmentCenter Text:@""];
    [backview addSubview:YDFJ];
    
    YDJF = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFont(19) TextAlignment:NSTextAlignmentCenter Text:@""];
    [backview addSubview:YDJF];
    
    BJPM = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFont(19) TextAlignment:NSTextAlignmentCenter Text:@""];
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
}

- (void)setModel:(MyUserInfo *)model{
    _model = model;
    name.text = model.name;
    banji.text = [NSString stringWithFormat:@"%@%@",model.grade.name,model.clazz.name];
    nianji.text = model.school.name;
    UIImage * img;
    if (model.sex == 1) {
        xingbie.image = UIIMAGE(@"男");
    }else{
        xingbie.image = UIIMAGE(@"女");
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
    MyMessageViewController *  vc = [MyMessageViewController new];
    [[self viewController].navigationController pushViewController:vc animated:YES];
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
@end
