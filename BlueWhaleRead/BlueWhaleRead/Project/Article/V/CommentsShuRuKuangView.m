//
//  CommentsShuRuKuangView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/9.
//  Copyright © 2019 YS. All rights reserved.
//

#import "CommentsShuRuKuangView.h"
#import "CommentsShareView.h"
#import "ShareZhiShiTuView.h"
#import "UIView+GZExtend.h"

@implementation CommentsShuRuKuangView{
    SSDKPlatformType platformType;
    NSString * url;
    NSString * title;
    NSString * subtitle;

    UIView * baseview;
    BaseLabel * fb;
    UITextView * textview;
    
    CommentsShareView *haoyou;
    CommentsShareView * pyq;
    BaseLabel * _placeholderLabel;
    
    FenXiangModel * fxmodel;
    ShareZhiShiTuView * shareview;
    UIImage * shareImage;
    NSTimer *timer;
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
    self.backgroundColor = RGBA(0, 0, 0, 0.3);
    
    UIView * v = [UIView new];
    [self addSubview:v];
    v.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(remo)];
    [v addGestureRecognizer:tap];
    
    baseview = [UIView new];
    baseview.backgroundColor = RGB(255, 255, 255);
    baseview.layer.masksToBounds = YES;
    baseview.layer.cornerRadius = LENGTH(5);
    [self addSubview:baseview];
    [baseview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
    }];
//    baseview.userInteractionEnabled = YES;
    
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(self->baseview.mas_top);
    }];
    
    BaseLabel * qx = [[BaseLabel alloc] initWithTxteColor:RGB(175,175,175) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"取消"];
    [baseview addSubview:qx];
    [qx mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.top.mas_equalTo(self->baseview);
        make.width.mas_equalTo(LENGTH(36)+LENGTH(29));
        make.height.mas_equalTo(LENGTH(40));
    }];
    
    fb = [[BaseLabel alloc] initWithTxteColor:RGB(175,175,175) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"发布"];
    [baseview addSubview:fb];
    [fb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self->baseview);
        make.top.mas_equalTo(self->baseview);
        make.width.mas_equalTo(LENGTH(36)+LENGTH(29));
        make.height.mas_equalTo(LENGTH(40));
    }];
    
    qx.userInteractionEnabled = YES;
    UITapGestureRecognizer * qxtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(remo)];
    [qx addGestureRecognizer:qxtap];
    
    fb.userInteractionEnabled = NO;
    UITapGestureRecognizer * fbtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fbtap)];
    [fb addGestureRecognizer:fbtap];
    
    UIView * xian = [UIView new];
    xian.backgroundColor = RGB(214,214,214);
    [baseview addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(qx.mas_bottom);
        make.left.and.right.mas_equalTo(self->baseview);
        make.height.mas_equalTo(1);
    }];
    
    textview = [UITextView new];
    textview.backgroundColor = [UIColor whiteColor];
    textview.textAlignment = NSTextAlignmentLeft;
    // 设置文本颜色
    textview.textColor = [UIColor blackColor];
    // 设置字体
    textview.font = TextFont(13);
    textview.dataDetectorTypes = UIDataDetectorTypeAll;
    textview.delegate = self;
    [textview becomeFirstResponder];
    [baseview addSubview:textview];
    [textview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xian.mas_bottom).with.offset(LENGTH(5));
        make.left.mas_equalTo(self->baseview.mas_left).with.offset(LENGTH(18));
        make.right.mas_equalTo(self->baseview.mas_right).with.offset(-LENGTH(18));
        make.height.mas_equalTo(LENGTH(56));
    }];
    
    _placeholderLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(175,175,175) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@"请开始你的表演"];
    [baseview addSubview:_placeholderLabel];
    [_placeholderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xian.mas_bottom).with.offset(LENGTH(10));
        make.left.mas_equalTo(self->baseview.mas_left).with.offset(LENGTH(18));
    }];
    
    
    UIView * xian1 = [UIView new];
    xian1.backgroundColor = RGB(214,214,214);
    [baseview addSubview:xian1];
    [xian1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->textview.mas_bottom).with.offset(LENGTH(10));
        make.left.and.right.mas_equalTo(self->baseview);
        make.height.mas_equalTo(1);
    }];
    
    // 添加通知监听见键盘弹出/退出
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardAction:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardAction:) name:UIKeyboardWillHideNotification object:nil];
    
    BaseLabel * tszf = [[BaseLabel alloc] initWithTxteColor:RGB(175,175,175) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"同时转发"];
    tszf.userInteractionEnabled = YES;
    [baseview addSubview:tszf];
    [tszf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(18));
        make.right.mas_equalTo(ws);
        make.top.mas_equalTo(xian1.mas_bottom);
        make.height.mas_equalTo(LENGTH(40));
        make.bottom.mas_equalTo(self->baseview);
    }];
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
        haoyou = [CommentsShareView new];
        haoyou.styles = 0;
        [self addSubview:haoyou];
        [haoyou mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(tszf);
            make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
        }];
        
        pyq = [CommentsShareView new];
        pyq.styles = 1;
        [self addSubview:pyq];
        [pyq mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(tszf);
            make.right.mas_equalTo(self->haoyou.mas_left).with.offset(-LENGTH(20));
        }];
    
    [haoyou setBlocks:^(NSInteger inger) {
        [ws upcommshare:inger];
    }];
    [pyq setBlocks:^(NSInteger inger) {
        [ws upcommshare:inger];
    }];
    }
}

