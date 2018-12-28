
//
//  DTALLiewController.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/23.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "DTALLiewController.h"
#import "BookCityViewController.h"
#define itemWidth WIDTH
#define itemHeight HEIGHT

#import "DTDanXuanCollectionViewCell.h"

#import "DTJieGuoViewController.h"
#import "TZJieGuoViewController.h"
#import "BookListViewController.h"
#import "BeiJingView.h"
#define angle2Radion(angle) (angle / 180.0 * M_PI)
@interface DTALLiewController ()<UICollectionViewDataSource,UICollectionViewDelegate,NavDelegate,UIScrollViewDelegate,MedalXQDelegate>
@property (nonatomic, strong) UICollectionView *collectionView; /**< 集合视图 */

@end

@implementation DTALLiewController{
    BaseLabel * page;
    BaseLabel * TimeLabel;
    
    NSTimer * time;
    NSInteger  seconds;
    
    NSInteger nextInter;
    NSMutableArray * itemarray;
    BaseLabel * title;
    BaseLabel * bookName;
    BaseView * timetopview;
    BaseView * timeView;
    FLAnimatedImageView * TimeImage;
    
    NSMutableArray * cellarray;
    
    TheTopPicModel * topModel;
}
- (void)LoadData{
    [self UpData:_Topmodel];
}

- (void)UpData:(TheTopPicModel *)model{
    topModel = model;
    seconds = model.time;
    [time invalidate];
    time = nil;
    time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownAction) userInfo:nil repeats:YES]; //启动倒计时后会每秒钟调用一次方法 countDownAction
    [[NSRunLoop mainRunLoop] addTimer:time forMode:NSRunLoopCommonModes];
    
    //设置倒计时显示的时间
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];//时
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];//分
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];//秒
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    TimeLabel.text = format_time;
    
    itemarray = [NSMutableArray array];
    [itemarray addObjectsFromArray:model.bookProblems];
//    itemarray = (NSMutableArray *)[itemarray sortedArrayUsingComparator:(NSComparator)^(id obj1, id obj2) {
//        return (arc4random() % 3) - 1;
//    }];
    
//    [itemarray addObjectsFromArray:model.bookProblems];
//    [itemarray addObjectsFromArray:model.bookProblems];
    page.text = [NSString stringWithFormat:@"1/%lu",(unsigned long)itemarray.count];
    
    cellarray = [NSMutableArray array];

    [_collectionView reloadData];
}
- (void)LoadDataXunZhang{
    itemarray = [NSMutableArray array];
    [itemarray addObjectsFromArray:_itemarray];
    [itemarray addObjectsFromArray:_itemarray];
    [itemarray addObjectsFromArray:_itemarray];
    page.text = [NSString stringWithFormat:@"1/%lu",(unsigned long)itemarray.count];
    [_collectionView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加通知(处理从后台进来后的情况)
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(addAnimation:)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];
    self.automaticallyAdjustsScrollViewInsets = NO;
    WS(ws);
    
    BeiJingView * backImageView = [BeiJingView new];
    [self.view addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    
    
    [self.view addSubview:self.collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.mas_equalTo(ws);
        make.left.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    
    [self AddNavtion];

    page = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"1/1"];
    [self.view addSubview:page];
    [page mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(LENGTH(15));
        make.top.equalTo(ws.view).with.offset(NavHeight+LENGTH(40));
    }];
    
    bookName = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(19) TextAlignment:NSTextAlignmentLeft Text:_bookname];
    [self.view addSubview:bookName];
    [bookName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws.view);
        make.top.equalTo(ws.view).with.offset(NavHeight+LENGTH(5));
    }];
    
    
    TimeImage = [FLAnimatedImageView new];
    TimeImage.image = UIIMAGE(@"icon_答题计时器");
    [self.view addSubview:TimeImage];

    
    timeView = [BaseView new];
    timeView.backgroundColor = RGB(255,234,195);
    timeView.layer.masksToBounds = YES;
    timeView.layer.cornerRadius = LENGTH(5);
    [self.view addSubview:timeView];
    [timeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.view).with.offset(-LENGTH(15));
        make.centerY.mas_equalTo(self->page.mas_centerY);
        make.width.mas_equalTo(LENGTH(96));
        make.height.mas_equalTo(LENGTH(16));
    }];
    
    timetopview = [BaseView new];
    timetopview.backgroundColor = RGB(255,203,104);
