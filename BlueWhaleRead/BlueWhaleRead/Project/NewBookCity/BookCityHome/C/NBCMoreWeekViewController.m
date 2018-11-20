//
//  NBCMoreWeekViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBCMoreWeekViewController.h"
#import "NBCchannelCollectionView.h"
@interface NBCMoreWeekViewController ()<NavDelegate>

@end

@implementation NBCMoreWeekViewController{
    NBCchannelCollectionView * nfcc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    [self Addview];
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"全部精读" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.titcolor = RGB(0, 0, 0);
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    self.navtive.backgroundColor = [UIColor whiteColor];
    self.navtive.layer.shadowColor = RGB(0, 0, 0).CGColor;
    self.navtive.layer.shadowOffset = CGSizeMake(0,2);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.navtive.layer.shadowRadius = LENGTH(4);
    self.navtive.layer.shadowOpacity = 0.04;
    
}
- (void)NavLeftClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
}

- (void)Addview{
    self.view.backgroundColor = [UIColor whiteColor];
    WS(ws);
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(WIDTH-LENGTH(44),LENGTH(108));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(10);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(20);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(22), LENGTH(22), TabBarHeight, LENGTH(22));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    nfcc = [[NBCchannelCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    nfcc.nav = self.navigationController;
    nfcc.more = NO;
    nfcc.zt = NO;
    [self.view addSubview:nfcc];
    [nfcc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(6));
        make.left.mas_equalTo(ws.view);
        make.right.mas_equalTo(ws.view);
        make.bottom.mas_equalTo(ws.view);
    }];
    
    nfcc.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self LoadData];
    }];
    [nfcc.mj_header beginRefreshing];
}
#pragma mark - 下拉刷新
- (void)headRefresh{
    [self LoadData];
}
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_NBCZT];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"typeid":@"2"};
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            NBCALLModel * model = [NBCALLModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }
            [self->nfcc.mj_header endRefreshing];
        }else{
            [self->nfcc.mj_header endRefreshing];
        }
    }];
}
- (void)UpData:(NBCALLModel *)model{
    nfcc.itemArray = model.weekList;
}

@end
