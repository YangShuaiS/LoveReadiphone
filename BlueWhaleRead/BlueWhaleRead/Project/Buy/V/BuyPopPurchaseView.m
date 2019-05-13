//
//  BuyPopPurchaseView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/28.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyPopPurchaseView.h"
#import "BuyInterestsCollectionView.h"
#import "BuyMembersViewController.h"
#define itemWidth LENGTH(44)
#define itemHeight LENGTH(54)
@implementation BuyPopPurchaseView{
    BuyInterestsCollectionView *collectView;

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
    UIView * allview = [UIView new];
    allview.backgroundColor = RGBA(0x00, 0x00, 0x00, 0.6);
    allview.userInteractionEnabled = YES;
    [self addSubview:allview];
    [allview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xiaoshi)];
    [allview addGestureRecognizer:tap];
    
    UIView * backView = [UIView new];
    backView.backgroundColor = [UIColor clearColor];
    backView.userInteractionEnabled = YES;
    backView.layer.masksToBounds = YES;
    backView.layer.cornerRadius = LENGTH(10);
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
    }];
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wushijian)];
    [backView addGestureRecognizer:tap1];
    
    UIView * downView = [UIView new];
    downView.backgroundColor = RGB(203,171,117);
    downView.layer.cornerRadius = LENGTH(10);
    downView.layer.masksToBounds = YES;
    [backView addSubview:downView];
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backView).with.offset(LENGTH(81));
        make.left.and.right.and.bottom.mas_equalTo(backView);
        make.size.mas_equalTo(CGSizeMake(LENGTH(270), LENGTH(215)));
    }];
    
    UIView * CenterView = [UIView new];
    CenterView.backgroundColor = RGB(255, 255, 255);
    CenterView.layer.cornerRadius = LENGTH(10);
    CenterView.userInteractionEnabled = YES;
    CenterView.layer.masksToBounds = YES;
    [backView addSubview:CenterView];
    [CenterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backView);
        make.left.mas_equalTo(backView).with.offset(LENGTH(11));
        make.right.mas_equalTo(backView).with.offset(-LENGTH(11));
        make.height.mas_equalTo(LENGTH(160));
    }];
    
    BaseLabel * title = [[BaseLabel alloc] initWithTxteColor:RGB(30, 30, 30) LabelFont:TextFontCu(15) TextAlignment:NSTextAlignmentCenter Text:@"博万卷会员权益"];
    [CenterView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(CenterView);
        make.top.mas_equalTo(CenterView).with.offset(LENGTH(20));
        make.height.mas_equalTo(LENGTH(15));
    }];
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
    //    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(12);
    //    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(12);
    //    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(16), 0, LENGTH(16));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[BuyInterestsCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [CenterView addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(CenterView).with.offset(LENGTH(0));
        make.top.equalTo(title.mas_bottom).with.offset(LENGTH(14));
        make.right.equalTo(CenterView).with.offset(LENGTH(0));
        make.height.mas_equalTo(itemHeight);
    }];
    NSMutableArray * nuyintererarray = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
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
    
    UIImageView * rightImage = [UIImageView new];
    rightImage.contentMode = UIViewContentModeScaleAspectFit;
    rightImage.image = UIIMAGE(@"更多");
    [CenterView addSubview:rightImage];
    [rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(CenterView).with.offset(-LENGTH(17));
        make.top.mas_equalTo(self->collectView.mas_bottom).with.offset(LENGTH(20));
        make.size.mas_equalTo(CGSizeMake(LENGTH(6), LENGTH(9)));
    }];
    rightImage.userInteractionEnabled = YES;

    
    BaseLabel * moreqy = [[BaseLabel alloc] initWithTxteColor:RGB(165,136,87) LabelFont:TextFontCu(11) TextAlignment:NSTextAlignmentRight Text:@"更多权益"];
    [CenterView addSubview:moreqy];
    [moreqy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(rightImage);
        make.right.mas_equalTo(rightImage.mas_left).with.offset(-LENGTH(3));
    }];
    moreqy.userInteractionEnabled = NO;

    
    UIImageView * downimage = [UIImageView new];
    downimage.contentMode = UIViewContentModeScaleAspectFill;
    downimage.image = UIIMAGE(@"组15");
    [backView addSubview:downimage];
    [downimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.mas_equalTo(backView);
        make.height.mas_equalTo(LENGTH(177));
    }];
    
    UIView * morequanyiclick = [UIView new];
    morequanyiclick.userInteractionEnabled = YES;
    [backView addSubview:morequanyiclick];
    [morequanyiclick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(rightImage);
        make.left.mas_equalTo(moreqy);
        make.right.mas_equalTo(CenterView);
        make.height.mas_equalTo(LENGTH(40));
    }];
    UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(morequanyiclick)];
    [morequanyiclick addGestureRecognizer:tap2];
    

    
    BaseLabel * Centertitle = [[BaseLabel alloc] initWithTxteColor:RGB(125,99,56) LabelFont:TextFontCu(15) TextAlignment:NSTextAlignmentCenter Text:@"加入博万卷知识会员\n全场内容免费畅读"];
    Centertitle.numberOfLines = 2;
    [downimage addSubview:Centertitle];
    [Centertitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(downimage);
        make.top.mas_equalTo(downimage).with.offset(LENGTH(46));
    }];
    
    UIView * downClick = [UIView new];
    downClick.backgroundColor = [UIColor whiteColor];
    downClick.layer.masksToBounds = YES;
    downClick.layer.cornerRadius = LENGTH(19);
    [downimage addSubview:downClick];
    [downClick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(downimage);
        make.top.mas_equalTo(Centertitle.mas_bottom).with.offset(LENGTH(10));
        make.left.mas_equalTo(downimage).with.offset(LENGTH(32));
        make.right.mas_equalTo(downimage).with.offset(-LENGTH(32));
        make.height.mas_equalTo(LENGTH(38));
    }];
    
    UIView * downnr = [UIView new];
    [downClick addSubview:downnr];
    [downnr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(downClick);
    }];
    downimage.userInteractionEnabled = YES;
    downClick.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(downnrclick)];
    [downClick addGestureRecognizer:tap3];
    
    UIImageView * hgimage = [UIImageView new];
    hgimage.contentMode = UIViewContentModeScaleAspectFit;
    hgimage.image = UIIMAGE(@"皇冠-1");
    [downnr addSubview:hgimage];
    [hgimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(downnr);
        make.centerY.mas_equalTo(downnr);
        make.size.mas_equalTo(CGSizeMake(LENGTH(21), LENGTH(13)));
    }];
    
    BaseLabel * kthy = [[BaseLabel alloc] initWithTxteColor:RGB(132,106,62) LabelFont:TextFontCu(17) TextAlignment:NSTextAlignmentCenter Text:@"开通会员"];
    [downnr addSubview:kthy];
    [kthy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.mas_equalTo(downnr);
        make.left.mas_equalTo(hgimage.mas_right).with.offset(LENGTH(6));
        make.right.mas_equalTo(downnr);
    }];
    
    BaseLabel * downlabel = [[BaseLabel alloc] initWithTxteColor:RGB(132,106,62) LabelFont:TextFontCu(13) TextAlignment:NSTextAlignmentCenter Text:@"邀请好友免费得季度会员"];
    [downimage addSubview:downlabel];
    [downlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(downimage);
        make.top.mas_equalTo(downClick.mas_bottom).with.offset(LENGTH(15));
        make.height.mas_equalTo(LENGTH(13));
    }];
    
    UIView * leftlabelView = [UIView new];
    leftlabelView.backgroundColor = RGB(132,106,62);
    [downimage addSubview:leftlabelView];
    [leftlabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(downlabel);
        make.right.mas_equalTo(downlabel.mas_left).with.offset(-LENGTH(7));
        make.size.mas_equalTo(CGSizeMake(LENGTH(30), 1));
    }];
    
    UIView * rightlabelView = [UIView new];
    rightlabelView.backgroundColor = RGB(132,106,62);
    [downimage addSubview:rightlabelView];
    [rightlabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(downlabel);
        make.left.mas_equalTo(downlabel.mas_right).with.offset(LENGTH(7));
        make.size.mas_equalTo(CGSizeMake(LENGTH(30), 1));
    }];
}
- (void)xiaoshi{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        self.remove();
    }];
}
- (void)wushijian{
    
}

- (void)morequanyiclick{
    BuyMembersViewController * vc = [BuyMembersViewController new];
    [self.nav pushViewController:vc animated:YES];
    [self removeFromSuperview];
    self.remove();
}

- (void)downnrclick{
    BuyMembersViewController * vc = [BuyMembersViewController new];
    [self.nav pushViewController:vc animated:YES];
    [self removeFromSuperview];
    self.remove();
}
@end
