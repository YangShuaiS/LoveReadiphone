//
//  TKJUpView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKJUpView.h"
#import "TKJUserImageView.h"
#import "TKJMenu.h"
#import "TPHBViewController.h"
#import "TKAwardViewController.h"
#import "TKMytaskViewController.h"
@implementation TKJUpView{
    UIScrollView * scrollView;
    TKJUserImageView * one;
    UIImageView * onejp;
    
    TKJUserImageView * two;
    UIImageView * twojp;
    
    TKJUserImageView * three;
    UIImageView * threejp;
    
    BaseLabel * more;
    TPHBViewController * hotview;
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
- (void)addview{
    self.backgroundColor = RGBA(0, 0, 0, 0.5);
    WS(ws);
    scrollView = [UIScrollView new];
    scrollView.userInteractionEnabled = YES;
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    UIImageView * oneimageview = [UIImageView new];
    oneimageview.image = UIIMAGE(@"NO1");
    oneimageview.contentMode = UIViewContentModeScaleAspectFit;
    [scrollView addSubview:oneimageview];
    [oneimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(self->scrollView).with.offset(LENGTH(23)+StatusBar);
        make.width.mas_equalTo(LENGTH(65));
        make.height.mas_equalTo(LENGTH(32));
    }];
    
    one = [TKJUserImageView new];
    one.inter = 1;
    [scrollView addSubview:one];
    [one mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(oneimageview);
        make.top.mas_equalTo(oneimageview.mas_bottom);
    }];
    
    onejp = [UIImageView new];
//    onejp.image = UIIMAGE(@"车");
    onejp.contentMode = UIViewContentModeScaleAspectFit;
    [scrollView addSubview:onejp];
    [onejp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->one.mas_bottom).with.offset(LENGTH(10));
        make.width.mas_equalTo(ws).multipliedBy(0.3333333);
        make.centerX.mas_equalTo(oneimageview);
    }];
    
    UIImageView * twoimageview = [UIImageView new];
    twoimageview.image = UIIMAGE(@"NO2");
    twoimageview.contentMode = UIViewContentModeScaleAspectFit;
    [scrollView addSubview:twoimageview];
    [twoimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws).with.offset(-WIDTH/3);
        make.top.mas_equalTo(oneimageview.mas_bottom).with.offset(LENGTH(35));
        make.width.mas_equalTo(LENGTH(57));
        make.height.mas_equalTo(LENGTH(28));
    }];
    
    two = [TKJUserImageView new];
    two.inter = 2;
    [scrollView addSubview:two];
    [two mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(twoimageview);
        make.top.mas_equalTo(twoimageview.mas_bottom);
    }];
    
    twojp = [UIImageView new];
//    twojp.image = UIIMAGE(@"车");
    twojp.contentMode = UIViewContentModeScaleAspectFit;
    [scrollView addSubview:twojp];
    [twojp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->two.mas_bottom).with.offset(LENGTH(10));
        make.width.mas_equalTo(ws).multipliedBy(0.3333333);
        make.centerX.mas_equalTo(twoimageview);
    }];
    
    UIImageView * threeimageview = [UIImageView new];
    threeimageview.image = UIIMAGE(@"NO3");
    threeimageview.contentMode = UIViewContentModeScaleAspectFit;
    [scrollView addSubview:threeimageview];
    [threeimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws).with.offset(WIDTH/3);
        make.top.mas_equalTo(oneimageview.mas_bottom).with.offset(LENGTH(35));
        make.width.mas_equalTo(LENGTH(53));
        make.height.mas_equalTo(LENGTH(25));
    }];
    
    three = [TKJUserImageView new];
    three.inter = 3;
    [scrollView addSubview:three];
    [three mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(threeimageview);
        make.top.mas_equalTo(threeimageview.mas_bottom);
    }];
    
    threejp = [UIImageView new];
