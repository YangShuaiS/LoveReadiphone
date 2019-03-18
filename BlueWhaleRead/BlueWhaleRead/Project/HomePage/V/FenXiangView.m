//
//  FenXiangView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/2.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FenXiangView.h"
#import "GZWKWebView.h"
#import <Photos/Photos.h>
#import "NewHpViewModel.h"

@interface FenXiangView ()<WKNavigationDelegate>
//@property(nonatomic,strong) GZWKWebView *webView;
@property(nonatomic,strong) UIImageView *imageView;
@end
@implementation FenXiangView{
    NSMutableArray * viewarray;
    NSMutableArray * titarrays;

    NSInteger inter;
    SSDKPlatformType platformType;
    FenXiangModel * fxmodel;
    BaseView * backview;
    
    NSString * tag;
    
    NSString * url;
    FenXiangModel * bakmodel;
    FLAnimatedImageView * hb;
    
    UIView * wxclick;
    UIView * wxpyqclick;
    UIView * hbclick;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        bakmodel = [FenXiangModel new];
    }
    return self;
}
- (void)setSharestyle:(ShareStyle)sharestyle{
    _sharestyle = sharestyle;
    if (_shareid == ShareStyleTag11) {
        tag =[NSString stringWithFormat:@"%ld",_shareid];;
    }else{
        tag = [NSString stringWithFormat:@"%ld",sharestyle];
    }
    [self returndic];
}
- (void)addhaibao{
//    _webView = [GZWKWebView new];
//    _webView.navigationDelegate = self;
//    _webView.scrollView.bounces = NO;
//    [self addSubview:_webView];
//    WS(ws);
//    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(ws).with.offset(StatusBar);
//        make.bottom.mas_equalTo(self->backview.mas_top).with.offset(-LENGTH(12));
//        make.width.mas_equalTo(ws.webView.mas_height).multipliedBy(0.62);
//        //        make.centerX.mas_offset(ws);
//        make.centerX.mas_equalTo(self->backview);
//        //        make.left.mas_equalTo(ws).with.offset(LENGTH(26));
//        //        make.right.mas_equalTo(ws).with.offset(-LENGTH(26));
//    }];
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
//        make.height.mas_equalTo(LENGTH(67)+TabBarHeight);
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
    [self addSubview:topview];
    [topview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->backview);
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(15));
        make.bottom.mas_equalTo(self->backview).with.offset(-LENGTH(20));
        
    }];
    
    viewarray = [NSMutableArray array];
    titarrays = [NSMutableArray array];
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
    hb = [FLAnimatedImageView new];
    hb.image = UIIMAGE(@"生成海报");
    hb.contentMode = UIViewContentModeScaleAspectFit;
    [topview addSubview:hb];
    [viewarray addObject:hb];
    
    hbclick = [UIView new];
    [topview addSubview:hbclick];
    hbclick.userInteractionEnabled = YES;
    [hbclick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->hb).with.insets(UIEdgeInsetsMake(-30, -30, -30, -30));
    }];
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hb)];
    [hbclick addGestureRecognizer:tap1];
    
    if (viewarray.count == 1) {
        NSArray * titarray = @[@"生成海报"];
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
        [titarrays addObject:title];
    }else{
    NSArray * titarray = @[@"微信好友",@"朋友圈",@"生成海报"];
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
        [titarrays addObject:title];
    }
    }
}
//临时
//- (void *)reurndic{
//    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FXLCB];
//    NSDictionary * dic = @{@"tag":@"1"};
//    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
//        if (responseObject) {
//            HomePage * model = [HomePage mj_objectWithKeyValues:responseObject];
//            if ([model.code isEqual:@200]) {
////                return responseObject;
//            }else{
////                return dic;
//            }
//        }else{
////            return dic;
//        }
//    }];
//}
- (void)returndic{
    NSString * urls = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FXLCB];
    NSDictionary * dic;
    if (_sharestyle == ShareStyleTag9||_sharestyle == ShareStyleTag10) {
        dic = @{@"tag":tag,@"articleid":_textid,@"studentid":Me.ssid};
    }else{
        dic = @{@"tag":tag,@"studentid":Me.ssid };
    }
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
- (void)ShareStyleTag1{
    url = [NSString stringWithFormat:@"%@?showType=1&studentId=%@",fxmodel.url,Me.ssid];
//    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    _Text = fxmodel.content;
    _title = fxmodel.title;
    _imageurl = [NSString stringWithFormat:@"%@%@",IMAGEURL,fxmodel.img];
}
- (void)ShareStyleTag2{
    url = [NSString stringWithFormat:@"%@?showType=1&studentId=%@",fxmodel.url,Me.ssid];
//    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    _Text = fxmodel.content;
    NSString * tit = fxmodel.title;
    tit = [tit stringByReplacingOccurrencesOfString:@"####" withString:_classname];
    tit = [tit stringByReplacingOccurrencesOfString:@"#" withString:_bookname];
    _title = tit;
}
- (void)ShareStyleTag3{
    url = [NSString stringWithFormat:@"%@?showType=1&studentId=%@",fxmodel.url,Me.ssid];
//    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    _Text = fxmodel.content;
    NSString * tit = fxmodel.title;
    tit = [tit stringByReplacingOccurrencesOfString:@"###" withString:_bolistname];
    _title = tit;
}
- (void)ShareStyleTag4{
    url = [NSString stringWithFormat:@"%@?showType=1&studentId=%@",fxmodel.url,Me.ssid];
//    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    NSString * tex = fxmodel.content;
    tex = [tex stringByReplacingOccurrencesOfString:@"#######" withString:_yidgh];
    tex = [tex stringByReplacingOccurrencesOfString:@"##" withString:Me.name];
    _Text = tex;
    _title = fxmodel.title;
}
- (void)ShareStyleTag5{
    _imageurl = [NSString stringWithFormat:@"%@%@",IMAGEURL,fxmodel.img];

    url = [NSString stringWithFormat:@"%@?showType=1&studentId=%@",fxmodel.url,Me.ssid];
//    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    _Text = fxmodel.content;
    NSString * tit = fxmodel.title;
    tit = [tit stringByReplacingOccurrencesOfString:@"##" withString:Me.name];
    _title = tit;
}
- (void)ShareStyleTag6{
    _imageurl = [NSString stringWithFormat:@"%@%@",IMAGEURL,fxmodel.img];
    url = [NSString stringWithFormat:@"%@?showType=1&studentId=%@",fxmodel.url,Me.ssid];
//    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    _Text = fxmodel.content;
    NSString * tit = fxmodel.title;
    tit = [tit stringByReplacingOccurrencesOfString:@"##" withString:Me.name];
    tit = [tit stringByReplacingOccurrencesOfString:@"#" withString:_studentnum];
    _title = tit;
    
}
- (void)ShareStyleTag7{
    url = [NSString stringWithFormat:@"%@?showType=1&studentId=%@",fxmodel.url,Me.ssid];
//    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    _Text = fxmodel.content;
    NSString * tit = fxmodel.title;
    tit = [tit stringByReplacingOccurrencesOfString:@"##" withString:Me.name];
    _title = tit;
}
- (void)ShareStyleTag8{
    url = [NSString stringWithFormat:@"%@?showType=1&studentId=%@",fxmodel.url,Me.ssid];
//    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    _Text = fxmodel.content;
    NSString * tit = fxmodel.title;
    tit = [tit stringByReplacingOccurrencesOfString:@"#####" withString:_balistgs];
    tit = [tit stringByReplacingOccurrencesOfString:@"##" withString:Me.name];
    _title = tit;
}
- (void)ShareStyleTag9{
    hb.image = UIIMAGE(@"复制链接");
    BaseLabel * title = titarrays[titarrays.count-1];
    title.text = @"复制链接";
    
    url = [NSString stringWithFormat:@"%@?showType=%@&studentId=%@&atype=%@",fxmodel.url,_textid,Me.ssid,_atype];
//    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    NSString * fxtext = fxmodel.content;
    if (fxmodel.content.length>100) {
        fxtext = [fxtext substringToIndex:99];
    }
    _Text = fxtext;
    NSString * tit = fxmodel.title;
    tit = [tit stringByReplacingOccurrencesOfString:@"##" withString:Me.name];
    tit = [tit stringByReplacingOccurrencesOfString:@"*" withString:_bookname];

    _title = tit;
    
}

