//
//  BuyShareView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/26.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyShareView.h"
#import "ArticleShareAnyOnelyView.h"
#import <Photos/Photos.h>

@implementation BuyShareView{
    NSMutableArray * viewarray;
    SSDKPlatformType platformType;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        viewarray = [NSMutableArray array];
        [self addview];
    }
    return self;
}

- (void)addview{
    WS(ws);
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
        ArticleShareAnyOnelyView * wxpyqclick = [[ArticleShareAnyOnelyView alloc] initWithImage:@"朋友圈1" Title:@"朋友圈"];
        //        [self addSubview:wxpyqclick];
        [viewarray addObject:wxpyqclick];
        wxpyqclick.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wxviewpyq)];
        [wxpyqclick addGestureRecognizer:tap2];
        
        ArticleShareAnyOnelyView * wxclick = [[ArticleShareAnyOnelyView alloc] initWithImage:@"微信" Title:@"微信"];
        //        [self addSubview:wxclick];
        [viewarray addObject:wxclick];
        wxclick.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wxhy)];
        [wxclick addGestureRecognizer:tap3];
    }
    
    ArticleShareAnyOnelyView * BaoCunBD = [[ArticleShareAnyOnelyView alloc] initWithImage:@"保存到相册" Title:@"保存到相册"];
    //        [self addSubview:_sc];
    [viewarray addObject:BaoCunBD];
    BaoCunBD.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BaoCunBD)];
    [BaoCunBD addGestureRecognizer:tap1];
    
    FLAnimatedImageView * lastview;
    for (int i = 0; i < viewarray.count; i++) {
        FLAnimatedImageView * view = viewarray[i];
        [self addSubview:view];
        if (i == 0) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(ws);
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(lastview.mas_right).with.offset(LENGTH(14));
            }];
        }
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.bottom.mas_equalTo(ws).with.offset(LENGTH(10));
            make.height.mas_equalTo(LENGTH(33));
        }];
        if (i == viewarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(ws);
            }];
        }
        lastview = view;
    }
}

- (void)wxviewpyq{
    platformType = SSDKPlatformSubTypeWechatTimeline;
    FenXiangModel * model = [FenXiangModel new];
    [self shareLinkpyqImaage:model];
}

- (void)wxhy{
    platformType = SSDKPlatformSubTypeWechatSession;
    FenXiangModel * model = [FenXiangModel new];
    [self shareLinkhyImage:model];
}

- (void)BaoCunBD{
    [self hb];
}


#pragma mark ----------------- 图片
- (void)shareLinkpyqImaage:(FenXiangModel *)dic
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    
    [parameters SSDKSetupWeChatParamsByText:dic.content
                                      title:dic.title
                                        url:nil
                                 thumbImage:nil
                                      image:_image
                               musicFileURL:nil
                                    extInfo:nil
                                   fileData:nil
                               emoticonData:nil
                        sourceFileExtension:nil
                             sourceFileData:nil
                                       type:SSDKContentTypeImage
                         forPlatformSubType:platformType];
    [self shareWithParameters:parameters];
}

- (void)shareLinkhyImage:(FenXiangModel *)dic
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupWeChatParamsByText:dic.content
                                      title:dic.title
                                        url:nil
                                 thumbImage:nil
                                      image:_image
                               musicFileURL:nil
                                    extInfo:nil
                                   fileData:nil
                               emoticonData:nil
                        sourceFileExtension:nil
                             sourceFileData:nil
                                       type:SSDKContentTypeImage
                         forPlatformSubType:platformType];
    [self shareWithParameters:parameters];
}
- (void)shareWithParameters:(NSMutableDictionary *)parameters{
    [ShareSDK share:platformType
         parameters:parameters
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
         if(state == SSDKResponseStateUpload){
             return ;
         }
         NSString *titel = @"";
         NSString *typeStr = @"";
         UIColor *typeColor = [UIColor grayColor];
         
         switch (state) {
             case SSDKResponseStateSuccess:
             {
                 titel = @"分享成功";
                 typeStr = @"成功";
                 typeColor = [UIColor blueColor];
                 break;
             }
             case SSDKResponseStateFail:
             {
                 //                 NSLog(@"---------------->share error :%@",error);
                 titel = @"分享失败";
                 typeStr = @"";
                 typeColor = [UIColor redColor];
                 break;
             }
             case SSDKResponseStateCancel:
             {
                 titel = @"分享已取消";
                 typeStr = @"取消";
                 break;
             }
             default:
                 break;
         }
         
         UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:titel
                                                             message:typeStr
                                                            delegate:nil
                                                   cancelButtonTitle:@"确定"
                                                   otherButtonTitles:nil];
         [alertView show];
         //         [self removeFromSuperview];
     }];
    
}

- (void)hb{
    WS(ws);
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[self viewController].navigationController.view animated:YES];
    hud.label.text = @"正在生成图片";
    if (_image == nil) {
        hud.label.text = @"图片暂未生成";
    }else{
        [[PHPhotoLibrary sharedPhotoLibrary]performChanges:^{
            [PHAssetChangeRequest creationRequestForAssetFromImage:ws.image];
        } completionHandler:^(BOOL success, NSError * _Nullable error) {
            dispatch_async(dispatch_get_global_queue(0,0),^{
                // 处理耗时操作的代码块...//通知主线程刷新
                dispatch_async(dispatch_get_main_queue(),^{
                    //回调或者说是通知主线程刷新，
                    if (error) {
                        hud.label.text = @"保存失败";
                    } else {
                        hud.label.text = @"保存成功";
                    }
                });
            });
        }];
    }
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES afterDelay:1];
        });
    });

}
@end