- (void)remo{
    [self removeFromSuperview];
}
- (void)fbtap{
    WS(ws);
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FBPINGLUN];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"commentid":_itemid,@"comment_type":[NSString stringWithFormat:@"%ld",_comment_type],@"comment_content":textview.text};
    [[BaseAppRequestManager manager] PostNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            LunBoTuXQModel * model = [LunBoTuXQModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                PingLunModel * plmodel = [PingLunModel mj_objectWithKeyValues:responseObject[@"studentComment"]];
                [self click];
                ws.blocks(plmodel);
                [self removeFromSuperview];
            }
        }
    }];
    
}

- (void)keyboardAction:(NSNotification*)sender{
       // 通过通知对象获取键盘frame: [value CGRectValue]
    NSDictionary *useInfo = [sender userInfo];
    NSValue *value = [useInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGFloat keyheigh = [value CGRectValue].size.height;
    // <注意>具有约束的控件通过改变约束值进行frame的改变处理
    if([sender.name isEqualToString:UIKeyboardWillShowNotification]){

    }else{
    }
    WS(ws);
    [baseview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws).with.offset(-keyheigh);
    }];
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text

{    if (![text isEqualToString:@""])
    
{
    fb.userInteractionEnabled = YES;
    fb.textColor = RGB(120,197,197);
    _placeholderLabel.hidden = YES;
    
}
    
    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1)
        
    {
        fb.userInteractionEnabled = NO;
        fb.textColor = RGB(175,175,175) ;
        _placeholderLabel.hidden = NO;
        
    }
    
    return YES;
    
}
#pragma mark ------------------- 分享
- (void)upcommshare:(NSInteger)inter{
    if (inter == 0) {
        //好友
        pyq.zt = 0;
    }else{
        //朋友圈
        haoyou.zt = 0;
    }

}
- (void)click{
    if (pyq.zt == 1 || haoyou.zt == 1) {
        if (fxmodel == nil) {
            if (_comment_type == 1) {
                [self addarticle:@"9"];//文章请求数据
            }else if (_comment_type == 2){
                [self addarticle:@"14"];//知识图分享
            }else if (_comment_type == 3){
                [self addarticle:@"14"];//脉络图分享
            }
        }else{
            [self push];
        }
    }

}

