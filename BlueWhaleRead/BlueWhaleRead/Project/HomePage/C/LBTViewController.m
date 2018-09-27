//
//  LBTViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "LBTViewController.h"

@interface LBTViewController ()<NavDelegate,UIWebViewDelegate>

@end

@implementation LBTViewController{
    UIScrollView * scrollView;
    FLAnimatedImageView * topImageView;
    BaseLabel * time;
    BaseLabel * name;
    BaseLabel * down;
    
    UIWebView *webView;


}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    self.view.backgroundColor = BEIJINGCOLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self addView];
}
- (void)addView{
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = RGB(237,243,243);
    scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
//    if ([IOS_X integerValue]>=11.0) {
//        scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    }
    WS(ws);
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view);
    }];
    
//    topImageView = [FLAnimatedImageView new];
//    topImageView.image = UIIMAGE(@"bg_推荐书籍");
//    [scrollView addSubview:topImageView];
//    [topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->scrollView.mas_top).with.offset(0);
//        make.left.equalTo(ws.view).with.offset(0);
//        make.right.equalTo(ws.view).with.offset(0);
//        make.height.mas_equalTo(LENGTH(155));
//    }];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(8,8,8) LabelFont:TextFont(19) TextAlignment:NSTextAlignmentCenter Text:@""];
    name.numberOfLines = 0;
    [scrollView addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->scrollView.mas_top).with.offset(LENGTH(40));
        make.right.equalTo(ws.view).with.offset(-LENGTH(58));
        make.left.equalTo(ws.view).with.offset(LENGTH(58));
    }];
    
    time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(182,181,181) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"2012-12-12"];
    [scrollView addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->name.mas_bottom).with.offset(10);
        make.left.equalTo(ws.view).with.offset(LENGTH(50));
    }];
    



//    NSString * str = @"<p style=""font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"">你知道吗？我昨晚又梦到你了，梦中的你一如既往地帅气，你背对着我，坐在那家我们常去的咖啡馆常坐的位置，我进门径直朝着那个位置走去，却看到了你，我就愣在那儿停顿了好久，然后你转过头来看到了我，你朝我笑，我鼓起<a href=""http://www.duwenzhang.com/huati/yongqi/index1.html"" style=""color: rgb(51, 51, 51); text-decoration-line: none;"">勇气</a>试着向你走近，却始终走不到那个位置，眼睁睁地看着你近在咫尺，却偏偏难以靠近，最后直到你消失不见。</p><p style=""font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"">　　我猛然醒来，睁眼，漆黑，宁静，我放空了几秒，然后才终于认清你已经<a href=""http://www.duwenzhang.com/huati/likai/index1.html"" style=""color: rgb(51, 51, 51); text-decoration-line: none;"">离开</a>我的事实。是啊，已经离开了。</p><p style=""font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"">　　都说，梦中梦到的人，是因为心底觉得离得好远，所以我才会想要在梦中再见见你，可是，在梦中你也离得我好远，我怎么也靠不近你。</p><p style=""font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"">　　也许是在用这种方式告诉我，分开了就不要怀抱<a href=""http://www.duwenzhang.com/huati/xiwang/index1.html"" style=""color: rgb(51, 51, 51); text-decoration-line: none;"">希望</a>，<a href=""http://www.duwenzhang.com/huati/xianshi/index1.html"" style=""color: rgb(51, 51, 51); text-decoration-line: none;"">现实</a>，梦中都不能。</p><p style=""font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"">　　我们在一起时，身边的<a href=""http://www.duwenzhang.com/huati/pengyou/index1.html"" style=""color: rgb(51, 51, 51); text-decoration-line: none;"">朋友</a>都知道，爱你，是他们都知道的事情，后来分开，只有少部分人知道，可是没有人知道我还爱你，这是属于我一个人的<a href=""http://www.duwenzhang.com/huati/mimi/index1.html"" style=""color: rgb(51, 51, 51); text-decoration-line: none;"">秘密</a>。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;<img src=""/ueditor/php/upload/image/20180626/1530008127955036.jpg"" title=""1530008127955036.jpg"" alt=""蓝天.jpg""/></p><p style=""font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"">后来的我一直<a href=""http://www.duwenzhang.com/huati/danshen/index1.html"" style=""color: rgb(51, 51, 51); text-decoration-line: none;"">单身</a>，有时候朋友开玩笑说“你是不是还没有忘掉他”我说“怎么可能，我这么拿的起放的下的人，早忘了。”回答的干脆利落，以至于他们都信了，说的多了，连我都几乎信了。</p><p style=""font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"">　　可是，那为何会在听到你的名字时心头一震，为何会在不经意间想起你的时候心底隐隐难受，为何会在街上看到一个和你相似的背影心脏漏停一秒，为何总是会入我的梦，又为何对后来身边出现的男生都无感，直至今日，你依然是我拒绝别人的理由。我没有在等你，却还是<a href=""http://www.duwenzhang.com/huati/xihuan/index1.html"" style=""color: rgb(51, 51, 51); text-decoration-line: none;"">喜欢</a>不上别人。</p><p style=""font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"">　　会偷偷地跑到你的空间，因为当时在一起的时候微信还没有如此盛行，那时候会要求你弄成情侣头像，关联qq号，设置成情侣空间，有空了就一直在你空间留言，后来我们的qq不再关联，你也换了头像，换了空间装扮，清空了所有留言。我偷偷地溜进去转了一圈，然后默默地删除访问记录。想知道你的消息，又怕你知道我还在惦记。</p><p style=""font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"">　　会偷偷地跑到你的城市，在我们经常走过的那条小路转转，呼吸着这座城市的空气，吹着和你一样的风，算不算相拥？</p><p style=""font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"">　　也会一个人背着包到处旅行，记得和你说过很多想要去的地方，你总说等咱有钱了，想去哪去哪，你总说等有机会了，去很多地方。可是直到分开还是没有去过任何一个地方，我一个人走走停停，看一起说过的风景，而你在哪里？</p><p style=""font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"">　　在一起两年的光景，用了三年的<a href=""http://www.duwenzhang.com/huati/shijian/index1.html"" style=""color: rgb(51, 51, 51); text-decoration-line: none;"">时间</a>念念不忘，<a href=""http://www.duwenzhang.com/huati/huiyi/index1.html"" style=""color: rgb(51, 51, 51); text-decoration-line: none;"">回忆</a>比经历还要长，该说自己太<a href=""http://www.duwenzhang.com/huati/chiqing/index1.html"" style=""color: rgb(51, 51, 51); text-decoration-line: none;"">痴情</a>还是太想不开呢？</p><p style=""font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"">　　其实有时候我们的<a href=""http://www.duwenzhang.com/huati/neixin/index1.html"" style=""color: rgb(51, 51, 51); text-decoration-line: none;"">内心</a>远远没有表面那么潇洒，背影一转身就可以，而心里的空缺要怎样去填平？离开后的日子我瞒着所有人爱了你好久好久，我想这应该是我说<a href=""http://www.duwenzhang.com/huati/fenshou/index1.html"" style=""color: rgb(51, 51, 51); text-decoration-line: none;"">分手</a>的代价吧。但是该偿还的三年时光已经够了吧，剩下的我只想活给自己看。</p><p style=""font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"">　　以前总希望你能来，会突然站在我的面前，会给我打电话让我到楼下给我惊喜，会轻轻地说一句“别来无恙”可是现在我不想要了，那些无处安放的<a href=""http://www.duwenzhang.com/"" style=""color: rgb(51, 51, 51); text-decoration-line: none;"">情感</a>就让它各自归位，你别来，我一个人也无恙。</p><p><br/></p>";
//    NSString * str = @"<font color=red>红色字体</font>其他字体 <font color=red>红色字体</font>其他字体";

