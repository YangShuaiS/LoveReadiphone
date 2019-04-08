//
//  ZhiShiShuShareView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/1.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ZhiShiShuShareView.h"
#import <Photos/Photos.h>

@implementation ZhiShiShuShareView{
    BaseView * backview;
    UIView * wxclick;
    UIView * wxpyqclick;
    UIView * hbclick;
    NSMutableArray * viewarray;
    NSMutableArray * titarrays;
    FLAnimatedImageView * hbimageview;
    MBProgressHUD * mb;
    SSDKPlatformType platformType;

    FenXiangModel * models;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = RGBA(0x00, 0x00, 0x00, 0.6);
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xiaoshi)];
        [self addGestureRecognizer:tap];
    }
    return self;
}
- (void)addview{

    WS(ws);
    backview = [BaseView new];
    backview.backgroundColor = [UIColor whiteColor];
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.mas_equalTo(ws);
        //        make.height.mas_equalTo(LENGTH(67)+LENGTH(StatusBar));
    }];
    backview.userInteractionEnabled = YES;
    [self addimage];
    
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(197,195,195) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@"分享"];
    [backview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->backview).with.offset(LENGTH(9));
        make.centerX.mas_equalTo(self->backview);
    }];
    
    BaseView * onexian = [BaseView new];
    onexian.backgroundColor = RGB(220,229,235);
    [backview addSubview:onexian];
    [onexian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(title);
        make.right.mas_equalTo(title.mas_left).with.offset(-LENGTH(8));
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(LENGTH(70));
    }];
//
//    BaseView * twoxian = [BaseView new];
//    twoxian.backgroundColor = RGB(220,229,235);
//    [backview addSubview:twoxian];
//    [twoxian mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(title);
//        make.left.mas_equalTo(title.mas_right).with.offset(LENGTH(8));
//        make.height.mas_equalTo(1);
//        make.width.mas_equalTo(LENGTH(70));
//    }];
    
    
    BaseView * topview = [BaseView new];
    topview.backgroundColor = [UIColor whiteColor];
    [backview addSubview:topview];
    [topview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->backview);
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(15));
        make.bottom.mas_equalTo(self->backview).with.offset(-LENGTH(20));
    }];
    
    viewarray = [NSMutableArray array];
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
        FLAnimatedImageView * wxview = [FLAnimatedImageView new];
        wxview.image = UIIMAGE(@"微信");
        wxview.contentMode = UIViewContentModeScaleAspectFit;
        [topview addSubview:wxview];
        [viewarray addObject:wxview];
        
        wxclick = [UIView new];
        [topview addSubview:wxclick];
        wxclick.userInteractionEnabled = YES;
        [wxclick mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(wxview).with.insets(UIEdgeInsetsMake(-30, -30, -30, -30));
        }];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wxhy)];
        [wxclick addGestureRecognizer:tap];
        
        FLAnimatedImageView * wxviewpyq = [FLAnimatedImageView new];
        wxviewpyq.image = UIIMAGE(@"朋友圈");
        wxviewpyq.contentMode = UIViewContentModeScaleAspectFit;
        [topview addSubview:wxviewpyq];
        [viewarray addObject:wxviewpyq];
        
        wxpyqclick = [UIView new];
        [topview addSubview:wxpyqclick];
        wxpyqclick.userInteractionEnabled = YES;
        [wxpyqclick mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(wxviewpyq).with.insets(UIEdgeInsetsMake(-30, -30, -30, -30));
        }];
        UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wxviewpyq)];
        [wxpyqclick addGestureRecognizer:tap1];
    }
    FLAnimatedImageView * hb = [FLAnimatedImageView new];
    hb.image = UIIMAGE(@"保存到本地");
    hb.contentMode = UIViewContentModeScaleAspectFit;
    [topview addSubview:hb];
    [viewarray addObject:hb];
    
    hbclick = [UIView new];
    [topview addSubview:hbclick];
    hbclick.userInteractionEnabled = YES;
    [hbclick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(hb).with.insets(UIEdgeInsetsMake(-30, -30, -30, -30));
    }];
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xz)];
    [hbclick addGestureRecognizer:tap1];
    
    if (viewarray.count == 1) {
        NSArray * titarray = @[@"保存到相册"];
        FLAnimatedImageView * view = viewarray[0];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.mas_equalTo(topview);
            make.top.mas_equalTo(topview);
            make.width.and.height.mas_equalTo(LENGTH(40));
        }];
        BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(102,102,102) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:titarray[0]];
        [topview addSubview:title];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(view);
            make.top.mas_equalTo(view.mas_bottom).with.offset(LENGTH(10));
            make.bottom.mas_equalTo(topview);
        }];
    }else{
        NSArray * titarray = @[@"微信好友",@"朋友圈",@"保存到相册"];
        FLAnimatedImageView * lastview;
        for (int i = 0; i < viewarray.count; i++) {
            FLAnimatedImageView * view = viewarray[i];
            if (i == 0) {
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(topview);
                }];
                lastview = view;
            }else if (i == 1){
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(lastview.mas_right).with.offset(LENGTH(48));
                }];
                lastview = view;
                
            }else if (i == 2){
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(lastview.mas_right).with.offset(LENGTH(48));
                    make.right.mas_equalTo(topview);
                }];
            }
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(topview);
                make.width.and.height.mas_equalTo(LENGTH(40));
            }];
            
            BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(102,102,102) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:titarray[i]];
            [topview addSubview:title];
            [title mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(view);
                make.top.mas_equalTo(view.mas_bottom).with.offset(LENGTH(10));
                make.bottom.mas_equalTo(topview);
            }];
        }
    }
}
- (void)addimage{
    WS(ws);
    hbimageview = [FLAnimatedImageView new];
    hbimageview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:hbimageview];
    [hbimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(StatusBar);
        make.bottom.mas_equalTo(self->backview.mas_top).with.offset(-LENGTH(12));
        //        make.width.mas_equalTo(self->backimageview.mas_height).multipliedBy(0.62);
        //        make.centerX.mas_offset(ws);
        make.centerX.mas_equalTo(self->backview);
        make.left.mas_equalTo(ws).with.offset(LENGTH(26));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(26));
    }];
}