//    timetopview.backgroundColor = [UIColor redColor];
    [timeView addSubview:timetopview];
    [timetopview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->timeView);
        make.top.mas_equalTo(self->timeView);
        make.bottom.mas_equalTo(self->timeView);
        make.width.mas_equalTo(self->timeView);
    }];
    
    TimeLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:@"00:00"];

    [timeView addSubview:TimeLabel];
    [TimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->timeView);
    }];
    
    [TimeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->timeView.mas_left).with.offset(-LENGTH(5));
        make.centerY.mas_equalTo(self->page.mas_centerY);
        make.width.mas_equalTo(LENGTH(15));
        make.height.mas_equalTo(LENGTH(15));

    }];

    
    switch (_style) {
        case DTBookStyle:
            [self LoadData];
            break;
        case DTXunZhangStyle:
            [self LoadDataXunZhang];
            break;
        default:
            break;
    }

}
-(void) countDownAction{
    //倒计时-1
    seconds--;
//    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    NSString *format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    //修改倒计时标签现实内容
    TimeLabel.text = format_time;
    //当倒计时到0时，做需要的操作，比如验证码过期不能提交
    if(seconds<=0){
        [time invalidate];
        time = nil;
        [self bookjieguo];
    }
    if (seconds<=60) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            self->TimeImage.image = UIIMAGE(@"icon_答题计时器红");

            self->timetopview.backgroundColor = RGB(255,111,104);
            self->TimeLabel.textColor = RGB(255,111,104);
            self->timeView.backgroundColor = RGB(255,220,220);
            // 创建动画
            CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
            anim.keyPath = @"transform.rotation";
            // rotation旋转，需要添加弧度值
            // angle2Radion() 角度转弧度的宏
            // @() 包装为NSNumber对象
            anim.values = @[@(angle2Radion(-10)),@(angle2Radion(10)),@(angle2Radion(-10))];
            anim.repeatCount = MAXFLOAT;
            //    anim.duration = 1;
            [self->TimeImage.layer addAnimation:anim forKey:nil];
            
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.1,@0.9,@1.0];
            animation.duration = 2.0;
            animation.calculationMode = kCAAnimationCubic;
            animation.repeatCount = MAXFLOAT;

            //把动画添加上去就OK了
            [self->timeView.layer addAnimation:animation forKey:nil];
        });
    }
    
    CGFloat viewwidth = (CGFloat)seconds/(CGFloat)_Topmodel.time;
    CGFloat viewW = TimeLabel.frame.size.width * viewwidth;
    CGRect frame = timetopview.frame;
    frame.size.width = viewW;
    timetopview.frame =frame;


//    MJExtensionLog(@"%ld",(long)seconds);
}

- (void)addAnimation:(NSNotification *)notificaiton
{
    if (seconds<=60) {
            // 创建动画
            CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
            anim.keyPath = @"transform.rotation";
            // rotation旋转，需要添加弧度值
            // angle2Radion() 角度转弧度的宏
            // @() 包装为NSNumber对象
            anim.values = @[@(angle2Radion(-10)),@(angle2Radion(10)),@(angle2Radion(-10))];
            anim.repeatCount = MAXFLOAT;
            //    anim.duration = 1;
            [self->TimeImage.layer addAnimation:anim forKey:nil];
            
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.1,@0.9,@1.0];
            animation.duration = 2.0;
            animation.calculationMode = kCAAnimationCubic;
            animation.repeatCount = MAXFLOAT;
            
            //把动画添加上去就OK了
            [self->timeView.layer addAnimation:animation forKey:nil];
    }
    //容错
    if (seconds <=0) {
        CGFloat viewW = 0;
        CGRect frame = timetopview.frame;
        frame.size.width = viewW;
        timetopview.frame =frame;
    }
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    
    WS(ws);
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"答题中"];
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.view).with.offset(StatusBar+14);
    }];
    
