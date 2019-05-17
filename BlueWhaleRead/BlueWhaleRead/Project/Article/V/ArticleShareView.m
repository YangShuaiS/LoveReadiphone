//
//  ArticleShareView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/20.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ArticleShareView.h"
#import "ShareZhiShiTuView.h"
#import "UIView+GZExtend.h"

@implementation ArticleShareView{
    NSMutableArray * viewarray;
    ArticleShareAnyOnelyView * wxpyqclick;
    ArticleShareAnyOnelyView * wxclick;

    
    FenXiangModel * fxmodel;
    SSDKPlatformType platformType;
    NSString * url;
    NSString * title;
    NSString * subtitle;
    ShareZhiShiTuView * shareview;
    UIImage * shareImage;
    NSTimer *timer;

}

- (instancetype)init
{
    self = [super init];
    if (self) {
//        [self addview];
    }
    return self;
}

- (void)addview{
    WS(ws);
    NSString * dzimage = @"";
    NSInteger dzinter = 0;
    if (_model != nil) {
        dzinter = _model.like_num;
        if (_model.is_like == 0) {
            dzimage = @"点赞";
        }else{
            dzimage = @"点赞-成功";
        }
    }else{
        dzinter = _ZSModel.data.like_num;
        if (_ZSModel.data.is_like == 0) {
            dzimage = @"点赞";
        }else{
            dzimage = @"点赞-成功";
        }
    }

    viewarray = [NSMutableArray array];
    _dz = [[ArticleShareAnyOnelyView alloc] initWithImage:dzimage Title:[NSString stringWithFormat:@"%ld",dzinter]];
//    [self addSubview:_dz];
    [viewarray addObject:_dz];
    _dz.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hb)];
    [_dz addGestureRecognizer:tap];

    NSString * scimage = @"";
    NSInteger scinter = 0;
    if (_model != nil) {
        scinter = _model.collection_num;
        if (_model.is_collect == 0) {
            scimage = @"收藏-";
        }else{
            scimage = @"收藏-成功";
        }
    }else{
        scinter = _ZSModel.data.collection_num;
        if (_ZSModel.data.is_collect == 0) {
            scimage = @"收藏-";
        }else{
            scimage = @"收藏-成功";
        }
    }

    if (_sfzsw == 1) {
        
    }else{
        _sc = [[ArticleShareAnyOnelyView alloc] initWithImage:scimage Title:[NSString stringWithFormat:@"%ld",scinter]];
//        [self addSubview:_sc];
        [viewarray addObject:_sc];
        _sc.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scs)];
        [_sc addGestureRecognizer:tap1];
    }



    
    
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
        wxpyqclick = [[ArticleShareAnyOnelyView alloc] initWithImage:@"朋友圈1" Title:@"朋友圈"];
//        [self addSubview:wxpyqclick];
        [viewarray addObject:wxpyqclick];
        wxpyqclick.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wxviewpyq)];
        [wxpyqclick addGestureRecognizer:tap2];
        
        wxclick = [[ArticleShareAnyOnelyView alloc] initWithImage:@"微信" Title:@"微信"];
//        [self addSubview:wxclick];
        [viewarray addObject:wxclick];
        wxclick.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wxhy)];
        [wxclick addGestureRecognizer:tap3];
    }

    if ([_model.banner.is_share isEqualToString:@"0"]) {
        [viewarray removeObject:wxpyqclick];
        [viewarray removeObject:wxclick];
    }
    
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
            make.size.mas_equalTo(CGSizeMake(LENGTH(75), LENGTH(33)));
        }];
        if (i == viewarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(ws);
            }];
        }
        lastview = view;
    }
}

- (void)setSfzsw:(NSInteger)sfzsw{
    _sfzsw = sfzsw;
}
- (void)wxhy{

    platformType = SSDKPlatformSubTypeWechatSession;
    if (_Type == 1) {
        _dz.userInteractionEnabled = NO;
        _sc.userInteractionEnabled = NO;
        wxclick.userInteractionEnabled = NO;
        wxpyqclick.userInteractionEnabled = NO;
        [self shareLinkhy:fxmodel];
    }else{
        if (shareImage !=nil) {
            _dz.userInteractionEnabled = NO;
            _sc.userInteractionEnabled = NO;
            wxclick.userInteractionEnabled = NO;
            wxpyqclick.userInteractionEnabled = NO;
            [self shareLinkhyImage:fxmodel];
        }
    }
    
}

