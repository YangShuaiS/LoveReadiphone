//
//  SZorSCView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "SZorSCView.h"
#import "DTTiMuView.h"
#import "SZOrSCJieGuoViewController.h"
#import "DTDownLasOrNextView.h"
#define itemWidth LENGTH(103)
#define itemHeight LENGTH(103)
@interface SZorSCView()<DtDownDelegate>
@end
@implementation SZorSCView{
    BaseView * tiMu;
    BaseLabel * title;
    FLAnimatedImageView * tiMuImage;
    DTDownLasOrNextView * downView;
    CAShapeLayer *border;
    
    FLAnimatedImageView * nexttopic;
    
    FLAnimatedImageView *RJOrFanHuiBookCity;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addView];
        
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    border.cornerRadius = LENGTH(10);
    //虚线的颜色
    border.strokeColor = [UIColor whiteColor].CGColor;
    //填充的颜色
    border.fillColor = [UIColor clearColor].CGColor;
    
    //设置路径
    //    border.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    border.path = [UIBezierPath bezierPathWithRoundedRect:tiMu.bounds cornerRadius:LENGTH(10)].CGPath;
    
    border.frame = tiMu.bounds;
    //虚线的宽度
    border.lineWidth = 1.f;
    
    //设置线条的样式
    //    border.lineCap = @"square";
    //虚线的间隔
    border.lineDashPattern = @[@4, @2];
    
    [tiMu.layer addSublayer:border];
}
- (void)addView{
    WS(ws);
    border = [CAShapeLayer layer];
    tiMu = [BaseView new];
    tiMu.layer.masksToBounds = YES;
    tiMu.layer.cornerRadius = LENGTH(20);
    tiMu.backgroundColor = RGB(32,186,242);
    [self addSubview:tiMu];
    [tiMu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(41)+NavHeight);
        make.left.equalTo(ws).with.offset(LENGTH(15));
        make.right.equalTo(ws).with.offset(-LENGTH(15));
    }];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentLeft Text:@""];
    title.numberOfLines = 0;
    [tiMu addSubview:title];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->tiMu.mas_top).with.offset(LENGTH(14));
        make.right.equalTo(self->tiMu.mas_right).with.offset(-LENGTH(18));
        make.left.equalTo(self->tiMu.mas_left).with.offset(LENGTH(18));
        make.bottom.equalTo(self->tiMu.mas_bottom).with.offset(-LENGTH(14));
    }];
    
    tiMuImage = [FLAnimatedImageView new];
    tiMuImage.image = UIIMAGE(ZHANWEITU);
    tiMuImage.layer.masksToBounds= YES;
    tiMuImage.layer.cornerRadius = LENGTH(10);
    [self addSubview:tiMuImage];
    [tiMuImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(42)+NavHeight);
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(180));
        make.height.mas_equalTo(LENGTH(180));

    }];
    tiMu.hidden = YES;
    tiMuImage.hidden = YES;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(25);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(25);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectView = [[SzScXuanXiangCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:_collectView];
    [_collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->tiMu.mas_bottom).with.offset(LENGTH(30));
        make.centerX.mas_equalTo(ws);
        make.height.mas_equalTo(itemHeight*2+LENGTH(25));
        make.width.mas_equalTo(itemHeight*2+LENGTH(25));
    }];
    
    nexttopic = [FLAnimatedImageView new];
    nexttopic.image = UIIMAGE(@"icon_下一题");
    [self addSubview:nexttopic];
    [nexttopic mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(ws.collectView.mas_bottom).with.offset(LENGTH(40));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(104));
        make.height.mas_equalTo(LENGTH(44));
        make.bottom.equalTo(ws).with.offset(-LENGTH(42));

    }];
    
    BaseLabel * Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"下一题"];
    Title.numberOfLines = 0;
    [nexttopic addSubview:Title];
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->nexttopic);
    }];
    nexttopic.userInteractionEnabled = YES;
    
    //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nexttopic)];
    //将手势添加到需要相应的view中去
    [nexttopic addGestureRecognizer:tapGesture1];
    
    
    
    
    