//    [super AddNavtion];
//    WS(ws);
//    self.navtive = [[NativeView alloc] initWithLeftImage:@"home-Click" Title:_titles RightTitle:@"" NativeStyle:NavStyleGeneral];
//    self.navtive.delegate = self;
//    [self.view addSubview:self.navtive];
//    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(ws.view).with.offset(0);
//        make.right.equalTo(ws.view).with.offset(0);
//        make.top.equalTo(ws.view).with.offset(0);
//        make.height.mas_equalTo(NavHeight);
//    }];
    
}
//- (void)NavLeftClick{
//    [time invalidate];
//    time = nil;
//    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
//    }
//    NSInteger b = 0;
//    switch (_style) {
//        case DTBookStyle:
//            b = 1;
//            break;
//        case DTXunZhangStyle:
//            b = 2;
//            break;
//        default:
//            break;
//    }
//    if (b == 1) {
//        NSArray * contarray = self.navigationController.viewControllers;
//        for (int i =0; i < contarray.count; i++) {
//            UIViewController *controller = contarray[i];
//            if ([controller isKindOfClass:[BookListViewController class]]) {
//                [self.navigationController popToViewController:controller animated:YES];
//                break;
//            }
//        }
//        if (contarray.count == self.navigationController.viewControllers.count) {
//            for (int i =0; i < contarray.count; i++) {
//                UIViewController *controller = contarray[i];
//                if ([controller isKindOfClass:[DTALLiewController class]]) {
//                    UIViewController *controllers = contarray[i-1];
//                    [self.navigationController popToViewController:controllers animated:YES];
//                    break;
//                }
//            }
//        }
//    }else{
//        NSArray * contarray = self.navigationController.viewControllers;
//        for (int i =0; i < contarray.count; i++) {
//            UIViewController *controller = contarray[i];
//            if ([controller isKindOfClass:[DTALLiewController class]]) {
//                UIViewController *controllers = contarray[i-2];
//                [self.navigationController popToViewController:controllers animated:YES];
//                break;
//            }
//        }
//    }
//
////    UIViewController *controller = self.navigationController.viewControllers[self.navigationController.viewControllers.count-1-i];
////    [self.navigationController popToViewController:controller animated:YES];
//
//}
//
//- (void)NavCenterClick {
//
//}
//
//
//- (void)NavRightClick {
//
//}


#pragma mark *** UICollectionViewDataSource ***
// 设置组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 设置行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return itemarray.count;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // item重用机制
    NSString * rid = [NSString stringWithFormat:@"cell%ld",(long)indexPath.row];
    BookProblemsModel * model = itemarray[indexPath.row];
    DTDanXuanCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rid forIndexPath:indexPath];
    if (cell.model == nil) {
        [cellarray addObject:cell];
    }
    if (model.type == 1) {
        cell.style = DTDuoXuanStyle;
    }else if (model.type == 2){
        cell.style = DTLianXianStyle;
    }else if (model.type == 3){
        cell.style = DTPaiXuStyle;
    }else{
        cell.style = DTDanXuanStyle;
    }
    cell.delegate = self;
    cell.model = model;
    if (indexPath.row == 0) {
        cell.dtdownstyle = DTStyleWithOneNext;
    }else if (indexPath.row == itemarray.count-1){
        cell.dtdownstyle = DTStyleWithLastAndPushUp   ;
    }else{
        cell.dtdownstyle = DTStyleWithLastAndNext;
    }
    return cell;

}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{

}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//
//    CGSize size = CGSizeMake(itemWidth,itemHeight);
//    return size;
//}
- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
        //定义每个UICollectionView 横向的间距
        flowLayout.minimumLineSpacing = LENGTH(0);
        //定义每个UICollectionView 纵向的间距
        flowLayout.minimumInteritemSpacing = LENGTH(0);
        //定义每个UICollectionView 的边距距
        flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(0), 0, LENGTH(0));//上左下右
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
        
        //注册cell和ReusableView（相当于头部）
        for (NSInteger i = 0 ; i<100; i++) {
            NSString * rid = [NSString stringWithFormat:@"cell%ld",(long)i];
            [_collectionView registerClass:[DTDanXuanCollectionViewCell class] forCellWithReuseIdentifier:rid];
        }
        //设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        // 设置是否允许滚动
        _collectionView.scrollEnabled = YES;
        //背景颜色
        _collectionView.pagingEnabled = YES;
        _collectionView.scrollsToTop = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        //自适应大小
        _collectionView.bounces = NO;
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _collectionView.scrollsToTop = NO;
        
    }
    return _collectionView;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/WIDTH+1;
    page.text = [NSString stringWithFormat:@"%ld/%lu",(long)index,(unsigned long)itemarray.count];
//    if (index ==itemarray.count) {
//        NSIndexPath * indextoath = [NSIndexPath indexPathForRow:index-1 inSection:0];
//        DTDanXuanCollectionViewCell *cell = (DTDanXuanCollectionViewCell*)[_collectionView cellForItemAtIndexPath:indextoath];
//        cell.EndCell = 1;
//        //    cell.style = DTLianXianStyle;
//    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc{
    
}


- (void)PushFriendViewCOntroller:(PushModel *)model{
    switch (model.style) {
        case PushDaTiJieGuo:
            [self pushjieguo];
            break;
        case DaTiTiaoCHuanXiaYiTi:
            [self NextTI];
            break;
        case DaTiTiaoCHuanShangYiTi:
            [self LastTI];
            break;
        default:
            break;
    }
}

- (void)setStyle:(JieGuoStyle)style{
    _style = style;
}