- (void)wxviewpyq{

    platformType = SSDKPlatformSubTypeWechatTimeline;
    if (_Type == 1) {
        _dz.userInteractionEnabled = NO;
        _sc.userInteractionEnabled = NO;
        wxclick.userInteractionEnabled = NO;
        wxpyqclick.userInteractionEnabled = NO;
        [self shareLinkpyq:fxmodel];
    }else{
        if (shareImage !=nil) {
            _dz.userInteractionEnabled = NO;
            _sc.userInteractionEnabled = NO;
            wxclick.userInteractionEnabled = NO;
            wxpyqclick.userInteractionEnabled = NO;
            [self shareLinkpyqImaage:fxmodel];

        }
    }
    
}

- (void)upView{
    if (shareview.now >=2) {
        shareImage = [shareview imageFromView];
        [shareview removeFromSuperview];
        [timer invalidate];
        timer = nil;
    }else{
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(upView) userInfo:nil repeats:NO];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];

    }
}

- (void)setModel:(LunBoTuXQModel *)model{
    _model = model;
    [self returnzhishiwang];
    [self addview];
}
- (void)returndic{
    NSString * urls = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FXLCB];
    NSDictionary * dic;
    if ([_atype isEqualToString:@"9"]) {
        dic = @{@"tag":_atype,@"articleid":_itemid,@"studentid":Me.ssid};
    }else if ([_atype isEqualToString:@"14"]){
        [self addImage];
        dic = @{@"tag":_atype,@"knowledge_id":_itemid,@"studentid":Me.ssid};
    }else{
        dic = @{@"tag":_atype,@"studentid":Me.ssid };
    }
    [[BaseAppRequestManager manager] getNormaldataURL:urls dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HomePage * model = [HomePage mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
//                [self addview];
                self->fxmodel = [FenXiangModel mj_objectWithKeyValues:responseObject[@"share"]];
                [self loaddata];
            }else if ([model.code isEqual:@Notloggedin]){
//                [self UpDengLu];
            }
        }else{
        }
    }];
}

- (void)loaddata{
    if (_Type == 1) {
        url = [NSString stringWithFormat:@"%@?showType=%@&studentId=%@&atype=%@",fxmodel.url,_textid,Me.ssid,_atype];
        NSString * fxtext = fxmodel.content;
        if (fxmodel.content.length>100) {
            fxtext = [fxtext substringToIndex:99];
        }
        _Text = fxtext;
        NSString * tit = fxmodel.title;
        tit = [tit stringByReplacingOccurrencesOfString:@"##" withString:Me.name];
        tit = [tit stringByReplacingOccurrencesOfString:@"*" withString:_bookname];
        _title = tit;
    }else{

    }

    _dz.userInteractionEnabled = YES;
    _sc.userInteractionEnabled = YES;
    wxclick.userInteractionEnabled = YES;
    wxpyqclick.userInteractionEnabled = YES;
}

- (void)setZSModel:(ZhiShiShuModel *)ZSModel{
    _ZSModel = ZSModel;
    [self returnzhishiwang];
    [self addview];
}

- (void)returnzhishiwang{
    NSString * urls = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FXLCB];
    NSDictionary * dic ;
    if (_Type == 1) {
        dic = @{@"tag":@"9",@"articleid":_itemid,@"studentid":Me.ssid};
    }else if (_Type == 2 || _Type == 3){
        [self addImage];
        dic = @{@"tag":@"14",@"knowledge_id":_itemid,@"studentid":Me.ssid};
    }
    [[BaseAppRequestManager manager] getNormaldataURL:urls dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HomePage * model = [HomePage mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                self->fxmodel = [FenXiangModel mj_objectWithKeyValues:responseObject[@"share"]];
                [self loadzhishiwang];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
        }
    }];
}

- (void)loadzhishiwang{
    if (_Type == 1) {
        url = [NSString stringWithFormat:@"%@?showType=%@&studentId=%@&atype=%@",fxmodel.url,_itemid,Me.ssid,@"1"];
        NSString * fxtext = fxmodel.content;
        if (fxmodel.content.length>100) {
            fxtext = [fxtext substringToIndex:99];
        }
        title = fxtext;
        NSString * tit = fxmodel.title;
        tit = [tit stringByReplacingOccurrencesOfString:@"##" withString:Me.name];
        tit = [tit stringByReplacingOccurrencesOfString:@"*" withString:_bookname];
        subtitle = tit;
    }else{
        shareview.model = fxmodel;
        shareview.zhishishuModel = _ZSModel;
        [self upView];
    }
    _dz.userInteractionEnabled = YES;
    _sc.userInteractionEnabled = YES;
    wxclick.userInteractionEnabled = YES;
    wxpyqclick.userInteractionEnabled = YES;
    
}