- (void)wxhy{
        wxclick.userInteractionEnabled = NO;
        wxpyqclick.userInteractionEnabled = NO;
        hbclick.userInteractionEnabled = NO;
        [self wxhys:models];
}

- (void)wxviewpyq{

        wxclick.userInteractionEnabled = NO;
        wxpyqclick.userInteractionEnabled = NO;
        hbclick.userInteractionEnabled = NO;
        [self wxviewpyq:models];
}
- (void)wxhys:(FenXiangModel *)dic{
    platformType = SSDKPlatformSubTypeWechatSession;
    [self shareLinkhy:dic];
    
}
- (void)wxviewpyq:(FenXiangModel *)dic{
    platformType = SSDKPlatformSubTypeWechatTimeline;
    [self shareLinkpyq:dic];
}
- (void)shareLinkpyq:(FenXiangModel *)dic
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupWeChatParamsByText:models.content
                                      title:models.title
                                        url:nil
                                 thumbImage:nil
                                      image:URLIMAGE(models.share_img)
                               musicFileURL:nil
                                    extInfo:nil
                                   fileData:nil
                               emoticonData:nil
                        sourceFileExtension:nil
                             sourceFileData:nil
                                       type:SSDKContentTypeImage
                         forPlatformSubType:SSDKPlatformSubTypeWechatTimeline];
    [self shareWithParameters:parameters];
}

- (void)shareLinkhy:(FenXiangModel *)dic
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupWeChatParamsByText:models.content
                                      title:models.title
                                        url:nil
                                 thumbImage:nil
                                      image:URLIMAGE(models.share_img)
                               musicFileURL:nil
                                    extInfo:nil
                                   fileData:nil
                               emoticonData:nil
                        sourceFileExtension:nil
                             sourceFileData:nil
                                       type:SSDKContentTypeImage
                         forPlatformSubType:SSDKPlatformSubTypeWechatSession];
    [self shareWithParameters:parameters];
}

- (void)shareWithParameters:(NSMutableDictionary *)parameters
{
    //    if(_isShare)
    //    {
    //        return;
    //    }
    //    _isShare = YES;
    if(parameters.count == 0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@""
                                                            message:@"请先设置分享参数"
                                                           delegate:nil
                                                  cancelButtonTitle:@"取消"
                                                  otherButtonTitles:nil];
        [alertView show];
        return;
    }
    [ShareSDK share:platformType
         parameters:parameters
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
         if(state == SSDKResponseStateUpload){
             return ;
         }
         NSString *titel = @"";
         NSString *typeStr = @"";
         UIColor *typeColor = [UIColor grayColor];
         self->wxclick.userInteractionEnabled = YES;
         self->wxpyqclick.userInteractionEnabled = YES;
         self->hbclick.userInteractionEnabled = YES;
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
                 titel = @"分享失败";
                 //                 typeStr = [NSString stringWithFormat:@"%@",error];
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
     }];
}
- (void)xz{
    WS(ws);
    mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"正在保存";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [self.window addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.window);
    }];
    [[PHPhotoLibrary sharedPhotoLibrary]performChanges:^{
        [PHAssetChangeRequest creationRequestForAssetFromImage:self->hbimageview.image];
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            // 处理耗时操作的代码块...//通知主线程刷新
            dispatch_async(dispatch_get_main_queue(), ^{
                if (error) {
                    self->mb.label.text = @"保存失败";
                    [self->mb hideAnimated:NO afterDelay:1];
                } else {
                    self->mb.label.text = @"保存成功";
                    [self->mb hideAnimated:NO afterDelay:1];
                }
            });
        });
    }];
    
}

- (void)xiaoshi{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
- (void)setZstid:(NSString *)zstid{
    _zstid = zstid;
    NSString * urls = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FXLCB];
    NSDictionary * dic = @{@"tag":@"14",@"knowledge_id":_zstid};
    [[BaseAppRequestManager manager] getNormaldataURL:urls dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HomePage * model = [HomePage mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                self->models = [FenXiangModel mj_objectWithKeyValues:responseObject[@"share"]];
                [self loaddata];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
        }
    }];
}

- (void)loaddata{
    [self addview];
    [hbimageview sd_setImageWithURL:URLIMAGE(models.share_preview_img)];
}
@end
