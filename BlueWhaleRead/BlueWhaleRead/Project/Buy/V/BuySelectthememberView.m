//
//  BuySelectthememberView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/24.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuySelectthememberView.h"
#import "BuyInterestsCollectionView.h"
#import "BuyPackageCollectionView.h"
#import "BuyInvitationView.h"
#import "AgreementViewController.h"
#define itemWidth LENGTH(55)
#define itemHeight LENGTH(65)

#define itemWidth1 (WIDTH-LENGTH(75))/2
#define itemHeight1 LENGTH(206)
@implementation BuySelectthememberView{
    UIImageView * backImageView;
    NativeView * nav;
    UIImageView * touxiang;
    BaseLabel * name;
    BaseLabel * huiyuanzt;//会员状态
    BaseLabel * Duetime;//到期时间
    BuyInterestsCollectionView *collectView;
    BuyPackageCollectionView * packageCollectView;
    BuyInvitationView * downView;
    
    NSMutableArray * zidongarray;
    NSMutableArray * dnaciarray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        zidongarray = [NSMutableArray array];
        dnaciarray = [NSMutableArray array];
        [self addview];
    }
    return self;
}

- (void)addview{
    WS(ws);
    self.backgroundColor = [UIColor whiteColor];
    backImageView = [UIImageView new];
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.image = UIIMAGE(@"顶部背景");
    [self addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
        make.size.mas_equalTo(CGSizeMake(LENGTH(self->backImageView.image.size.width), LENGTH(self->backImageView.image.size.height)));
    }];
    
    nav = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"成为会员" RightTitle:@"" NativeStyle:NavStyleGeneral];
