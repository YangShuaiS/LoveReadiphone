//
//  HaiBaoView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HaiBaoView.h"
#import "GZWKWebView.h"
#import <Photos/Photos.h>

@interface HaiBaoView ()<WKNavigationDelegate>
@property(nonatomic,strong) GZWKWebView *webView;
@property(nonatomic,strong) UIImageView *imageView;
@end

@implementation HaiBaoView{
    NSMutableArray * viewarray;
    NSInteger inter;
    SSDKPlatformType platformType;
    BaseView * backview;
    UIImage * haibaoimage;
    MBProgressHUD * mb;
    NSString * url;
    
    FLAnimatedImageView * backimageview;
    
    UIView * wxclick;
    UIView * wxpyqclick;
    UIView * hbclick;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addhaibao{
    _webView = [GZWKWebView new];
    _webView.navigationDelegate = self;
    _webView.scrollView.bounces = NO;
    [self addSubview:_webView];
    WS(ws);
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(ws).with.offset(StatusBar+50);
//        make.bottom.mas_equalTo(self->backview.mas_top).with.offset(-LENGTH(12)-50);
//        make.center.mas_equalTo(self->backview);
//        make.left.mas_equalTo(ws).with.offset(LENGTH(100));
//        make.right.mas_equalTo(ws).with.offset(-LENGTH(100));
        make.width.mas_equalTo(LENGTH(322));
        make.height.mas_equalTo(LENGTH(519));
        make.top.mas_equalTo(ws.mas_bottom);
    }];
    
    backimageview = [FLAnimatedImageView new];
    backimageview.backgroundColor = [UIColor whiteColor];
    backimageview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:backimageview];
    [backimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(StatusBar);
        make.bottom.mas_equalTo(self->backview.mas_top).with.offset(-LENGTH(12));
//        make.width.mas_equalTo(self->backimageview.mas_height).multipliedBy(0.62);
        //        make.centerX.mas_offset(ws);
        make.centerX.mas_equalTo(self->backview);
                make.left.mas_equalTo(ws).with.offset(LENGTH(26));
                make.right.mas_equalTo(ws).with.offset(-LENGTH(26));
    }];
}
- (void)setModes:(FenXiangModel *)modes{
    _modes = modes;
    if (_sharestyle == ShareStyleTag9||_sharestyle == ShareStyleTag10) {
        url = [NSString stringWithFormat:@"%@?showType=%@&studentId=%@",_modes.url,_textid,Me.ssid];
    }else{
        url = [NSString stringWithFormat:@"%@?showType=2&studentId=%@",_modes.url,Me.ssid];
    }
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];

    double delayInSeconds = 5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        if (self->haibaoimage == nil) {
            [self->_webView captureContentImage:^(UIImage *image) {
                self->haibaoimage = image;
                self->backimageview.image = image;
                self->backimageview.backgroundColor = [UIColor clearColor];
            }];
        }
    });
//    switch (_sharestyle) {
//        case ShareStyleTag1:
//            url = [NSString stringWithFormat:@"%@?showType=2&studentId=%@",modes.url,Me.ssid];
//            [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
//            _Text = modes.content;
//            _title = modes.title;
//            break;
//        case ShareStyleTag2:
//            url = [NSString stringWithFormat:@"%@?showType=2&studentId=%@",modes.url,Me.ssid];
//            [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
//            _Text = modes.content;
//            _title = modes.title;
//            break;
//        case ShareStyleTag3:
//            url = [NSString stringWithFormat:@"%@?showType=2&studentId=%@",modes.url,Me.ssid];
//            [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
//            _Text = modes.content;
//            _title = modes.title;
//            break;
//        case ShareStyleTag4:
//            url = [NSString stringWithFormat:@"%@?showType=2&studentId=%@",modes.url,Me.ssid];
//            [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
//            _Text = modes.content;
//            _title = modes.title;
//            break;
//        default:
//            break;
//    }


}
- (void)addview{
    self.backgroundColor = RGBA(0x00, 0x00, 0x00, 0.6);
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xiaoshi)];
    [self addGestureRecognizer:tap];
    WS(ws);
    
    backview = [BaseView new];
    backview.backgroundColor = [UIColor whiteColor];
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.mas_equalTo(ws);
//        make.height.mas_equalTo(LENGTH(67)+LENGTH(StatusBar));
    }];
    backview.userInteractionEnabled = YES;
    [self addhaibao];

    
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
    
    BaseView * twoxian = [BaseView new];
    twoxian.backgroundColor = RGB(220,229,235);
    [backview addSubview:twoxian];
    [twoxian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(title);
        make.left.mas_equalTo(title.mas_right).with.offset(LENGTH(8));
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(LENGTH(70));
    }];
    
    
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

- (void)wxhy{
    inter = 1;
    if (haibaoimage == nil) {
        mb.label.text = @"正在生成海报，请稍后";
        [mb hideAnimated:NO afterDelay:1];
    }else{
        wxclick.userInteractionEnabled = NO;
        wxpyqclick.userInteractionEnabled = NO;
        hbclick.userInteractionEnabled = NO;
        [self wxhys:self->_modes];
    }
}

- (void)wxviewpyq{
    inter = 2;
    if (haibaoimage == nil) {
        mb.label.text = @"正在生成海报，请稍后";
        [mb hideAnimated:NO afterDelay:1];
    }else{
        wxclick.userInteractionEnabled = NO;
        wxpyqclick.userInteractionEnabled = NO;
        hbclick.userInteractionEnabled = NO;
        [self wxviewpyq:self->_modes];
    }
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
    [parameters SSDKSetupWeChatParamsByText:_modes.content
                                      title:_modes.title
                                        url:nil
                                 thumbImage:nil
                                      image:haibaoimage
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
    [parameters SSDKSetupWeChatParamsByText:_modes.content
                                      title:_modes.title
                                        url:nil
                                 thumbImage:nil
                                      image:haibaoimage
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
    
    if (haibaoimage == nil) {
        mb.label.text = @"正在生成海报，请稍后";
        [mb hideAnimated:NO afterDelay:1];
    }else{
            [[PHPhotoLibrary sharedPhotoLibrary]performChanges:^{
                [PHAssetChangeRequest creationRequestForAssetFromImage:self->haibaoimage];
            } completionHandler:^(BOOL success, NSError * _Nullable error) {
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    // 处理耗时操作的代码块...//通知主线程刷新
                    dispatch_async(dispatch_get_main_queue(), ^{
                                //回调或者说是通知主线程刷新，
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
    
}

- (void)xiaoshi{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self->_webView captureContentImage:^(UIImage *image) {
            self->haibaoimage = image;
            self->backimageview.image = image;
            self->backimageview.backgroundColor = [UIColor clearColor];

        }];
    });
}
@end
