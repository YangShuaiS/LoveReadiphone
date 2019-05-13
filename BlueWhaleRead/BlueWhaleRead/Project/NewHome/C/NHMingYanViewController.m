//
//  NHMingYanViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/22.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NHMingYanViewController.h"
#import "NHMingYanViewTabView.h"
#import "QiCardView.h"
#import "QiCardItemCell.h"
#import <SafariServices/SafariServices.h>
#import "MingYanShare.h"
#import "NHMingYanTwoViewController.h"
static NSString * const qiCardCellId = @"QiCardCellId";

@interface NHMingYanViewController ()<NavDelegate,QiCardViewDataSource, QiCardViewDelegate>
@property (nonatomic, strong) QiCardView *cardView;//!< 主角：QiCardView
//@property (nonatomic, copy) NSArray<QiDataModel *> *cellItems;//!< 数据模型数据

@end

@implementation NHMingYanViewController{
    NHMingYanViewTabView * tabview;
    UIImageView * imageview;
    CAGradientLayer *gradient;
    NSMutableArray * itemArray;
    NSInteger now;
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"格言列表" RightTitle:@"列表" NativeStyle:NavStyleLeftImageAndRightImageAndCenter];
    self.navtive.titcolor = RGB(0, 0, 0);
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    self.navtive.backgroundColor = [UIColor clearColor];
    
//    self.navtive.downlayer = YES;
}
- (void)NavLeftClick{
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    NHMingYanTwoViewController * view = [NHMingYanTwoViewController new];
    view.itemarray = itemArray;
    [self.navigationController pushViewController:view animated:YES];
    WS(ws);
    [view setBlocks:^(NSInteger now) {
        ws.cardView.NowLocation = now;
        [ws.cardView reloadDataAnimated:YES];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    self.view.backgroundColor = [UIColor whiteColor];
    WS(ws);
    imageview = [UIImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFill;
    imageview.layer.masksToBounds = YES;
//    imageview.backgroundColor = [UIColor redColor];
    [self.view addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.and.left.and.right.mas_equalTo(ws.view);
//        make.height.mas_equalTo(LENGTH(200));
    }];
    
    gradient = [CAGradientLayer layer];
    [self initViews];
    
//    tabview = [NHMingYanViewTabView new];
//    [self.view addSubview:tabview];
//    WS(ws);
//    [tabview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(ws.navtive.mas_bottom).with.offset(1);
//        make.left.and.right.and.bottom.mas_equalTo(ws.view);
//    }];
    [self LoadData];
    // Do any additional setup after loading the view.
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    gradient.frame = imageview.bounds;
    
    gradient.colors = @[(id)[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1].CGColor,(id)[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:0.5].CGColor];
    gradient.startPoint = CGPointMake(1, 0);
    gradient.endPoint = CGPointMake(1, 1);
    //    gradient.locations = @[@(0.5f), @(1.0f)];
    [imageview.layer addSublayer:gradient];
}
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_PROVERBLIST];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            NewHomeModel * model = [NewHomeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }

        }else{

        }
    }];
}
- (void)UpData:(NewHomeModel *)model{
    itemArray = model.proverb;
    for (NHProverbModel * promodel in itemArray) {
        NSCalendarUnit dayInfoUnits  = NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
        NSCalendar *gregorian = [[NSCalendar alloc]
                                 initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        promodel.timedate = [gregorian components:dayInfoUnits fromDate:[BaseObject TimeStringForDate:promodel.show_time]];
    }
    [_cardView reloadData];
//    tabview.itemarray = model.proverb;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//! 初始化Views
- (void)initViews {
    
    _cardView = [[QiCardView alloc] initWithFrame:CGRectMake(LENGTH(38), LENGTH(23)+NavHeight, WIDTH-LENGTH(76), LENGTH(475))];
    _cardView.backgroundColor = [UIColor clearColor];//!< 为了指出carddView的区域，指明背景色
    _cardView.dataSource = self;
    _cardView.delegate = self;
    _cardView.visibleCount = 3;
    _cardView.lineSpacing = 10.0;
    _cardView.interitemSpacing = 10.0;
    _cardView.maxAngle = 10.0;
    _cardView.isAlpha = YES;
    //    _cardView.maxRemoveDistance = 100.0;
    _cardView.layer.cornerRadius = 10.0;
    [_cardView registerClass:[QiCardItemCell class] forCellReuseIdentifier:qiCardCellId];
    [self.view addSubview:_cardView];
}


#pragma mark - QiCardViewDataSource

- (QiCardItemCell *)cardView:(QiCardView *)cardView cellForRowAtIndex:(NSInteger)index {
    
    QiCardItemCell *cell = [cardView dequeueReusableCellWithIdentifier:qiCardCellId];
//    cell.layer.cornerRadius = 10.0;
//    cell.layer.masksToBounds = YES;
    cell.model = itemArray[index];
    cell.buttonClicked = ^(UIButton *sender) {
        [self Share];
    };
    return cell;
}

- (NSInteger)numberOfCountInCardView:(UITableView *)cardView {
    return itemArray.count;
}


#pragma mark - QiCardViewDelegate

- (void)cardView:(QiCardView *)cardView didRemoveLastCell:(QiCardViewCell *)cell forRowAtIndex:(NSInteger)index {
    _cardView.NowLocation = 0;
    [cardView reloadDataAnimated:YES];
}

- (void)cardView:(QiCardView *)cardView didRemoveCell:(QiCardViewCell *)cell forRowAtIndex:(NSInteger)index {
    NSLog(@"didRemoveCell forRowAtIndex = %ld", index);
}

- (void)cardView:(QiCardView *)cardView didDisplayCell:(QiCardViewCell *)cell forRowAtIndex:(NSInteger)index {
    NHProverbModel * model = itemArray[index];
    now = index;
//    [imageview sd_setImageWithURL:URLIMAGE(model.img)];
    [imageview sd_setImageWithURL:URLIMAGE(model.img) completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        CGFloat bl = WIDTH/image.size.width;
        CGFloat hei = bl * image.size.height;
        [self->imageview mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(hei);
        }];
    }];
}

- (void)cardView:(QiCardView *)cardView didMoveCell:(QiCardViewCell *)cell forMovePoint:(CGPoint)point {
    //    NSLog(@"move point = %@", NSStringFromCGPoint(point));
}

- (void)Share{
    NHProverbModel * model = itemArray[now];
    MingYanShare * share = [MingYanShare new];
    share.model = model;
    [[UIApplication sharedApplication].delegate.window addSubview:share];
    [share mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo([UIApplication sharedApplication].delegate.window);
    }];
}

@end
