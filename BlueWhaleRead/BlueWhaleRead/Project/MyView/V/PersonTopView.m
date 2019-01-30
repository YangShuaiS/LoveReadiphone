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
    self.backgroundColor = RGBA(255, 255, 255, 1);
    WS(ws);
    BaseView * backView = [BaseView new];
    backView.backgroundColor = RGBA(255, 255, 255, 1);
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(8));
        make.left.mas_equalTo(ws).with.offset(LENGTH(22));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(22));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(8));
    }];
    
    backView.layer.shadowColor = RGB(26, 26, 26).CGColor;
    backView.layer.shadowOffset = CGSizeMake(0,3);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    backView.layer.shadowRadius = LENGTH(15);
    backView.layer.shadowOpacity = 0.1;
    
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
