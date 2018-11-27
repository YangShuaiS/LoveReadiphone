//
//  Public.h
//  LOL
//
//  Created by Kean on 16/7/1.
//  Copyright © 2016年 Kean. All rights reserved.
//

#ifndef Public_h
#define Public_h
#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT  [UIScreen mainScreen].bounds.size.height

#define KIsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define LENGTH(x)       (NSInteger)(x*([UIScreen mainScreen].bounds.size.width/375.0))
#define LENGTHHEIGHT(x)       (NSInteger)(x*([UIScreen mainScreen].bounds.size.width/768.0))

#define XIANGSU(x) (x*[UIScreen mainScreen].scale)
#define MENU  LENGTH(53)

#define kUserDefaults [NSUserDefaults standardUserDefaults]
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define IOS_X [UIDevice currentDevice].systemVersion

#define BANBENHAO @"v1.11"


//#define ZSFWQ @"http://192.168.1.114:8088/"
//#define ZSFWQ @"http://119.90.89.88:8080/maven/"
//#define ZSFWQ @"http://192.168.1.114:8075/"
//#define ZSFWQ @"http://192.168.1.114:8077/"
//#define ZSFWQ @"http://192.168.1.114:8075/"

//#define ZSFWQ @"http://119.90.89.88:20001/"
//#define ZSFWQ @"http://39.106.100.235:8080/"
//#define ZSFWQ @"http://39.106.100.235:8081/"
//#define ZSFWQ @"http://192.168.1.221:8080/"
//#define ZSFWQ @"http://tiantianaidu.com/"
//#define ZSFWQ @"http://119.90.89.88:8080/"
//#define IMAGEURL @"http://39.106.100.235:8081/"
//#define IMAGEURL @"http://192.168.1.221:8080/"

//#define IMAGEURL @"http://192.168.1.221:8081/"
#define IMAGEURL @"http://tiantianaidu.com/"

//#define ZSTX @"http://192.168.1.231:9001/"//内网
#define ZSTX @"http://119.90.89.88:9001/"//外网
//#define ZSTX @"http://192.168.1.102/knowledge/public/"//


#define HOMEPAGE @"api/v1.0/homePage"//首页
#define BOOKCITY @"api/v1.0/bookList"//书库
#define JK_BOOKXQ @"api/v1.0/bookDetail"//书详情
#define JK_JOOINBOOKCITY @"api/v1.0/addMyBook"//加入书架
#define JK_REMOVEBOOKCITY @"api/v1.0/delMyBook"//移除书架
#define JK_TZDTTIMU @"api/v1.0/bookProblem"//挑战答题题目
#define JK_TIJIAODATI @"api/v1.0/submitProblem"//挑战答题结果
#define JK_LICHENGBEI @"api/v1.0/myMilestone"//里程碑
#define JK_XUNZHANGLIST @"api/v1.0/badgeList"//勋章list
#define JK_MyCLASS @"api/v1.0/myClass"  //我的班级
#define JK_MYDE @"api/v1.0/myPage"//我的
#define JK_MYDEXINXI @"api/v1.0/personalInfo"//我的薪资
#define JK_FRIENDHOME @"api/v1.0/friendPage" //他人中心页
#define JK_XUNZHANGXQ @"api/v1.0/badgeDetail"//勋章详情
#define JK_TISHIZILIANGKS @"api/v1.0/literacy_begin"//识字量开始
#define JK_TISHIZILIANGNEXT @"api/v1.0/literacy_process"//识字量下一题
#define JK_TISHIZILIANGJG @"api/v1.0/literacy_result"//识字量结果
#define JK_TISHICILIANGKS @"api/v1.0/glossary_begin"//识词量开始
#define JK_TISHICILIANGNEXT @"api/v1.0/glossary_process"//识词量下一题
#define JK_TISHIVILIANGJG @"api/v1.0/glossary_result"//识词量结果
#define JK_ZHUTIPAGE @"api/v1.0/themePage"//主题页
#define JK_CHENGJIUBAOBIAO @"api/v1.0/achievementReport"//成就报表
#define JK_DENGLU @"api/v1.0/userLogin"//登录
#define JK_SOUSUOSHUKU @"api/v1.0/searchBook"//搜索书库
#define JK_MessageLIST @"api/v1.0/messageList"//消息列表
#define JK_MessageXQ @"api/v1.0/messageDetail"//消息详情
#define JK_MessageRemove @"api/v1.0/delMessage"//删除消息
#define JK_FOUND @"api/v1.0/findPage"//发现
#define JK_YUEXUNZHANGPAIMING @"api/v1.0/monthBadge"//月勋章排名
#define JK_XGMM @"api/v1.0/updatePassword"//修改密码
#define JK_WJMM @"api/v1.0/forgetPassword"//忘记密码
#define JK_LBTXQ @"api/v1.0/bannerDetail"//轮播图详情
#define JK_BANJIDONGTAI @"api/v1.0/classDynamicList"//班级动态
#define JK_FASONGYANZHENGMA @"api/v1.0/sendMessage"//发送验证码
#define JK_JIAOYANYANZHENGMA @"api/v1.0/checkCode"//教研验证码
#define JK_GENGGAISHOUJIHAO @"api/v1.0/updatePhone"//更改手机号
#define JK_JIAOYANPHONE @"api/v1.0/checkPhone"//教研手机号是否注册
#define JK_ZHUCE @"api/v1.0/userRegister"//注册
#define JK_DIQU @"api/v1.0/areaList"//地区
#define JK_WSXX @"api/v1.0/improveUserinfo"//完善信息
#define JK_GHGHMM @"api/v1.0/checkPassword"//更换手机号密码
#define JK_XGNAME @"api/v1.0/updateUserName"//修改昵称