//    nav.titcolor = RGB(0, 0, 0);
    nav.delegate = self;
    [self addSubview:nav];
    [nav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    nav.backgroundColor = [UIColor clearColor];
    
    touxiang = [UIImageView new];
    touxiang.contentMode = UIViewContentModeScaleAspectFit;
    touxiang.layer.masksToBounds = YES;
    touxiang.layer.cornerRadius = LENGTH(25);
    touxiang.image = UIIMAGE(@"头像-大");
    [backImageView addSubview:touxiang];
    [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backImageView).with.offset(LENGTH(16));
        make.top.mas_equalTo(self->nav.mas_bottom).with.offset(LENGTH(20));
        make.size.mas_equalTo(CGSizeMake(LENGTH(50), LENGTH(50)));
    }];
    
    name = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFontCu(18) TextAlignment:NSTextAlignmentLeft Text:@"姓名"];
    [backImageView addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->touxiang).with.offset(-LENGTH(9));
        make.left.mas_equalTo(self->touxiang.mas_right).with.offset(LENGTH(9));
    }];
    
    huiyuanzt = [[BaseLabel alloc] initWithTxteColor:RGB(207, 179, 127) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:@"未开通"];
    huiyuanzt.layer.masksToBounds = YES;
    huiyuanzt.layer.cornerRadius = LENGTH(8);
    huiyuanzt.layer.borderWidth = 1;
    huiyuanzt.layer.borderColor = RGB(207, 179, 127).CGColor;
    [backImageView addSubview:huiyuanzt];
    [huiyuanzt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->name);
        make.left.mas_equalTo(self->name.mas_right).with.offset(LENGTH(6));
        make.width.mas_equalTo(LENGTH(44));
        make.height.mas_equalTo(LENGTH(18));
    }];
    
    Duetime = [[BaseLabel alloc] initWithTxteColor:RGB(175, 175, 175) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"开通会员畅游在知识的海洋"];
    [backImageView addSubview:Duetime];
    [Duetime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->name.mas_bottom).with.offset(LENGTH(6));
        make.left.mas_equalTo(self->touxiang.mas_right).with.offset(LENGTH(9));
    }];
    
    UIImageView * qyBackImage = [UIImageView new];
    qyBackImage.image = UIIMAGE(@"博万卷会员权益-背景");
    qyBackImage.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:qyBackImage];
    [qyBackImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->touxiang.mas_bottom).with.offset(LENGTH(25));
        make.centerX.mas_equalTo(ws);
        make.size.mas_equalTo(CGSizeMake(LENGTH(qyBackImage.image.size.width), LENGTH(qyBackImage.image.size.height)));
    }];
    
    BaseLabel * qylabel = [[BaseLabel alloc] initWithTxteColor:RGB(132, 106, 62) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"博万卷会员权益"];
    [qyBackImage addSubview:qylabel];
    [qylabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(qyBackImage).with.offset(LENGTH(18));
        make.centerX.mas_equalTo(qyBackImage);
    }];
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
    //    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(16);
    //    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(22);
    //    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(25), 0, LENGTH(25));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[BuyInterestsCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [qyBackImage addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(qyBackImage).with.offset(LENGTH(0));
        make.top.equalTo(qylabel.mas_bottom).with.offset(LENGTH(16));
        make.right.equalTo(qyBackImage).with.offset(LENGTH(0));
        make.height.mas_equalTo(itemHeight);
    }];
    NSMutableArray * nuyintererarray = [NSMutableArray array];
    for (int i = 0; i < 8; i++) {
        BuyInterestsModel * inmodel = [BuyInterestsModel new];
        if (i == 0) {
            inmodel.image = @"知识脉络";
            inmodel.title = @"知识脉络";
        }else if (i == 1){
            inmodel.image = @"在线阅读";
            inmodel.title = @"在线阅读";
        }else if (i == 2){
            inmodel.image = @"知识积累";
            inmodel.title = @"知识积累";
        }else if (i == 3){
            inmodel.image = @"阅读答题";
            inmodel.title = @"阅读答题";
        }else if (i == 4){
            inmodel.image = @"能力评测";
            inmodel.title = @"能力评测";
        }else if (i == 5){
            inmodel.image = @"兴趣培养";
            inmodel.title = @"兴趣培养";
        }else if (i == 6){
            inmodel.image = @"均衡系统";
            inmodel.title = @"均衡系统";
        }else if (i == 7){
            inmodel.image = @"知识体系";
            inmodel.title = @"知识体系";
        }
        [nuyintererarray addObject:inmodel];
    }
    collectView.itemarray = nuyintererarray;
    BaseLabel * hytc = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFontCu(17) TextAlignment:NSTextAlignmentCenter Text:@"会员套餐"];
    [self addSubview:hytc];
    [hytc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(qyBackImage.mas_bottom).with.offset(LENGTH(24));
    }];
    
    UIImageView * lefthg = [UIImageView new];
    lefthg.contentMode = UIViewContentModeScaleAspectFit;
    lefthg.image = UIIMAGE(@"皇冠");
    [self addSubview:lefthg];
    [lefthg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(hytc);
        make.right.mas_equalTo(hytc.mas_left).with.offset(-LENGTH(6));
        make.size.mas_equalTo(CGSizeMake(LENGTH(21), LENGTH(13)));
    }];
    
    UIImageView * righthg = [UIImageView new];
    righthg.contentMode = UIViewContentModeScaleAspectFit;
    righthg.image = UIIMAGE(@"皇冠");
    [self addSubview:righthg];
    [righthg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(hytc);
        make.left.mas_equalTo(hytc.mas_right).with.offset(LENGTH(6));
        make.size.mas_equalTo(CGSizeMake(LENGTH(21), LENGTH(13)));
    }];
    //使用帮助
    BaseLabel * sybz = [[BaseLabel alloc] initWithTxteColor:RGB(150, 150, 150) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@"使用帮助 >"];
    [self addSubview:sybz];
    [sybz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(hytc);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(18));
    }];
    
    UIView * clickSybz = [UIView new];
    [self addSubview:clickSybz];
    [clickSybz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(hytc);
        make.right.mas_equalTo(ws);
        make.left.mas_equalTo(sybz);
        make.height.mas_equalTo(LENGTH(25));
    }];
    clickSybz.userInteractionEnabled = YES;
    UITapGestureRecognizer * Sybztap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sybzClick)];
    [clickSybz addGestureRecognizer:Sybztap];
    
    
    UICollectionViewFlowLayout *flowLayout1 = [[UICollectionViewFlowLayout alloc] init];
    flowLayout1.itemSize = CGSizeMake(itemWidth1,itemHeight1);
    //    //定义每个UICollectionView 横向的间距
    flowLayout1.minimumLineSpacing = LENGTH(21);
    //    //定义每个UICollectionView 纵向的间距
    flowLayout1.minimumInteritemSpacing = 0;
    //    //定义每个UICollectionView 的边距距
    flowLayout1.sectionInset = UIEdgeInsetsMake(0, LENGTH(27), 0, LENGTH(27));//上左下右
    flowLayout1.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//
    packageCollectView = [[BuyPackageCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout1];
    [self addSubview:packageCollectView];
    [packageCollectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(0));
        make.top.equalTo(hytc.mas_bottom).with.offset(LENGTH(16));
        make.right.equalTo(ws).with.offset(LENGTH(0));
        make.height.mas_equalTo(itemHeight1);
    }];
    [packageCollectView setBuyStyle:^(BuyPackage * _Nonnull pack) {
        [ws updown:pack];
        ws.buyStyle(pack);
    }];
    downView = [BuyInvitationView new];
    [self addSubview:downView];
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->packageCollectView.mas_bottom).with.offset(LENGTH(10));
        make.bottom.mas_equalTo(ws);
        make.left.and.right.mas_equalTo(ws);
    }];
    [downView setBlocks:^(NSInteger inter) {
        [ws updatas:inter];
    }];
}
- (void)updown:(BuyPackage*)pack{
    downView.package = pack;
}
- (void)updatas:(NSInteger)inter{
    if (inter == 0) {
        packageCollectView.itemarray = dnaciarray;
        for (NSInteger i = 0 ; i < dnaciarray.count; i++) {
            BuyPackage * mo = dnaciarray[i];
            if (mo.click == 1) {
                downView.package = mo;
            }
        }
    }else{
        packageCollectView.itemarray = zidongarray;
        for (NSInteger i = 0 ; i < zidongarray.count; i++) {
            BuyPackage * mo = zidongarray[i];
            if (mo.click == 1) {
                downView.package = mo;
            }
        }
    }
}
- (void)NavLeftClick{
    [[self viewController].navigationController popViewControllerAnimated:YES];
}