- (void)ShareStyleTag11{
    hb.image = UIIMAGE(@"复制链接");
    BaseLabel * title = titarrays[titarrays.count-1];
    title.text = @"复制链接";
    
    url = [NSString stringWithFormat:@"%@?showType=%@&studentId=%@&atype=%@",fxmodel.url,fxmodel.ssid,Me.ssid,@"1"];
    _imageurl = [NSString stringWithFormat:@"%@%@",IMAGEURL,fxmodel.img];
    NSString * fxtext = fxmodel.content;
    if (fxmodel.content.length>100) {
        fxtext = [fxtext substringToIndex:99];
    }
    _Text = fxtext;
    _title = fxmodel.title;

}
- (void)ShareStyleTag10{
    hb.image = UIIMAGE(@"复制链接");
    BaseLabel * title = titarrays[titarrays.count-1];
    title.text = @"复制链接";
    
    url = [NSString stringWithFormat:@"%@?showType=%@&studentId=%@",fxmodel.url,_textid,Me.ssid];
//    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    _imageurl = [NSString stringWithFormat:@"%@%@",IMAGEURL,_imageurl];
//    _imageurl = @"http://192.168.1.221:8081/images/banners/201809281425503031.png";
    NSString * tit = fxmodel.title;
    tit = [tit stringByReplacingOccurrencesOfString:@"##" withString:Me.name];
    tit = [tit stringByReplacingOccurrencesOfString:@"**" withString:_sdm];
    _title = tit;
    _Text = _wzbt;
    if ([_Text isEqualToString:@""]) {
        _Text = @"博万卷";
    }
}
- (void)loaddata{
    //#   书名    ##   人名   ###  勋章名    ####  年级    #####   n个勋章中的n    *     文章标题    **  书单名    ***  文章内容   ****   书单简介
    switch (_sharestyle) {
        case ShareStyleTag1:
            [self ShareStyleTag1];
            break;
        case ShareStyleTag2:
            [self ShareStyleTag2];
            break;
        case ShareStyleTag3:
            [self ShareStyleTag3];
            break;
        case ShareStyleTag4:
            [self ShareStyleTag4];
            break;
        case ShareStyleTag5:
            [self ShareStyleTag5];
            break;
        case ShareStyleTag6:
            [self ShareStyleTag6];
            break;
        case ShareStyleTag7:
            [self ShareStyleTag7];
            break;
        case ShareStyleTag8:
            [self ShareStyleTag8];
            break;
        case ShareStyleTag9:
            [self ShareStyleTag9];
            break;
        case ShareStyleTag10:
            [self ShareStyleTag10];
            break;
        case ShareStyleTag11:
            [self ShareStyleTag11];
            break;
        default:
            break;
    }
    bakmodel.img = _imageurl;
    bakmodel.content = _Text;
    bakmodel.title = _title;
    bakmodel.url = fxmodel.url;
}

