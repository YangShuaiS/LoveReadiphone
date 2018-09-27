//
//  PersonXuanZeZhaoPian.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PersonXuanZeZhaoPian.h"

#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>
#import "UIImage+SGImageSize.h"

@implementation PersonXuanZeZhaoPian{
    BaseLabel * quxiao;
    BaseLabel * xiangce;
    BaseLabel * shexiangtou;
    
    UIImagePickerController *pickerCon;

}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    self.userInteractionEnabled = YES;
    BaseView * backView = [BaseView new];
    backView.backgroundColor = RGBA(0, 0, 0, 0.4);
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    quxiao = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(153,153,153) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"取消"];
    quxiao.backgroundColor = [UIColor whiteColor];
    [self addSubview:quxiao];
    [quxiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws).with.offset(LENGTH(0));
        make.left.mas_equalTo(ws).with.offset(LENGTH(0));
        make.right.mas_equalTo(ws).with.offset(LENGTH(0));
        make.height.mas_equalTo(LENGTH(74));
    }];
    quxiao.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(quxiao:)];
    [quxiao addGestureRecognizer:tapGesturRecognizer];

    
    xiangce = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"从相册选取照片"];
    xiangce.backgroundColor = [UIColor whiteColor];
    [self addSubview:xiangce];
    [xiangce mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self->quxiao.mas_top).with.offset(-1);
        make.left.mas_equalTo(ws).with.offset(LENGTH(0));
        make.right.mas_equalTo(ws).with.offset(LENGTH(0));
        make.height.mas_equalTo(LENGTH(74));
    }];
    xiangce.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesturRecognizer1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(xiangce:)];
    [xiangce addGestureRecognizer:tapGesturRecognizer1];
    
    
    shexiangtou = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"使用摄像头拍摄"];
    shexiangtou.backgroundColor = [UIColor whiteColor];
    [self addSubview:shexiangtou];
    [shexiangtou mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self->xiangce.mas_top).with.offset(-1);
        make.left.mas_equalTo(ws).with.offset(LENGTH(0));
        make.right.mas_equalTo(ws).with.offset(LENGTH(0));
        make.height.mas_equalTo(LENGTH(74));
    }];
    shexiangtou.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesturRecognizer2=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(shexiangtou:)];
    [shexiangtou addGestureRecognizer:tapGesturRecognizer2];
}
- (void)xuaoshi{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
- (void)quxiao:(UITapGestureRecognizer *)tap{
    [self xuaoshi];
}
- (void)xiangce:(UITapGestureRecognizer *)tap{
    // 1、 获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        // 判断授权状态
        PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
        if (status == PHAuthorizationStatusNotDetermined) { // 用户还没有做出选择
            // 弹框请求用户授权
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                if (status == PHAuthorizationStatusAuthorized) { // 用户第一次同意了访问相册权限
                    dispatch_sync(dispatch_get_main_queue(), ^{
                        [self enterImagePickerController];
                    });

                } else { // 用户第一次拒绝了访问相机权限

                }
            }];
            
        } else if (status == PHAuthorizationStatusAuthorized) { // 用户允许当前应用访问相册

            [self enterImagePickerController];
        } else if (status == PHAuthorizationStatusDenied) { // 用户拒绝当前应用访问相册
            [self enterImagePickerController];
        } else if (status == PHAuthorizationStatusRestricted) {
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"由于系统原因, 无法访问相册" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alertC addAction:alertA];
            [self.nav presentViewController:alertC animated:YES completion:nil];
        }
    }

}

// 进入 UIImagePickerController
- (void)enterImagePickerController {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    imagePicker.allowsEditing = YES;
    imagePicker.delegate = self;
    [self.nav presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark - - - UIImagePickerControllerDelegate
#pragma mark ----更改
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self.nav dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    // 对选取照片的处理，如果选取的图片尺寸过大，则压缩选取图片，否则不作处理
    UIImage *image = [UIImage SG_imageSizeWithScreenImage:info[UIImagePickerControllerOriginalImage]];
    self.block(image);
    [self.nav dismissViewControllerAnimated:YES completion:nil];
    [self xuaoshi];


}
- (void)shexiangtou:(UITapGestureRecognizer *)tap{
    pickerCon = [[UIImagePickerController alloc]init];
    pickerCon.sourceType = UIImagePickerControllerSourceTypeCamera;
    pickerCon.allowsEditing = YES;//是否可编辑
    pickerCon.delegate = self;
    [self QRCodeScanVC:pickerCon];
}
- (void)QRCodeScanVC:(UIViewController *)scanVC {
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        switch (status) {
                case AVAuthorizationStatusNotDetermined: {
                    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                        if (granted) {
                            dispatch_sync(dispatch_get_main_queue(), ^{
                                //                            if ([scanVC.class isEqual:UIImagePickerController]) {
                                //
                                //                            }
                                if ([scanVC.class isEqual:UIImagePickerController.class]) {
                                    [self.nav presentViewController:scanVC animated:YES completion:nil];

                                }else{
                                    [self.nav pushViewController:scanVC animated:YES];
                                }                        });
//                            MJExtensionLog(@"用户第一次同意了访问相机权限 - - %@", [NSThread currentThread]);
                        } else {
//                            MJExtensionLog(@"用户第一次拒绝了访问相机权限 - - %@", [NSThread currentThread]);
                        }
                    }];
                    break;
                }
                case AVAuthorizationStatusAuthorized: {
                    if ([scanVC.class isEqual:UIImagePickerController.class]) {
                        [self.nav presentViewController:scanVC animated:YES completion:nil];
                    }else{
                        [self.nav pushViewController:scanVC animated:YES];
                    }
                    break;
                }
                case AVAuthorizationStatusDenied: {
                    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请去-> [设置 - 隐私 - 相机 - SGQRCodeExample] 打开访问开关" preferredStyle:(UIAlertControllerStyleAlert)];
                    UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {

                    }];

                    [alertC addAction:alertA];
                    [self.nav presentViewController:alertC animated:YES completion:nil];
                    break;
                }
                case AVAuthorizationStatusRestricted: {
//                    MJExtensionLog(@"因为系统原因, 无法访问相册");
                    break;
                }

            default:
                break;
        }
        return;
    }

    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"未检测到您的摄像头" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {

    }];

    [alertC addAction:alertA];
    [self.nav presentViewController:alertC animated:YES completion:nil];
}
@end