- (void)pushjieguo{
    [time invalidate];
    time = nil;
    switch (_style) {
        case DTBookStyle:
            [self bookjieguo];
            break;
         case DTXunZhangStyle:
            [self xunzhangJieguo];
            break;
        default:
            break;
    }
}
- (void)bookjieguo{
    NSMutableArray * tiarray = [NSMutableArray array];
    NSMutableArray * yhdan = [NSMutableArray array];
    for (DTDanXuanCollectionViewCell * cell in cellarray) {
        TiStyleModel * styModel = [TiStyleModel new];
        styModel = [cell cellTiMuModel];
        [yhdan addObject:styModel];
            if (![styModel.zqdaarray isEqual:styModel.yhdaarray]) {                
                [tiarray addObject:styModel];
            }
    }
    [self tjdaan:yhdan tiarray:tiarray];
}
- (void)tjdaan:(NSMutableArray *)yhdan tiarray:(NSMutableArray * )tiarray{
    NSString * url = [NSString stringWithFormat:@"%@%@?studentid=%@",ZSFWQ,JK_TIJIAODATI,Me.ssid];
//    NSDictionary * dic = @{@"studentid":Me.ssid};
    
//    NSDictionary * dics = @{@"book_id": @25,@"score": @80,@"answers": @[@{@"problem_id":@62,@"options": @[@"Option5"]}, @{@"problem_id":@63,@"options": @[@"Option5"]}, @{@"problem_id":@64,@"options": @[@"Option1"]}, @{@"problem_id": @65,@"options": @[@"Option1"]}, @{@"problem_id": @66,@"options": @[@"Option1"]}, @{@"problem_id": @67,@"options": @[@"Option1"]}, @{@"problem_id": @68,@"options": @[@"Option1"]}, @{@"problem_id": @69,@"options": @[@"Option1"]}]};
    NSMutableArray * arrayall = [NSMutableArray array];
    for (TiStyleModel * styModel in yhdan) {
        NSMutableDictionary * ti = [NSMutableDictionary dictionary];
        [ti setValue:styModel.timuid forKey:@"problem_id"];
        NSMutableArray * tiarrays = [NSMutableArray array];
        if (styModel.yhdaarray.count>0) {
            if ([styModel.yhdaarray[0] isKindOfClass:[TiMuModel class]]) {
                for (TiMuModel * timu in styModel.yhdaarray) {
                    [tiarrays addObject:timu.TiMu];
                }
            }else{
                for (NSMutableArray * arr in styModel.yhdaarray) {
                    for (TiMuModel * timu in arr) {
                        [tiarrays addObject:timu.TiMu];
                    }
                }
            }
        }else{
            for (TiMuModel * timu in styModel.yhdaarray) {
                [tiarrays addObject:timu.TiMu];
            }
        }
        [ti setObject:tiarrays forKey:@"options"];
        [arrayall addObject:ti];
    }
    NSInteger secon = topModel.time - seconds;
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",secon/3600];//时
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(secon%3600)/60];//分
    NSString *str_second = [NSString stringWithFormat:@"%02ld",secon%60];//秒
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    
    
    NSDictionary * dic = @{@"book_id":_bookid,@"score":_bookfenshu,@"answers":arrayall};
    NSString *jsonString = [DTALLiewController dictionaryToJson:dic];

    NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
//    NSData *data =[jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:nil error:nil];
    request.timeoutInterval= 30;
    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)data.length] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:data];
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                 @"text/html",
                                                 @"text/json",
                                                 @"text/javascript",
                                                 @"text/plain",
                                                 nil];
    manager.responseSerializer = responseSerializer;
    [[manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            TKJIEGUOMODEL * model = [TKJIEGUOMODEL mj_objectWithKeyValues:dict];
            DTJieGuoViewController * vc = [DTJieGuoViewController new];
            vc.style = self->_style;
            vc.bookfenshu = self->_bookfenshu;
            vc.timuarray = tiarray;
            vc.model = model;
            vc.secont = format_time;
            [self.navigationController pushViewController:vc animated:YES];
        } else {
            
        }
    }] resume];
}
+ (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}

- (void)xunzhangJieguo{
    TZJieGuoViewController * vc = [TZJieGuoViewController new];
    vc.style = _style;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)NextTI{
    NSInteger inter = _collectionView.contentOffset.x/WIDTH;
    inter ++;
    if (inter<=itemarray.count-1) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:inter inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }

}
- (void)LastTI{
    NSInteger inter = _collectionView.contentOffset.x/WIDTH;
    inter --;
    if (inter<=itemarray.count-1) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:inter inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)setBookname:(NSString *)bookname{
    _bookname = bookname;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}
@end