- (void)addarticle:(NSString *)tag{
    NSString * urls = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FXLCB];
    NSDictionary * dic;
    if ([tag isEqualToString:@"9"]||[tag isEqualToString:@"10"]) {
        dic = @{@"tag":tag,@"articleid":_itemid,@"studentid":Me.ssid};
    }else if ([tag isEqualToString:@"14"]){
        [self addImage];
        dic = @{@"tag":tag,@"knowledge_id":_itemid,@"studentid":Me.ssid};
    }else{
        dic = @{@"tag":tag,@"studentid":Me.ssid };
    }
    [[BaseAppRequestManager manager] getNormaldataURL:urls dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HomePage * model = [HomePage mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                self->fxmodel = [FenXiangModel mj_objectWithKeyValues:responseObject[@"share"]];
                [self push];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
        }
    }];
}
#pragma mark ------------- 分享
//判断好友朋友圈
- (void)push{
    if (_comment_type == 2 || _comment_type == 3) {
        shareview.model= fxmodel;
        shareview.zhishishuModel = _zhishishumodel;
    }
    [self upView];

}
- (void)upView{
    if (shareview.now >=2||_comment_type == 1) {
        if (pyq.zt == 1) {
            [self pyq];
            return;
        }
        if (haoyou.zt == 1) {
            [self hy];
            return;
        }
        [timer invalidate];
        timer = nil;
    }else{
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(upView) userInfo:nil repeats:NO];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
    }
}
//朋友圈
- (void)pyq{
    if (fxmodel != nil) {
        if (_comment_type == 1) {
            [self wxviewpyq:fxmodel];
        }else if (_comment_type == 2){
            [self wxzstpyq:fxmodel];
        }else if (_comment_type == 3){
            [self wxzstpyq:fxmodel];
        }
    }
}
//好友
- (void)hy{
    if (fxmodel != nil) {
        if (_comment_type == 1) {
            [self wxhys:fxmodel];
        }else if (_comment_type == 2){
            [self wxhyshy:fxmodel];
        }else if (_comment_type == 3){
            [self wxhyshy:fxmodel];
        }
    }
}
#pragma mark ---------------- 文章分享
- (void)wxhys:(FenXiangModel *)dic{
    if (_comment_type == 1) {
        platformType = SSDKPlatformSubTypeWechatSession;
        url = [NSString stringWithFormat:@"%@?showType=%@&studentId=%@&atype=%@",fxmodel.url,_itemid,Me.ssid,@"1"];
        NSString * fxtext = fxmodel.content;
        if (fxmodel.content.length>100) {
            fxtext = [fxtext substringToIndex:99];
        }
        title = fxtext;
        NSString * tit = fxmodel.title;
        tit = [tit stringByReplacingOccurrencesOfString:@"##" withString:Me.name];
        tit = [tit stringByReplacingOccurrencesOfString:@"*" withString:_nmodel.banner.title];
        subtitle = tit;
    }
    [self shareLinkhy:dic];
 
}
- (void)wxviewpyq:(FenXiangModel *)dic{
    if (_comment_type == 1) {
        platformType = SSDKPlatformSubTypeWechatTimeline;
        url = [NSString stringWithFormat:@"%@?showType=%@&studentId=%@&atype=%@",fxmodel.url,_itemid,Me.ssid,@"1"];
        NSString * fxtext = fxmodel.content;
        if (fxmodel.content.length>100) {
            fxtext = [fxtext substringToIndex:99];
        }
        title = fxtext;
        NSString * tit = fxmodel.title;
        tit = [tit stringByReplacingOccurrencesOfString:@"##" withString:Me.name];
        tit = [tit stringByReplacingOccurrencesOfString:@"*" withString:_nmodel.banner.title];
        subtitle = tit;
    }
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
                                      image:[NSURL URLWithString: [NSString stringWithFormat:@"%@%@",IMAGEURL,_nmodel.banner.banner_img]]
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
                                      image:[NSURL URLWithString: [NSString stringWithFormat:@"%@%@",IMAGEURL,_nmodel.banner.banner_img]]
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
    if (_comment_type == 2) {
        shareview = [[ShareZhiShiTuView alloc] initWithType:0];
    }else if (_comment_type == 3){
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
    if (_comment_type == 2 || _comment_type == 3) {
        platformType = SSDKPlatformSubTypeWechatTimeline;
        shareImage = [shareview imageFromView];
        [shareview removeFromSuperview];
        [self shareLinkpyqImaage:dic];
    }
}
- (void)wxhyshy:(FenXiangModel *)dic{
    if (_comment_type == 2 || _comment_type == 3) {
        platformType = SSDKPlatformSubTypeWechatSession;
        shareImage = [shareview imageFromView];
        [shareview removeFromSuperview];
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
         [self removeFromSuperview];
     }];

}


- (void)setSfShare:(NSInteger)sfShare{
    _sfShare = sfShare;
    if (sfShare == 1) {
        if (haoyou!=nil) {
            [haoyou removeFromSuperview];
            [pyq removeFromSuperview];
        }
    }
}
@end
