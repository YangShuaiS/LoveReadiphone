


//
//  MyClassCellView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyClassCellView.h"
#import "FiendOrMedalView.h"

#import "FriendViewController.h"
@implementation MyClassCellView{
    FLAnimatedImageView * paiming;
    BaseLabel * paiminglabel;
    FLAnimatedImageView * Touxiang;
    BaseLabel * name;
//    MyFriendHeadImaage * friendView;
    BaseLabel * jf;
    BaseLabel * ydl;
    BaseLabel * byydl;

    
    FiendOrMedalView * touxiang;

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
    paiming = [FLAnimatedImageView new];
    [self addSubview:paiming];
    [paiming mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(8));
        make.centerY.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(30));
        make.height.mas_equalTo(LENGTH(30));
    }];
    
    paiminglabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,175,89) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:paiminglabel];
    [paiminglabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(8));
        make.centerY.mas_equalTo(ws);

    }];
    paiming.hidden = YES;
    paiminglabel.hidden = YES;
    
    Touxiang = [FLAnimatedImageView new];
    Touxiang.image = UIIMAGE(ZHANWEITUTX);
    Touxiang.layer.masksToBounds = YES;
    Touxiang.layer.cornerRadius = LENGTH(30);
    [self addSubview:Touxiang];
    [Touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws.mas_centerY);
        make.left.mas_equalTo(ws).with.offset(LENGTH(45));
        make.width.mas_equalTo(LENGTH(60));
        make.height.mas_equalTo(LENGTH(60));
        make.top.mas_equalTo(ws).with.offset(LENGTH(16));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(16));

    }];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(18));
        make.left.mas_equalTo(self->Touxiang.mas_right).with.offset(LENGTH(6.5));
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(LENGTH(24),LENGTH(24));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = -LENGTH(5);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(0);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    touxiang = [[FiendOrMedalView alloc] initWithLayOut:flowLayout];
    [self addSubview:touxiang];
    jf = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:jf];
    [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->name.mas_bottom).with.offset(LENGTH(18));
        make.left.mas_equalTo(self->Touxiang.mas_right).with.offset(LENGTH(6 ));
        make.right.mas_equalTo(ws.mas_right).with.offset(-LENGTH(122));

//            make.width.mas_equalTo(8*LENGTH(40));
        make.height.mas_equalTo(LENGTH(24));
    }];
    
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.itemSize = CGSizeMake(LENGTH(20),LENGTH(20));
//    //定义每个UICollectionView 横向的间距
//    flowLayout.minimumLineSpacing = LENGTH(5);
//    //定义每个UICollectionView 纵向的间距
//    flowLayout.minimumInteritemSpacing = LENGTH(5);
//    //定义每个UICollectionView 的边距距
//    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(0), 0, LENGTH(0));//上左下右
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    
//    friendView = [[MyFriendHeadImaage alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
//    friendView.style = FriendHeadImage;
//    friendView.pushstyle = FriendPushXunZhang;
//    [self addSubview:friendView];
//    [friendView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->name.mas_bottom).with.offset(LENGTH(15));
//        make.left.mas_equalTo(self->Touxiang.mas_right).with.offset(LENGTH(28));
//        make.width.mas_equalTo(8*LENGTH(25));
//        make.height.mas_equalTo(LENGTH(20));
//    }];
//    
    

    [jf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.mas_right).with.offset(-LENGTH(120));
        make.top.mas_equalTo(ws.mas_top).with.offset(LENGTH(12));
//        make.right.mas_equalTo(ws.mas_right).with.offset(-LENGTH(6));
    }];
    
    
    ydl = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:ydl];
    [ydl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.mas_right).with.offset(-LENGTH(120));
        make.top.mas_equalTo(self->jf.mas_bottom).with.offset(LENGTH(5));
//        make.right.mas_equalTo(ws.mas_right).with.offset(-LENGTH(6));
    }];
    
    byydl = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:byydl];
    [byydl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.mas_right).with.offset(-LENGTH(120));
        make.top.mas_equalTo(self->ydl.mas_bottom).with.offset(LENGTH(5));
