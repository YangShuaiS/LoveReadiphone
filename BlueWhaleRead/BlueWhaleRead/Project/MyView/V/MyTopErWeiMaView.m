//
//  MyTopErWeiMaView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/18.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyTopErWeiMaView.h"
#import "UIImage+ChangeColor.h"
#import "SGQRCode.h"
@implementation MyTopErWeiMaView{
    UIImageView * erweima;
    UIView * bakeview;
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
    self.backgroundColor = RGBA(0, 0, 0, 0.6);
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xiaoshi)];
    [self addGestureRecognizer:tap];
    
    bakeview = [UIView new];
    bakeview.backgroundColor = [UIColor whiteColor];
    bakeview.layer.cornerRadius = LENGTH(10);
    bakeview.layer.masksToBounds = YES;
    [self addSubview:bakeview];
    [bakeview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(298));
        make.height.mas_equalTo(LENGTH(328));
    }];
    
    erweima = [UIImageView new];
    [bakeview addSubview:erweima];
    [erweima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->bakeview).with.offset(LENGTH(34));
        make.centerX.mas_equalTo(self->bakeview);
        make.width.and.height.mas_equalTo(LENGTH(229));
    }];
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(88, 88, 88) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"使用家长端小程序扫描此二维码可以绑定\n孩子的账号随时收到孩子读书动态"];
    title.numberOfLines = 2;
    [bakeview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->erweima.mas_bottom).with.offset(LENGTH(14));
        make.centerX.mas_equalTo(self->bakeview);
    }];
    NSString * s;
    if (![Me.code isEqualToString:@""]) {
        s = Me.code;
    }else{
        s = Me.phone;
    }
    NSString * str = [NSString stringWithFormat:@"%@_%@",Me.ssid,s];
    NSData *datas = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSData *base64Data = [datas base64EncodedDataWithOptions:0];
    NSString *baseString = [[NSString alloc]initWithData:base64Data encoding:NSUTF8StringEncoding];
    erweima.image = [SGQRCodeGenerateManager generateWithLogoQRCodeData:baseString logoImageName:@"天天爱读" logoScaleToSuperView:0.2];
//    erweima.image = [SGQRCodeObtain generateQRCodeWithData:@"https://github.com/kingsic" size:size logoImage:logoImage ratio:ratio];

//    [self addimage];
}
- (void)addimage{
    //生成二维码
    // 1. 创建一个二维码滤镜实例(CIFilter)
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 滤镜恢复默认设置
    [filter setDefaults];
    
    // 2. 给滤镜添加数据
    NSString * s;
    if (![Me.code isEqualToString:@""]) {
        s = Me.code;
    }else{
        s = Me.phone;
    }
    NSString * str = [NSString stringWithFormat:@"%@_%@",Me.ssid,s];
    NSData *datas = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSData *base64Data = [datas base64EncodedDataWithOptions:0];
    NSString *baseString = [[NSString alloc]initWithData:base64Data encoding:NSUTF8StringEncoding];
//
    NSString *string = baseString;
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"inputMessage"];
    
// 3. 生成高清二维码
    CIImage * image = [filter outputImage];
    CGAffineTransform transform = CGAffineTransformMakeScale(5.0f, 5.0f);
    CIImage *output = [image imageByApplyingTransform: transform];
    UIImage *newImage = [UIImage imageWithCIImage:output scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    // 4. 显示二维码
    erweima.image = newImage;
    NSTimer *timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(test) userInfo:nil repeats:YES];
    // 将定时器添加到runloop中，否则定时器不会启动
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}
- (void)test{
    UIColor * color = RANDOMCOLOR;
    [UIView animateWithDuration:1 animations:^{
        self->bakeview.backgroundColor = color;
        
    } completion:^(BOOL finished) {
        
    }];
}
- (void)xiaoshi{
    [self removeFromSuperview];
}
@end
