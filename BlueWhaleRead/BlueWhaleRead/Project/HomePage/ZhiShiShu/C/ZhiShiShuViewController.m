//
//  ZhiShiShuViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/17.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuViewController.h"
#import <iCarousel.h>
#import "ZhiShiShuOneDownView.h"
#import "ZhiShiShuSMViewController.h"
@interface ZhiShiShuViewController ()<iCarouselDataSource, iCarouselDelegate,NavDelegate>
@property (nonatomic, strong) iCarousel      *carousel;   // iCarousel
@end

@implementation ZhiShiShuViewController{
    ZhiShiShuOneDownView * downview;
    NSMutableArray * modelarray;
    NSInteger nowindext;
}
- (void)viewWillAppear:(BOOL)animated{
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
//    self.navigationController.navigationBar.hidden = NO;
//    self.navigationController.navigationBar.backgroundColor = MAINCOLOR;
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
//    [self.navigationController.navigationBar setbac]
//    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];

    [super viewWillDisappear:animated];
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    nowindext = 0;
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"知识树" RightTitle:@"？" NativeStyle:NavStyleLeftImageAndRightImageAndCenter];
    self.navtive.backgroundColor = [UIColor clearColor];
    self.navtive.titcolor = RGB(51,51,51);
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
}

- (void)NavCenterClick {
 
}

- (void)NavLeftClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)NavRightClick {
    ZhiShiShuSMViewController * vc = [ZhiShiShuSMViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)loadUpData{
    //    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FOUND];
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSTX,JK_ZHISHITIXIXIFENLEI];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            ZhiShiShuFLModel * model = [ZhiShiShuFLModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                self->modelarray = [NSMutableArray array];
                self->modelarray = model.data;
                [self->_carousel reloadData];
            }
        }else{
            
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUpData];
    WS(ws);
//    ZhiShiShuScroVuew * scroview = [ZhiShiShuScroVuew new];
//    [self.view addSubview:scroview];
//    [scroview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(ws.view);
//    }];
    
    // 初始化数据源
    // 初始化iCarousel
//    UIImage *backgroundImage = [UIImage imageNamed:@"bg"];
//    UIColor *backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
//    self.view.backgroundColor = backgroundColor;
    UIImageView * bacimage = [UIImageView new];
    bacimage.contentMode = UIViewContentModeScaleAspectFill;
    bacimage.image = UIIMAGE(@"bg");
    [self.view addSubview:bacimage];
    [bacimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];

    self.carousel = [iCarousel new];
    self.carousel.backgroundColor = [UIColor clearColor];
    _carousel.layer.masksToBounds = YES;
    _carousel.type = iCarouselTypeRotary;
    _carousel.pagingEnabled = YES;
    _carousel.autoscroll = 0;
    _carousel.viewpointOffset = CGSizeMake(0, -LENGTH(200));
    [self.view addSubview:_carousel];