//        make.right.mas_equalTo(ws.mas_right).with.offset(-LENGTH(6));
    }];

    Touxiang.userInteractionEnabled = NO;
    UITapGestureRecognizer * tapTouxiang = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Touxiang)];
    [Touxiang addGestureRecognizer:tapTouxiang];
}
- (void)Touxiang{
//    FriendViewController * vc = [FriendViewController new];
//    vc.itemid = _model.ssid;
//    [self.nav pushViewController:vc animated:YES];
}
- (void)setModel:(MyClassModel *)model{
    _model = model;
    touxiang.nav = self.nav;

    UIImage * img;
    if (model.sex == 1) {
        img = UIIMAGE(ZHANWEITUTXN);
    }else{
        img = UIIMAGE(ZHANWEITUTXV);
    }
    [Touxiang sd_setImageWithURL:URLIMAGE(model.avatar) placeholderImage:img];
    NSString * na = model.name;
    NSString * lv = [NSString stringWithFormat:@"Lv%@",model.level];
    NSString * onetextstr = [NSString stringWithFormat:@"%@ %@",na,lv];
    AttributedStringModel * models = [AttributedStringModel new];
    models.textString = onetextstr;
    models.bianString = lv;
    models.fount = 18;
    models.color = RGB(251,143,37);
    NSArray * modelarray = @[models];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    name.attributedText = AttributedStr;
    
    NSString * jftitle = @"         积分：";
    NSString * jfall = model.score;
    NSString * jfstr = [NSString stringWithFormat:@"%@%@",jftitle,jfall];
    AttributedStringModel * jfmodel = [AttributedStringModel new];
    jfmodel.textString = jfstr;
    jfmodel.bianString = jfall;
    jfmodel.color = RGB(49,49,49);
    NSArray * jfarray = @[jfmodel];
    NSMutableAttributedString *AttributedjfStr = [BaseObject Attributed:jfarray];
    jf.attributedText = AttributedjfStr;
    
    
    NSString * ydltitle = @"   总阅读量：";
    NSString * ydlall = model.allReadNum;
    NSString * ydlstr = [NSString stringWithFormat:@"%@%@",ydltitle,ydlall];
    AttributedStringModel * ydlmodel = [AttributedStringModel new];
    ydlmodel.textString = ydlstr;
    ydlmodel.bianString = ydlall;
    ydlmodel.color = ChangYongTitLe;
    NSArray * ydlarray = @[ydlmodel];
    NSMutableAttributedString *AttributeydlStr = [BaseObject Attributed:ydlarray];
    ydl.attributedText = AttributeydlStr;
    ydl.text = ydlstr;
    
    NSString * byydltitle = @"本月阅读量：";
    NSString * byydlall = model.MonthReadNum;
    NSString * bydlstr = [NSString stringWithFormat:@"%@%@",byydltitle,byydlall];
    AttributedStringModel * byydlmodel = [AttributedStringModel new];
    byydlmodel.textString = bydlstr;
    byydlmodel.bianString = byydlall;
    byydlmodel.color = ChangYongTitLe;
    NSArray * byydlarray = @[byydlmodel];
    NSMutableAttributedString *byAttributeydlStr = [BaseObject Attributed:byydlarray];
    byydl.attributedText = byAttributeydlStr;
    
    NSMutableArray * arr =[NSMutableArray array];
    [arr addObjectsFromArray:model.studentBadgeList];
    touxiang.itemarray = arr;
    
    if ([model.MonthReadNum isEqualToString:@"0"]&&[model.allReadNum isEqualToString:@"0"]&&[model.score isEqualToString:@"0"]) {
        paiming.hidden = YES;
        paiminglabel.hidden = YES;
    }else{
        if (_paimings <= 3) {
            paiming.hidden = NO;
            paiminglabel.hidden = YES;
            if (_paimings == 1) {
                paiming.image = UIIMAGE(@"icon_我的班级_积分排名第一");
            }else if (_paimings == 2){
                paiming.image = UIIMAGE(@"icon_我的班级_积分排名第2");
            }
            else if (_paimings == 3){
                paiming.image = UIIMAGE(@"icon_我的班级_积分排名第3");
            }
        }else{
            paiming.hidden = YES;
            paiminglabel.hidden = NO;
            paiminglabel.text = [NSString stringWithFormat:@"%ld",_paimings];
        }
    }
}
- (void)setType:(NSInteger)type{
    _type = type;
    if (type == 0) {
        paiming.hidden = YES;
        paiminglabel.hidden = NO;
    }else{
        paiming.hidden = NO;
        paiminglabel.hidden = YES;
    }
}
- (void)setPaimings:(NSInteger)paimings{
    _paimings = paimings;

}

@end