- (void)wxhy{
    inter = 1;
    wxclick.userInteractionEnabled = NO;
    wxpyqclick.userInteractionEnabled = NO;
    hbclick.userInteractionEnabled = NO;
    [self wxhys:self->fxmodel];
    
}

- (void)wxviewpyq{
    inter = 2;
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
- (void)jlxinxi{
    NSString *filePatch = [BaseObject AddPathName:[NSString stringWithFormat:@"%@.plist",BENDIXINXI]];
    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    
    NewHpViewModel * model = [NewHpViewModel mj_objectWithKeyValues:dataDictionary];
    if (![model.sharetime isEqualToString:currentTimeString]) {
        [dataDictionary setValue:currentTimeString forKey:@"sharetime"];
        [dataDictionary setValue:[NSString stringWithFormat:@"%d",_inter] forKey:@"shretype"];
        [dataDictionary writeToFile:filePatch atomically:YES];
    }
    [[self viewController].navigationController popViewControllerAnimated:YES];
    self.block(self->bakmodel,self->_sharestyle);
    [self share];
}
- (void)share{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_SHARE];
        NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {

        }else{

        }
    }];
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
                 if (self->_inter != 0) {
                     [self jlxinxi];
                 }
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
         [self removeFromSuperview];
     }];
}
- (void)hb{
    if (_sharestyle == ShareStyleTag9 || _sharestyle == ShareStyleTag10 ||_sharestyle == ShareStyleTag11) {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = url;
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"复制" message:@"已复制剪切板" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [_vc presentViewController: alertController animated: YES completion: nil];
    }else{
        self.block(self->bakmodel,self->_sharestyle);
    }
    self.alpha = 0;
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self removeFromSuperview];
    });
}

- (void)xiaoshi{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
