//
//  MedalListCellView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalListCellView.h"
#import "FiendOrMedalView.h"
#import "GeneralMedalView.h"

@implementation MedalListCellView{
    FLAnimatedImageView * backImage;
    BaseLabel * subtitle;
    FiendOrMedalView * touxiang;
    GeneralMedalView * MedalView;
    BaseLabel * noshuju;
    FLAnimatedImageView * TXImage;
    
    BaseView * backView;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    WS(ws);

    self.backgroundColor = [UIColor clearColor];
    self.layer.masksToBounds = YES;
    backView = [BaseView new];
    backView.layer.masksToBounds = YES;
    backView.backgroundColor = WhitColor;
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).mas_equalTo(LENGTH(10));
        make.left.mas_equalTo(ws).mas_equalTo(LENGTH(15));
        make.right.mas_equalTo(ws).mas_equalTo(-LENGTH(15));
        make.bottom.mas_equalTo(ws).mas_equalTo(0);
    }];
    
    backImage = [FLAnimatedImageView new];
    backImage.image = UIIMAGE(ZHANWEITUSHU);
    backImage.layer.masksToBounds = YES;
//    backImage.layer.cornerRadius = LENGTH(5);
    [backView addSubview:backImage];
    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->backView.mas_top).with.offset(0);
        make.left.equalTo(self->backView.mas_left).with.offset(0);
        make.right.equalTo(self->backView.mas_right).with.offset(0);
        make.height.equalTo(self->backImage.mas_width).multipliedBy(0.2175877);
    }];
    
//    [backImage layoutIfNeeded];
    
//    UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    UIVisualEffectView *mohu = [[UIVisualEffectView alloc] initWithEffect:beffect];
//    [backImage addSubview:mohu];
//    [mohu mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self->backImage);
//    }];
    
    MedalView = [GeneralMedalView new];
    MedalView.upjl = LENGTH(6);
    [backView addSubview:MedalView];
    [MedalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self->backImage);
        make.width.mas_equalTo(LENGTH(70));
        make.height.mas_equalTo(LENGTH(70));
    }];
    
    
    TXImage = [FLAnimatedImageView new];
    TXImage.image = UIIMAGE(@"icon_点亮人数");
    [backView addSubview:TXImage];
    [TXImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->backImage.mas_bottom).with.offset(LENGTH(24));
        make.left.equalTo(self->backView.mas_left).with.offset(LENGTH(15));
        make.width.mas_equalTo(LENGTH(self->TXImage.image.size.width));
        make.height.mas_equalTo(LENGTH(self->TXImage.image.size.height));
        make.bottom.equalTo(self->backView.mas_bottom).with.offset(-LENGTH(18));
    }];

    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@""];
    [backView addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->TXImage.mas_right).with.offset(LENGTH(4));
        make.right.equalTo(self->backView.mas_right).with.offset(-LENGTH(100));
        make.centerY.mas_equalTo(self->TXImage.mas_centerY);
    }];
    
    noshuju = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@""];
    [backView addSubview:noshuju];
    [noshuju mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->backView.mas_left).with.offset(LENGTH(4));
        make.right.equalTo(self->backView.mas_right).with.offset(-LENGTH(4));
        make.centerY.mas_equalTo(self->TXImage.mas_centerY);
    }];

    
//    BaseView * touxiangview = [BaseView new];
//    //    touxiangview.backgroundColor = RANDOMCOLOR;
//    [self addSubview:touxiangview];
//
//    [touxiangview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->backImage.mas_bottom).with.offset(LENGTH(10));
//        make.right.equalTo(ws).with.offset(-LENGTH(23));
//        make.height.mas_equalTo(LENGTH(26));
//    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(LENGTH(24),LENGTH(38));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(7);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(7);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    touxiang = [[FiendOrMedalView alloc] initWithLayOut:flowLayout];
    [touxiang BanSliding];
//    touxiang.foundinter = 4;
    [self addSubview:touxiang];
    [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->backImage.mas_bottom).with.offset(LENGTH(10));
        make.right.equalTo(self->backView.mas_right).with.offset(-LENGTH(11));
        make.height.mas_equalTo(LENGTH(38));
        
    }];

}
- (void)setNav:(UINavigationController *)nav{
    touxiang.nav = nav;
}

- (void)setModel:(MedalBadgeListModel *)model{
    _model = model;
//    [backImage sd_setImageWithURL:URLIMAGE(model.logo) placeholderImage:UIIMAGE(@"bg_勋章背景_勋章列表")];
    backImage.image = UIIMAGE(@"bg_勋章背景_勋章列表");
    if ([model.getBadgeNum isEqualToString:@"0"]&&[model.badgeNum isEqualToString:@"0"]) {
        TXImage.hidden = YES;
        subtitle.hidden = YES;
        noshuju.hidden = NO;
        noshuju.text =@"快来成为第一个点亮勋章的同学吧！";
        
    }else{
        TXImage.hidden = NO;
        noshuju.hidden = YES;
        subtitle.hidden = NO;
        subtitle.text = [NSString stringWithFormat:@"%@人已点亮 %@人点亮中",model.getBadgeNum,model.badgeNum];
    }
    touxiang.itemarray = model.studentList;
    MedalView.model = model;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self->backView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(LENGTH(5), LENGTH(5))];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self->backView.bounds;
    maskLayer.path = maskPath.CGPath;
    self->backView.layer.mask = maskLayer;
}
@end