//    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[str dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,NSFontAttributeName:[UIFont systemFontOfSize:25.0f] } documentAttributes:nil error:nil];
//    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[str
//    dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:
//    NSHTMLTextDocumentType} documentAttributes:nil error:nil];
//    down = [BaseLabel new];
//    down.numberOfLines = 0;
//    [scrollView addSubview:down];
//    [down mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->name.mas_bottom).with.offset(0);
//        make.right.equalTo(ws.view).with.offset(-LENGTH(58));
//        make.left.equalTo(ws.view).with.offset(LENGTH(50));
//        make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(0);
//    }];
//    down.attributedText = attrStr;
    
    webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.delegate = self;
    [scrollView addSubview:webView];
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->time.mas_bottom).with.offset(LENGTH(10));
        make.right.equalTo(ws.view).with.offset(-LENGTH(12));
        make.left.equalTo(ws.view).with.offset(LENGTH(12));
        make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(-LENGTH(10));
        make.height.mas_equalTo(1);
    }];
    
//    down = [BaseLabel new];
//    down.numberOfLines = 0;
//    [scrollView addSubview:down];
//    [down mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->time.mas_bottom).with.offset(LENGTH(10));
//        make.right.equalTo(ws.view).with.offset(-LENGTH(26));
//        make.left.equalTo(ws.view).with.offset(LENGTH(26));
//        make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(-LENGTH(10));
//    }];

}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
}
- (void)NavLeftClick{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setItemid:(NSString *)itemid{
    _itemid = itemid;
        NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_LBTXQ];
        NSDictionary * dic = @{@"bannerid":itemid};
        
        [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
            if (responseObject) {
                LunBoTuXQModel * model = [LunBoTuXQModel mj_objectWithKeyValues:responseObject];
                if ([model.code isEqual:@200]) {
                    [self updata:model];
                }
            }else{
                
            }
        }];
}
- (void)updata:(LunBoTuXQModel *)model{
//    [topImageView sd_setImageWithURL:URLIMAGE(model.banner.banner_img) placeholderImage:UIIMAGE(@"bg_推荐书籍")];
    time.text = [BaseObject TiemArray:model.banner.create_time String:@" "][0];
//    name.text = model.banner.
    name.text = model.banner.title;
    NSString * str = model.banner.content;
    [webView loadHTMLString:str baseURL:nil];

//    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[str
//                                                                             dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:
//                                                                                                                                      NSHTMLTextDocumentType} documentAttributes:nil error:nil];
//
//    down.attributedText = attrStr;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.background='#edf3f3'"];
    [webView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(webView.scrollView.contentSize.height);
    }];
    //方法1 实际使用js方法实现
    //    CGFloat documentWidth = [[webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('content').offsetWidth"] floatValue];
    //    CGFloat documentHeight = [[webView stringByEvaluatingJavaScriptFromString:@"document.getElementById(\"content\").offsetHeight;"] floatValue];
    //    NSLog(@"documentSize = {%f, %f}", documentWidth, documentHeight);
    //
    //    //方法2
    //    CGRect frame = webView.frame;
    ////    frame.size.width = 768;
    ////    frame.size.height = 1;
    ////        webView.scrollView.scrollEnabled = NO;
    ////    webView.frame = frame;
    //    frame.size.height = webView.scrollView.contentSize.height;
    //    NSLog(@"frame = %@", [NSValue valueWithCGRect:frame]);
    //    webView.frame = frame;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