#define JK_GOODBOOKGAN @"api/v1.0/goodArticleList"//读后感
#define JK_MyBadge @"api/v1.0/myBadge"//我的勋章
#define JK_FRIENDHYH @"api/v1.0/friendBook"//首页换一换
#define JK_SCTP @"api/v1.0/uploadAvatar"//
#define JK_TIFANKUI @"api/v1.0/problemFeedback"//题反馈
#define JK_YIJIANFANKUI @"api/v1.0/suggestFeedback"//意见反馈
#define JK_LOVEANDNOLOVE @"api/v1.0/bookIsLike"//喜欢不喜欢
#define JK_TCDL @"api/v1.0/userSignOut"//退出登录



#define JK_USERBOOKLIST @"api/v1.0/MyBookList"//我的书架
#define JK_TZXUNZHANG @"api/v1.0/ToGainBadge"//挑战勋章
#define JK_TJTIDAAN @"api/v1.0/submitProblem"//提交题
#define JK_PUSHSZJIEGUO @"api/v1.0/submitLiteracy"//提交识字
#define JK_TISHICILIANG @"api/v1.0/glossaryTest"//识词量
#define JK_PUSHSCJIEGUO @"api/v1.0/submitGlossary"//提交识词


#define JK_GHYM @"api/v1.0/testApi"//是否更换域名

#define JK_ZHISHITIXIXIANGQING @"knowledge/get-all"//体系详情
#define JK_ZHISHITIXIXIFENLEI @"/knowledge/get-type"//体系分类
#define JK_ZHISHITIXIXQ @"/knowledge/get-content"//体系详情



#define JK_FXLCB @"api/v1.0/sharewxInfo"//分享里程碑


#define JK_NBCHOME @"api/v1.0/bookPage"//新书城home
#define JK_NBCZT @"api/v1.0/themeList"//专题

// 相对iphone6S 屏幕比
#define KWidth_ScaleW [UIScreen mainScreen].bounds.size.width/414.0f
#define KWidth_ScaleH [UIScreen mainScreen].bounds.size.height/736.0f

// tabBar的背景色
#define TabBar_T_Color RGB(191, 31, 31)
#define TABBARHeight self.tabBarController.tabBar.frame.size.height
#define NAVIGATIONHeight self.navigationController.navigationBar.frame.size.height
#define STAUBARHEIGHT [[UIApplication sharedApplication]  valueForKey:@"statusBar"];