//使用帮助
- (void)sybzClick{
    AgreementViewController * vc = [AgreementViewController new];
    vc.titl = @"常见问题";
    vc.url = @"http://tiantianaidu.com/app_help/member_help.html";
    [[self viewController].navigationController pushViewController:vc animated:YES];
}

- (void)setModel:(BuyAllModel *)model{
    _model = model;
    [touxiang sd_setImageWithURL:URLIMAGE(model.student.avatar) placeholderImage:UIIMAGE(@"头像-大")];
    name.text = model.student.name;
    if (model.student.is_member == 0) {
        huiyuanzt.text = @"未开通";
        Duetime.text = @"开通会员畅游在知识的海洋";
    }else{
        huiyuanzt.text = @"已开通";
        Duetime.text = [NSString stringWithFormat:@"到期时间：%ld年-%ld月-%ld日",model.student.end_time.year,model.student.end_time.month,model.student.end_time.day];
    }
    
    zidongarray = [NSMutableArray array];
    dnaciarray = [NSMutableArray array];
    int a = 0;
    int b = 0;
    for (PackageTypeModel * typemodel in model.productInfoIos) {
        for (BuyPackage * package in typemodel.discount) {
            package.name = typemodel.price_name;
            if (package.is_default == 1) {
                package.yj = typemodel.price;
                package.price_times = typemodel.price_times;
//                if (typemodel.price_times == 3) {
//                    package.click = 1;
//                }
                if (package.is_renew == 1) {
                    if (typemodel.price_times == 3 && a == 0) {
                        a = 1;
                        package.click = 1;
                    }
                    package.sfzdxf = 1;
                    [zidongarray addObject:package];
                }else if (package.is_renew == 2){
                    if (typemodel.price_times == 3 && b == 0) {
                        b = 1;
                        package.click = 1;
                    }
                    [dnaciarray addObject:package];
                }
            }
        }
    }
//    if (packageCollectView.itemarray== nil) {
        packageCollectView.itemarray = dnaciarray;
//    }
    downView.model = model;
    for (NSInteger i = 0 ; i < dnaciarray.count; i++) {
        BuyPackage * mo = dnaciarray[i];
        if (mo.click == 1) {
            downView.package = mo;
        }
    }
}
@end