- (void)hb{
    if (_model !=nil) {
        if (_model.is_like == 0) {
            [self dianzan];
        }else{
            [self quxiaodainzan];
        }
    }
    if (_ZSModel != nil) {
        if (_ZSModel.data.is_like == 0) {
            [self dianzan];
        }else{
            [self quxiaodainzan];
        }
    }
}

- (void)scs{
    if (_model !=nil) {
        if (_model.is_collect == 0) {
            [self shoucang];
        }else{
            [self yichushooucang];
        }
    }
    if (_ZSModel != nil) {
        if (_ZSModel.data.is_collect == 0) {
            [self shoucang];
        }else{
            [self yichushooucang];
        }
    }
}
- (void)setItemid:(NSString *)itemid{
    _itemid = itemid;
}
- (void)shoucang{
    WS(ws);
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_SHOUCANGZHISHITU];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"collectionid":_itemid,@"collection_type":[NSString stringWithFormat:@"%ld",_Type]};
    [[BaseAppRequestManager manager] PostNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {

                if (ws.model !=nil) {
                    ws.model.is_collect = 1;
                    ws.model.collection_num ++;
                    [ws.sc ClickDianZanWithImage:@"收藏-成功" Title:[NSString stringWithFormat:@"%ld",ws.model.collection_num ]];

                }else{
                    ws.ZSModel.data.is_collect = 1;
                    ws.ZSModel.data.collection_num ++;
                    [ws.sc ClickDianZanWithImage:@"收藏-成功" Title:[NSString stringWithFormat:@"%ld",ws.ZSModel.data.collection_num ]];

                }
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[[[UIApplication sharedApplication] delegate] window]  animated:YES];
                hud.label.text = @"收藏成功";
                hud.mode = MBProgressHUDModeCustomView;
                UIImage *image = [[UIImage imageNamed:@"收藏成功"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
                UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
                hud.customView = imgView;
                hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
                hud.bezelView.color = [UIColor colorWithWhite:0.0 alpha:0.8];
                //文字颜色
                hud.contentColor = [UIColor whiteColor];
                hud.animationType = MBProgressHUDAnimationFade;
                [hud hideAnimated:YES afterDelay:1];
                [ws.delegateArticleShare ArticleSharShouCang];
            }
        }
    }];
}
- (void)yichushooucang{
    WS(ws);
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_YICHUSHOUCANGZHISHITU];
    NSDictionary * dic = @{@"delids":_itemid,@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            LunBoTuXQModel * model = [LunBoTuXQModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {

                if (ws.model !=nil) {
                    ws.model.is_collect = 0;
                    ws.model.collection_num --;
                    [ws.sc ClickDianZanWithImage:@"收藏-" Title:[NSString stringWithFormat:@"%ld",ws.model.collection_num ]];

                }else{
                    ws.ZSModel.data.is_collect = 0;
                    ws.ZSModel.data.collection_num --;
                    [ws.sc ClickDianZanWithImage:@"收藏-" Title:[NSString stringWithFormat:@"%ld",ws.ZSModel.data.collection_num ]];

                }
                
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[[[UIApplication sharedApplication] delegate] window]  animated:YES];
                hud.label.text = @"取消收藏";
                hud.mode = MBProgressHUDModeCustomView;
                UIImage *image = [[UIImage imageNamed:@"取消收藏"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
                UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
                hud.customView = imgView;
                hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
                hud.bezelView.color = [UIColor colorWithWhite:0.0 alpha:0.8];
                //文字颜色
                hud.contentColor = [UIColor whiteColor];
                hud.animationType = MBProgressHUDAnimationFade;
                [hud hideAnimated:YES afterDelay:1];
                [ws.delegateArticleShare ArticleSharShouCang];
            }
        }else{
            
        }
    }];
}

#pragma mark ------------------- f点赞
- (void)dianzan{
    WS(ws);
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_ADDDIANZAN];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"likeid":_itemid,@"like_type":[NSString stringWithFormat:@"%ld",_Type]};
    [[BaseAppRequestManager manager] PostNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {
                if (ws.model !=nil) {
                    ws.model.is_like = 1;
                    ws.model.like_num ++;
                    [ws.dz ClickDianZanWithImage:@"点赞-成功" Title:[NSString stringWithFormat:@"%ld",ws.model.like_num]];
                }else{
                    ws.ZSModel.data.is_like = 1;
                    ws.ZSModel.data.like_num ++;
                    [ws.dz ClickDianZanWithImage:@"点赞-成功" Title:[NSString stringWithFormat:@"%ld",ws.ZSModel.data.like_num]];
                }
                [self.delegateArticleShare ArticleSharDianZan];
            }
        }
    }];
}