//    [_carousel setBackgroundColor:backgroundColor];
    [_carousel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view).with.insets(UIEdgeInsetsMake(-LENGTH(450), 0, -LENGTH(0), 0));
    }];
    // 设置代理
    self.carousel.delegate   = self;
    self.carousel.dataSource = self;

    FLAnimatedImageView * leftimage = [FLAnimatedImageView new];
    leftimage.image = UIIMAGE(@"左");
    [self.view addSubview:leftimage];
    [leftimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(15));
        make.centerY.mas_equalTo(ws.view);
        make.width.mas_equalTo(LENGTH(15));
        make.height.mas_equalTo(LENGTH(30));
    }];
    UIView * leftv = [UIView new];
    [self.view addSubview:leftv];
    [leftv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.view);;
        make.centerY.mas_equalTo(ws.view);
        make.width.mas_equalTo(LENGTH(40));
        make.height.mas_equalTo(LENGTH(60));
    }];
    
    FLAnimatedImageView * rightimage = [FLAnimatedImageView new];
    rightimage.image = UIIMAGE(@"右");
    [self.view addSubview:rightimage];
    [rightimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(15));
        make.centerY.mas_equalTo(ws.view);
        make.width.mas_equalTo(LENGTH(15));
        make.height.mas_equalTo(LENGTH(30));
    }];
    
    UIView * rightv = [UIView new];
    [self.view addSubview:rightv];
    [rightv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws.view);;
        make.centerY.mas_equalTo(ws.view);
        make.width.mas_equalTo(LENGTH(40));
        make.height.mas_equalTo(LENGTH(60));
    }];
    
    leftv.userInteractionEnabled = YES;
    rightv.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tapleft = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftbutton)];
    [leftv addGestureRecognizer:tapleft];
    
    UITapGestureRecognizer * tapright = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightbutton)];
    [rightv addGestureRecognizer:tapright];
    
    downview = [ZhiShiShuOneDownView new];
    downview.nav = self.navigationController;
    [self.view addSubview:downview];
    [downview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(HEIGHT/2+LENGTH(278)/2+LENGTH(28));
        make.left.mas_equalTo(ws.view);
        make.right.mas_equalTo(ws.view);
    }];
    [self AddNavtion];

}
- (void)leftbutton{
    nowindext++;
    if (nowindext>modelarray.count-1) {
        nowindext = 0;
    }
    [_carousel scrollToItemAtIndex:nowindext animated:YES];
}
- (void)rightbutton{
    nowindext--;
    if (nowindext<0) {
        nowindext = modelarray.count-1;
    }
    [_carousel scrollToItemAtIndex:nowindext animated:YES];
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
#pragma mark -
#pragma mark iCarousel methods
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    // 元素个数
    return [modelarray count];
}

- (UIView *)carousel:(iCarousel *)carousel
  viewForItemAtIndex:(NSInteger)index      // view的标志
         reusingView:(UIView *)view         // 重用的view
{
    if (view == nil)
    {
        view = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, LENGTH(375), LENGTH(450))];
    }

    // 强行转换指针
    FLAnimatedImageView *pointView = (FLAnimatedImageView *)view;
//    pointView.image = UIIMAGE(@"人文-孙悟空");

    ZhiShiShuFLOneModel * model = modelarray[index];
    if (index == 0) {
        [pointView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTX,model.logo]]];
    }else{
        [pointView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTX,model.mini_logo]]];
    }
    // 图片自动适应
    pointView.contentMode = UIViewContentModeScaleAspectFit;
    
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel
     valueForOption:(iCarouselOption)option
        withDefault:(CGFloat)value
{
    if (option == iCarouselOptionSpacing)
    {
        return value * 1.9f;
    }
    
    return value;
}

- (void)carousel:(__unused iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    //点击第几个
//    [_carousel scrollToItemAtIndex:3 animated:YES];
     NSLog(@"Tapped view number: %ld", (long)index);
}

- (void)carouselCurrentItemIndexDidChange:(__unused iCarousel *)carousel {
    nowindext = carousel.currentItemIndex;
    for (NSInteger i = 0; i < carousel.visibleItemViews.count; i++) {
        FLAnimatedImageView * view = carousel.visibleItemViews[i];
        ZhiShiShuFLOneModel * model = modelarray[i];
//        view.image = UIIMAGE(@"人文-孙悟空");
        if (carousel.currentItemIndex == i) {
            [view sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTX,model.logo]]];
        }else{
            [view sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTX,model.mini_logo]]];
        }
//        downview.downstyle = carousel.currentItemIndex;
        downview.model = modelarray[carousel.currentItemIndex];
//        NSString * str = _dataArray[i];
//        if ([str isEqualToString:@"基础"]) {
//
//        }else if ([str isEqualToString:@"自然"]){
//
//        }else if ([str isEqualToString:@"人文"]){
//
//        }else if ([str isEqualToString:@"美学"]){
//
//        }else if ([str isEqualToString:@"科技"]){
//
//        }
    }
}
- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    return WIDTH;
}

- (void)dealloc{
    _carousel.delegate = nil;
    [_carousel removeFromSuperview];
    [self.view removeFromSuperview];
    [self.view.superview removeFromSuperview];
}

@end