// RGB
#define RGBA(r, g, b, a)  [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)  RGBA(r, g, b, 1.0f)
#define TabBarTitleColor mHexRGB(0x52c7c6) //字体深色
#define RANDOMCOLORALPHA(f) [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:f];
#define RANDOMCOLOR [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0f];

// 系统版本
#define SYTEM_VERSION [[UIDevice currentDevice].systemVersion floatValue]


//通知名称
#define kNotificationDenglu        @"kNotificationDenglu"
#define kNotificationTuiChuDenglu        @"kNotificationTuiChuDenglu"
#define kNotificationAcitivity     @"kNotificationAcitivity"//推荐书籍更多展开
#define kNotificationGengHuanPhone    @"kNotificationGengHuanPhone"//更换手机号

//字体大小
#define TextFont(f) [UIFont fontWithName:@"PingFang-SC-Regular" size:FontSize(LENGTH(f))]
#define TextFontHeight(f) [UIFont fontWithName:@"PingFang-SC-Regular" size:FontSize(LENGTHHEIGHT(f))]

//#define TextFont(f) [UIFont fontWithName:@"PingFangSC-Medium" size:FontSize(LENGTH(f))]
#define TextFontCu(f) [UIFont fontWithName:@"PingFangSC-Medium" size:FontSize(LENGTH(f))]
#define TextFontling(f) [UIFont fontWithName:@"PingFangSC-Light" size:FontSize(LENGTH(f))]

//跟视图数量
#define ChildViewControllersCount self.navigationController.childViewControllers.count
//plist文件
#define UserMe @"UserMe.plist"

#define XAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

//展位图
#define UIIMAGE(image) [UIImage imageNamed:image]

//url

//#define URLIMAGE(string) [NSURL URLWithString:string]
#define URLIMAGE(string) [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IMAGEURL,string]]
//各种颜色
#define DT_LABELCOLOR RGB(33, 33, 33)//答题label颜色


#ifdef DEBUG
#   define SDLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define SDLog(...)
#   define ELog(err)
#endif

#define mHexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define fontHightColor mHexRGB(0x3c3c3c) //字体深色
#define fontNomalColor mHexRGB(0xa0a0a0) //字体浅色
#define bjColor mHexRGB(0xe4e4e4)  //背景灰色
#define borderCol mHexRGB(0xe4e4e4)    //border颜色

#define MAINCOLOR [UIColor colorWithRed:82.0/255.0f green:199/255.0f blue:198/255.0f alpha:1]   //主颜色
#define BEIJINGCOLOR [UIColor colorWithRed:242.0/255.0f green:249/255.0f blue:249/255.0f alpha:1]   //背景色
#define TABLEVIEWCELLROW [UIColor colorWithRed:242.0/255.0f green:249/255.0f blue:249/255.0f alpha:1]   //背景色



#define LinShiFont 15
#define LinShiZiTiYanSe mHexRGB(0x333333)
#define ChangYongTitLe RGB(4,51,50)
#define WhitColor RGB(255,255,255)

#define ZHANWEIZI @"我是占位字"
#define CHANGWENZI @"我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字"
#define ZHANWEITUTX @"icon-男孩"
#define ZHANWEITUTXN @"icon-男孩"
#define ZHANWEITUTXV @"icon-女孩"

#define ZHANWEITUSHU @"发现_你的同学_书缺省位置"
//#define ZHANWEITUXUNZHANG @"big"
#define ZHANWEITUXZ @"icon_勋章书籍标识的暂用勋章"
#define ZHANWEITUXUNZHANGBEIJING @"bg_勋章"

#define ZHANWEITU @"big"
#define ZHANWEITUWENZHANG @"bg_优秀好文1"


#define LINSHITU @"big"


#define Font20 20
#define Font18 18
#define Font17 17
#define Font16 16
#define Font15 15
#define Font14 14
#define Font13 13
#define Font12 12
#define Font11 11



#define backColor [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1]
#define subtitleColor [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1]
#define Color120 [UIColor colorWithRed:120/255.0f green:120/255.0f blue:120/255.0f alpha:1]
#define ColorLV [UIColor colorWithRed:251/255.0f green:143/255.0f blue:37/255.0f alpha:1]

#endif /* Public_h */
