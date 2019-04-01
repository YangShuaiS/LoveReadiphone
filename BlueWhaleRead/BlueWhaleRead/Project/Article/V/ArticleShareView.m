//
//  ArticleShareView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/20.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ArticleShareView.h"

@implementation ArticleShareView{
    NSMutableArray * viewarray;
    FLAnimatedImageView * hb;

    
    UIView * wxclick;
    UIView * wxpyqclick;
    UIView * hbclick;
    FenXiangModel * fxmodel;
    NSString * url;
    SSDKPlatformType platformType;

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
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(175,175,175) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:@"分享"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(19));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(19));
        make.left.mas_equalTo(ws).with.offset(LENGTH(94));
    }];
    
    viewarray = [NSMutableArray array];
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
        FLAnimatedImageView * wxview = [FLAnimatedImageView new];
        wxview.image = UIIMAGE(@"微信1");
        wxview.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:wxview];
        [viewarray addObject:wxview];
        
        wxclick = [UIView new];
        [self addSubview:wxclick];
        wxclick.userInteractionEnabled = YES;
        [wxclick mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(wxview).with.insets(UIEdgeInsetsMake(-30, -30, -30, -30));
        }];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wxhy)];
        [wxclick addGestureRecognizer:tap];
        
        FLAnimatedImageView * wxviewpyq = [FLAnimatedImageView new];
        wxviewpyq.image = UIIMAGE(@"朋友圈1");
        wxviewpyq.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:wxviewpyq];
        [viewarray addObject:wxviewpyq];
        
        wxpyqclick = [UIView new];
        [self addSubview:wxpyqclick];
        wxpyqclick.userInteractionEnabled = YES;
        [wxpyqclick mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(wxviewpyq).with.insets(UIEdgeInsetsMake(-30, -30, -30, -30));
        }];
        UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wxviewpyq)];
        [wxpyqclick addGestureRecognizer:tap1];
    }
    hb = [FLAnimatedImageView new];
    hb.image = UIIMAGE(@"链接1");
    hb.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:hb];
    [viewarray addObject:hb];
    
    hbclick = [UIView new];
    [self addSubview:hbclick];
    hbclick.userInteractionEnabled = YES;
    [hbclick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->hb).with.insets(UIEdgeInsetsMake(-30, -30, -30, -30));
    }];
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hb)];
    [hbclick addGestureRecognizer:tap1];
    
    if (viewarray.count == 1) {
        FLAnimatedImageView * view = viewarray[0];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(title.mas_right).with.offset(LENGTH(17));
            make.centerY.mas_equalTo(ws);
            make.width.and.height.mas_equalTo(LENGTH(22));
        }];
    }else{
        FLAnimatedImageView * lastview;
        for (int i = 0; i < viewarray.count; i++) {
            FLAnimatedImageView * view = viewarray[i];
            if (i == 0) {
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(title.mas_right).with.offset(LENGTH(17));
                }];
                lastview = view;
            }else if (i == 1){
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(lastview.mas_right).with.offset(LENGTH(40));
                }];
                lastview = view;
                
            }else if (i == 2){
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(lastview.mas_right).with.offset(LENGTH(40));
                }];
            }
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(ws);
                make.width.and.height.mas_equalTo(LENGTH(22));
            }];
        }
    }
    wxclick.userInteractionEnabled = NO;
    wxpyqclick.userInteractionEnabled = NO;
    hbclick.userInteractionEnabled = NO;
}

- (void)wxhy{
    wxclick.userInteractionEnabled = NO;
    wxpyqclick.userInteractionEnabled = NO;
    hbclick.userInteractionEnabled = NO;
    [self wxhys:self->fxmodel];
    
}

- (void)wxviewpyq{
    wxclick.userInteractionEnabled = NO;
    wxpyqclick.userInteractionEnabled = NO;
    hbclick.userInteractionEnabled = NO;
    [self wxviewpyq:self->fxmodel];
    
}
- (void)wxhys:(FenXiangModel *)dic{
    platformType = SSDKPlatformSubTypeWechatSession;
    [self shareLinkhy:dic];
    
}
- (void)wxviewpyq:(FenXiangModel *)dic{
    platformType = SSDKPlatformSubTypeWechatTimeline;
    [self shareLinkpyq:dic];
}
- (void)setModel:(LunBoTuXQModel *)model{
    _model = model;
    [self returndic];
}
- (void)returndic{
    NSString * urls = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FXLCB];
    NSDictionary * dic;
    dic = @{@"tag":@"9",@"articleid":_model.banner.ssid,@"studentid":Me.ssid};

    [[BaseAppRequestManager manager] getNormaldataURL:urls dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HomePage * model = [HomePage mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self addview];
                self->fxmodel = [FenXiangModel mj_objectWithKeyValues:responseObject[@"share"]];
                [self loaddata];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
        }
    }];
}

- (void)loaddata{
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
    wxclick.userInteractionEnabled = YES;
    wxpyqclick.userInteractionEnabled = YES;
    hbclick.userInteractionEnabled = YES;
}

- (void)shareLinkpyq:(FenXiangModel *)dic
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupWeChatParamsByText:_Text
                                      title:_title
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
    [parameters SSDKSetupWeChatParamsByText:_Text
                                      title:_title
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
     }];
}


- (void)hb{
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = url;
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"复制" message:@"已复制剪切板" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [[self viewController].navigationController presentViewController: alertController animated: YES completion: nil];
}
@end