- (void)quxiaodainzan{
    WS(ws);
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_REMODIANZAN];
    NSDictionary * dic = @{@"delid":_itemid,@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        LunBoTuXQModel * model = [LunBoTuXQModel mj_objectWithKeyValues:responseObject];
        if ([model.code isEqual:@200]) {
            if (ws.model !=nil) {
                ws.model.is_like = 0;
                ws.model.like_num --;
                [ws.dz ClickDianZanWithImage:@"点赞" Title:[NSString stringWithFormat:@"%ld",ws.model.like_num]];
            }else{
                ws.ZSModel.data.is_like = 0;
                ws.ZSModel.data.like_num --;
                [ws.dz ClickDianZanWithImage:@"点赞" Title:[NSString stringWithFormat:@"%ld",ws.ZSModel.data.like_num]];
            }
            [self.delegateArticleShare ArticleSharDianZan];
        }
    }];
}




//朋友圈
- (void)pyq{
    if (fxmodel != nil) {
        if (_Type == 1) {
            [self wxviewpyq:fxmodel];
        }else if (_Type == 2){
            [self wxzstpyq:fxmodel];
        }else if (_Type == 3){
            [self wxzstpyq:fxmodel];
        }
    }
}
//好友
- (void)hy{
    if (fxmodel != nil) {
        if (_Type == 1) {
            [self wxhys:fxmodel];
        }else if (_Type == 2){
            [self wxhyshy:fxmodel];
        }else if (_Type == 3){
            [self wxhyshy:fxmodel];
        }
    }
}
#pragma mark ---------------- 文章分享
- (void)wxhys:(FenXiangModel *)dic{
    [self shareLinkhy:dic];
}
- (void)wxviewpyq:(FenXiangModel *)dic{
    [self shareLinkpyq:dic];
}

#pragma mark ----------------- 标题内容类
- (void)shareLinkpyq:(FenXiangModel *)dic
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupWeChatParamsByText:title
                                      title:subtitle
                                        url:[NSURL URLWithString:url]
                                 thumbImage:nil
                                      image:[NSURL URLWithString:_imageurl]
                               musicFileURL:nil
                                    extInfo:nil
                                   fileData:nil
                               emoticonData:nil
                        sourceFileExtension:nil
                             sourceFileData:nil
                                       type:SSDKContentTypeWebPage
                         forPlatformSubType:SSDKPlatformSubTypeWechatTimeline];
    
    [self shareWithParameters:parameters];
}

- (void)shareLinkhy:(FenXiangModel *)dic
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupWeChatParamsByText:title
                                      title:subtitle
                                        url:[NSURL URLWithString:url]
                                 thumbImage:nil
                                      image:[NSURL URLWithString: _imageurl]
                               musicFileURL:nil
                                    extInfo:nil
                                   fileData:nil
                               emoticonData:nil
                        sourceFileExtension:nil
                             sourceFileData:nil
                                       type:SSDKContentTypeWebPage
                         forPlatformSubType:SSDKPlatformSubTypeWechatSession];
    
    [self shareWithParameters:parameters];
}
#pragma marl ----------------- 图片分享
- (void)addImage{
    if (_Type == 2) {
        shareview = [[ShareZhiShiTuView alloc] initWithType:0];
    }else if (_Type == 3){
        shareview = [[ShareZhiShiTuView alloc] initWithType:1];
    }
    [[[[UIApplication sharedApplication] delegate] window]addSubview:shareview];
    [shareview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo([[[UIApplication sharedApplication] delegate] window].mas_bottom).with.offset(HEIGHT);
        make.centerX.mas_equalTo([[[UIApplication sharedApplication] delegate] window]);
    }];
    [shareview layoutIfNeeded];
}
- (void)wxzstpyq:(FenXiangModel *)dic{
    if (_Type == 2 || _Type == 3) {
        platformType = SSDKPlatformSubTypeWechatTimeline;
        [self shareLinkpyqImaage:dic];
    }
}
- (void)wxhyshy:(FenXiangModel *)dic{
    if (_Type == 2 || _Type == 3) {
        platformType = SSDKPlatformSubTypeWechatSession;
        [self shareLinkhyImage:dic];
    }
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
                                      image:shareImage
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

- (void)shareLinkhyImage:(FenXiangModel *)dic
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupWeChatParamsByText:dic.content
                                      title:dic.title
                                        url:nil
                                 thumbImage:nil
                                      image:shareImage
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
- (void)shareWithParameters:(NSMutableDictionary *)parameters{
    _dz.userInteractionEnabled = YES;
    _sc.userInteractionEnabled = YES;
    wxclick.userInteractionEnabled = YES;
    wxpyqclick.userInteractionEnabled = YES;
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


@end
