//
//  PersonTopView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PersonTopView.h"
#import "PersonXuanZeZhaoPian.h"
#import "PersonSheZhiViewController.h"
@implementation PersonTopView{
    FLAnimatedImageView * userImageView;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    self.backgroundColor = MAINCOLOR;
    WS(ws);
    BaseView * backView = [BaseView new];
    backView.backgroundColor = MAINCOLOR;
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.top.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
    }];
    
    userImageView = [FLAnimatedImageView new];
    userImageView.backgroundColor = RGB(245,250,250);
    userImageView.image = UIIMAGE(ZHANWEITUTX);
    userImageView.layer.masksToBounds= YES;
    userImageView.layer.cornerRadius = LENGTH(35);
    [backView addSubview:userImageView];
    [userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(backView);
        make.top.mas_equalTo(backView.mas_top).with.offset(LENGTH(34));
        make.bottom.mas_equalTo(backView.mas_bottom).with.offset(-LENGTH(50));
        make.width.mas_equalTo(LENGTH(70));
        make.height.mas_equalTo(LENGTH(70));
    }];
    userImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userImage:)];
    [userImageView addGestureRecognizer:tapGesturRecognizer];


    FLAnimatedImageView * shezhi = [FLAnimatedImageView new];
    shezhi.image = UIIMAGE(@"icon_个人资料_设置");
     [backView addSubview:shezhi];
    [shezhi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backView.mas_top).with.offset(LENGTH(9));
        make.right.mas_equalTo(backView.mas_right).with.offset(-LENGTH(21.5));
        make.width.mas_equalTo(LENGTH(25));
        make.height.mas_equalTo(LENGTH(25));
    }];
    
    shezhi.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesturRecognizer1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(shezhi:)];
    [shezhi addGestureRecognizer:tapGesturRecognizer1];
    
}
- (void)userImage:(UITapGestureRecognizer *)tap{
    WS(ws);
    PersonXuanZeZhaoPian * xuanze = [PersonXuanZeZhaoPian new];
    xuanze.nav = self.nav;
    [self.baseview addSubview:xuanze];
    [xuanze mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.baseview);
    }];
    [xuanze setBlock:^(UIImage *image) {
        [ws updataImage:image];
    }];
}
- (void)updataImage:(UIImage *)image{
    userImageView.image = image;
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
- (void)shezhi:(UITapGestureRecognizer *)tap{
    PersonSheZhiViewController * vc = [PersonSheZhiViewController new];
    vc.model = _model;
    [self.nav pushViewController:vc animated:YES];
}
- (void)setModel:(MyZiLiaoModel *)model{
    _model = model;
    UIImage * img;
    if (model.sex == 1) {
        img = UIIMAGE(ZHANWEITUTXN);
    }else{
        img = UIIMAGE(ZHANWEITUTXV);
    }
    [userImageView sd_setImageWithURL:URLIMAGE(model.avatar) placeholderImage:img];

}
@end