//    downView = [DTDownLasOrNextView new];
//    downView.delegate = self;
//    downView.dtdownstyle = DTStyleWithOneNext;
//    [self addSubview:downView];
//    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->collectView.mas_bottom).with.offset(LENGTH(80));
//        make.left.equalTo(ws).with.offset(0);
//        make.right.equalTo(ws).with.offset(0);
//    }];
    
    RJOrFanHuiBookCity = [FLAnimatedImageView new];
    RJOrFanHuiBookCity.backgroundColor = RGB(34,202,255);
    RJOrFanHuiBookCity.layer.masksToBounds = YES;
    RJOrFanHuiBookCity.layer.cornerRadius = LENGTH(22);
    RJOrFanHuiBookCity.layer.borderWidth = 1;
    RJOrFanHuiBookCity.layer.borderColor = [UIColor whiteColor].CGColor;
    [self addSubview:RJOrFanHuiBookCity];
    RJOrFanHuiBookCity.hidden = YES;
    [RJOrFanHuiBookCity mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(ws.collectView.mas_bottom).with.offset(LENGTH(40));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(104));
        make.height.mas_equalTo(LENGTH(44));
        make.bottom.equalTo(ws).with.offset(-LENGTH(42));
    }];
    
    BaseLabel * Titles = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"提交答案"];
    [RJOrFanHuiBookCity addSubview:Titles];
    [Titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->RJOrFanHuiBookCity );
    }];
    RJOrFanHuiBookCity.userInteractionEnabled = YES;
    //添加手势
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BackBookList)];
    //将手势添加到需要相应的view中去
    [RJOrFanHuiBookCity addGestureRecognizer:tapGesture2];
}
- (void)nexttopic{
    PushModel * model = [PushModel new];
    model.style = DaTiTiaoCHuanXiaYiTi;
    [self.delegate PushFriendViewCOntroller:model];

}
- (void)BackBookList{
    PushModel * model = [PushModel new];
    model.style = PushDaTiJieGuo;
    [self.delegate PushFriendViewCOntroller:model];
//    SZOrSCJieGuoViewController * vc = [SZOrSCJieGuoViewController new];
//    vc.titles = _titles;
//    [self.nav pushViewController:vc animated:YES];
}
- (void)setDtdownstyle:(DtLastOrNext)dtdownstyle{
    _dtdownstyle = dtdownstyle;
    switch (dtdownstyle) {
        case DTStyleWithOneNext:
            nexttopic.hidden = NO;
            RJOrFanHuiBookCity.hidden = YES;
            break;
        case DTStyleWithPushUp:
            nexttopic.hidden = YES;
            RJOrFanHuiBookCity.hidden = NO;

            break;
        default:
            break;
    }
}


- (void)setScorci:(SCLListMOdel *)scorci{
    WS(ws);
    _scorci = scorci;
    NSMutableArray * array = [NSMutableArray array];
    if (![scorci.vocabulary1 isEqualToString:@""]) {
        [array addObject:scorci.vocabulary1];
    }
    if (![scorci.vocabulary2 isEqualToString:@""]) {
        [array addObject:scorci.vocabulary2];
    }
    if (![scorci.vocabulary3 isEqualToString:@""]) {
        [array addObject:scorci.vocabulary3];
    }
    if (![scorci.vocabulary4 isEqualToString:@""]) {
        [array addObject:scorci.vocabulary4];
    }
    array = (NSMutableArray *)[array sortedArrayUsingComparator:(NSComparator)^(id obj1, id obj2) {
        return (arc4random() % 3) - 1;
    }];
    if (scorci.type == 1) {
        tiMu.hidden = YES;
        tiMuImage.hidden = NO;
        [tiMuImage sd_setImageWithURL:URLIMAGE(scorci.picture) placeholderImage:UIIMAGE(ZHANWEITU)];
        [_collectView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->tiMuImage.mas_bottom).with.offset(LENGTH(30));
            make.centerX.mas_equalTo(ws);
            make.height.mas_equalTo(itemHeight*2+LENGTH(25));
            make.width.mas_equalTo(itemHeight*2+LENGTH(25));
        }];
    }else{
        tiMu.hidden = NO;
        tiMuImage.hidden = YES;
        title.text = scorci.meaning;
        [_collectView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->tiMu.mas_bottom).with.offset(LENGTH(30));
            make.centerX.mas_equalTo(ws);
            make.height.mas_equalTo(itemHeight*2+LENGTH(25));
            make.width.mas_equalTo(itemHeight*2+LENGTH(25));
        }];
    }
    _collectView.itemarray = array;
}

- (void)setSzorci:(ShiZiLiangModel *)szorci{
    WS(ws);
    _szorci = szorci;
    NSMutableArray * array = [NSMutableArray array];
    [array addObjectsFromArray:szorci.FakeWord];
    array = (NSMutableArray *)[array sortedArrayUsingComparator:(NSComparator)^(id obj1, id obj2) {
        return (arc4random() % 3) - 1;
    }];
    if ([szorci.LiteracyMeaning isEqualToString:@""]) {
        tiMu.hidden = YES;
        tiMuImage.hidden = NO;
        [tiMuImage sd_setImageWithURL:URLIMAGE(szorci.LiteracyPicture) placeholderImage:UIIMAGE(ZHANWEITU)];
        [_collectView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->tiMuImage.mas_bottom).with.offset(LENGTH(30));
            make.centerX.mas_equalTo(ws);
            make.height.mas_equalTo(itemHeight*2+LENGTH(25));
            make.width.mas_equalTo(itemHeight*2+LENGTH(25));
        }];
    }else{
        tiMu.hidden = NO;
        tiMuImage.hidden = YES;
        title.text = szorci.LiteracyMeaning;
        [_collectView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->tiMu.mas_bottom).with.offset(LENGTH(30));
            make.centerX.mas_equalTo(ws);
            make.height.mas_equalTo(itemHeight*2+LENGTH(25));
            make.width.mas_equalTo(itemHeight*2+LENGTH(25));
        }];
    }
    _collectView.itemarray = array;
}

- (void)DtDownClick:(PushModel *)model{
    [self.delegate PushFriendViewCOntroller:model];

}


@end