//    threejp.image = UIIMAGE(@"车");
    threejp.contentMode = UIViewContentModeScaleAspectFit;
    [scrollView addSubview:threejp];
    [threejp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->three.mas_bottom).with.offset(LENGTH(10));
        make.width.mas_equalTo(ws).multipliedBy(0.3333333);
        make.centerX.mas_equalTo(threeimageview);
    }];
    
    FLAnimatedImageView * hezi = [FLAnimatedImageView new];
    hezi.contentMode = UIViewContentModeScaleAspectFit;
    hezi.image = UIIMAGE(@"图层1594");
    [scrollView addSubview:hezi];
    [hezi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->onejp.mas_bottom).with.offset(LENGTH(14));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(90));
        make.height.mas_equalTo(LENGTH(55));
    }];
    
    UIView * clickview = [UIView new];
    clickview.backgroundColor = RGB(255,91,40);
    clickview.layer.cornerRadius = LENGTH(22);
    clickview.layer.masksToBounds = YES;
    [scrollView addSubview:clickview];
    [clickview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(hezi.mas_bottom).with.offset(LENGTH(32));
        make.centerX.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(44));
    }];
    
    BaseLabel * ck = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(19) TextAlignment:NSTextAlignmentLeft Text:@"去领奖"];
    [clickview addSubview:ck];
    [ck mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.mas_equalTo(clickview);
        make.left.mas_equalTo(clickview).with.offset(LENGTH(29));
    }];
    
    UIImageView * jiantou = [UIImageView new];
    jiantou.contentMode = UIViewContentModeScaleAspectFit;
    jiantou.image = UIIMAGE(@"组110");
    [self addSubview:jiantou];
    [jiantou mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(clickview);
        make.left.mas_equalTo(ck.mas_right).with.offset(LENGTH(5));
        make.right.mas_equalTo(clickview).with.offset(-LENGTH(27));
        make.width.mas_equalTo(LENGTH(21));
        make.height.mas_equalTo(LENGTH(19));
    }];
    
    TKJMenu * homeMenu = [TKJMenu new];
    homeMenu.titarray = @[[NSString stringWithFormat:@"第%@期排行榜",_model.periods_num]];
    [scrollView addSubview:homeMenu];
    [homeMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(20));
        make.right.equalTo(ws).with.offset(-LENGTH(20));
        make.top.equalTo(clickview.mas_bottom).with.offset(LENGTH(28));
        make.bottom.mas_equalTo(self->scrollView).with.offset(-LENGTH(20));
        make.height.mas_equalTo(LENGTH(543));
    }];
    NSMutableArray *childVC = [[NSMutableArray alloc] init];
    hotview = [[TPHBViewController alloc] init];
    //    hotview.bookCase = BookCaseStyleSJWD;
    [[self viewController] addChildViewController:hotview];
    [childVC addObject:hotview];
    homeMenu.controllerArray = childVC;
    
    more = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"查看往期 >>"];
    [scrollView addSubview:more];
    [more mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(clickview.mas_bottom).with.offset(LENGTH(37));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(22));
    }];
    // 下划线
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:more.text attributes:attribtDic];
    
    //赋值
    more.attributedText = attribtStr;

    more.userInteractionEnabled = YES;
    UITapGestureRecognizer * taps = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gengduo)];
    //将手势添加到需要相应的view中去
    [more addGestureRecognizer:taps];
    
    FLAnimatedImageView * imageview = [FLAnimatedImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.image = UIIMAGE(@"组120");
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(StatusBar+LENGTH(5));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(22));
        make.width.and.height.mas_equalTo(LENGTH(42));
    }];
    
    imageview.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shanchu)];
    //将手势添加到需要相应的view中去
    [imageview addGestureRecognizer:tap];
    
    clickview.userInteractionEnabled = YES;
    UITapGestureRecognizer * ljtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ljtap)];
    //将手势添加到需要相应的view中去
    [clickview addGestureRecognizer:ljtap];
    
    [hotview setBlock:^{
        [ws removeFromSuperview];
    }];
}

- (void)shanchu{
    [self removeFromSuperview];
}

- (void)gengduo{
    TKMytaskViewController * vc = [TKMytaskViewController new];
    
    [self.nav pushViewController:vc animated:YES];
    [self removeFromSuperview];
}
- (void)ljtap{
    TKAwardViewController * vc = [TKAwardViewController new];
    [self.nav pushViewController: vc animated:YES];
    [self removeFromSuperview];
}
- (void)setModel:(TKXSTaskXQModel *)model{
    _model = model;
    [self addview];
    
    one.allinter = [model.first_prize_num integerValue];
    two.allinter = [model.second_prize_num integerValue];
    three.allinter = [model.third_prize_num integerValue];
    
    TKXSHJPeopleModel * modelone =model.prizeList[0];
    TKXSHJPeopleModel * modetwo =model.prizeList[1];
    TKXSHJPeopleModel * modethree =model.prizeList[2];
    one.model = modelone;
    two.model = modetwo;
    three.model = modethree;
    NSMutableArray * oneitemarray = [NSMutableArray array];
    NSMutableArray * twoitemarray = [NSMutableArray array];
    NSMutableArray * threeitemarray = [NSMutableArray array];
    for (int i = 0; i < model.studentRankList.count; i++) {
        TKXSHJPeopleModel * models = model.studentRankList[i];
        if (i < [model.first_prize_num integerValue]) {
            [oneitemarray addObject:models];
        }else if (i < [model.second_prize_num integerValue]+[model.first_prize_num integerValue]){
            [twoitemarray addObject:models];
        }else if (i < [model.third_prize_num integerValue]+[model.second_prize_num integerValue]+[model.first_prize_num integerValue]){
            [threeitemarray addObject:models];
        }else{
            break;
        }
    }
    one.itemArray = oneitemarray;
    two.itemArray = twoitemarray;
    three.itemArray = threeitemarray;
    
    CGFloat wwight = WIDTH*0.3333333;
    [onejp sd_setImageWithURL:URLIMAGE(modelone.prize_img) completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (image!=nil) {
            CGFloat bili = wwight/image.size.width;
            CGFloat height = image.size.height*bili;
            [self->onejp mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(height);
            }];
        }
 
    }];
    [twojp sd_setImageWithURL:URLIMAGE(modetwo.prize_img) completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (image!=nil) {
        CGFloat bili = wwight/image.size.width;
        CGFloat height = image.size.height*bili;
        [self->twojp mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(height);
        }];
        }
    }];
    
    [threejp sd_setImageWithURL:URLIMAGE(modethree.prize_img) completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (image!=nil) {
        CGFloat bili = wwight/image.size.width;
        CGFloat height = image.size.height*bili;
        [self->threejp mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(height);
        }];}
    }];
//    [onejp sd_setImageWithURL:URLIMAGE(modelone.prize_img)];
//    [twojp sd_setImageWithURL:URLIMAGE(modetwo.prize_img)];
//    [threejp sd_setImageWithURL:URLIMAGE(modethree.prize_img)];

    NSMutableArray * itemarray = model.studentRankList;
    if (model.student.myRank.length == 0 || ![model.student.myRank isEqualToString:@"0"]) {
        [itemarray insertObject:model.student atIndex:0];
        hotview.bianse = @"1";
    }
    hotview.nav = self.nav;
    hotview.missionid = @"1";
    hotview.itemarray = itemarray;
    
}
@end
