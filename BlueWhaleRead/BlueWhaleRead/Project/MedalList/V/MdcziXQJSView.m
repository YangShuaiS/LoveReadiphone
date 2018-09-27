//
//  MdcziXQJSView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MdcziXQJSView.h"
#import "FiendOrMedalView.h"
@implementation MdcziXQJSView{
    BaseLabel * Title;
    BaseLabel * subtitle;
    FiendOrMedalView * touxiang;
    
    FLAnimatedImageView *sanjiao;
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
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:CHANGWENZI];
    Title.numberOfLines = 2;
    [self addSubview:Title];
    
    FLAnimatedImageView * TXImage = [FLAnimatedImageView new];
    TXImage.image = UIIMAGE(@"icon_点亮人数");
    [self addSubview:TXImage];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:subtitle];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(LENGTH(23),LENGTH(38));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(7);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(7);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    touxiang = [[FiendOrMedalView alloc] initWithLayOut:flowLayout];
    [touxiang BanSliding];
    [self addSubview:touxiang];
    

    BaseLabel * zhankai = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(85,117,117)  LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@""];

    [self addSubview:zhankai];
    [zhankai mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(4.5));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(140));
        make.height.mas_equalTo(LENGTH(50));
    }];
    zhankai.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
    //将手势添加到需要相应的view中去
    [zhankai addGestureRecognizer:tapGesture1];
    
    sanjiao = [FLAnimatedImageView new];
    sanjiao.image = UIIMAGE(@"icon_文章_下箭头收起");
    [self addSubview:sanjiao];
    
    [sanjiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.mas_centerX);
        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(4.5));

//        make.left.equalTo(zhankai.mas_right).with.offset(0);
        make.width.mas_equalTo(LENGTH(12));
        make.height.mas_equalTo(LENGTH(7));
        
    }];

    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(10));
        make.left.equalTo(ws).with.offset(LENGTH(10));
        make.right.equalTo(ws).with.offset(-LENGTH(10));
    }];
    
    [TXImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->touxiang.mas_centerY);
        
        //        make.top.equalTo(self->Title.mas_bottom).with.offset(20);
        make.left.equalTo(self->Title.mas_left).with.offset(0);
        make.width.mas_equalTo(LENGTH(TXImage.image.size.width));
        make.height.mas_equalTo(LENGTH(TXImage.image.size.height));
        
    }];
    
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(TXImage.mas_right).with.offset(LENGTH(8));
        make.right.equalTo(ws).with.offset(-LENGTH(100));
        make.centerY.mas_equalTo(TXImage.mas_centerY);
    }];
    
    [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->sanjiao.mas_bottom).with.offset(LENGTH(4));
        make.right.equalTo(ws).with.offset(-LENGTH(22));
        make.height.mas_equalTo(LENGTH(38));
        make.bottom.equalTo(ws).with.offset(-LENGTH(12));
    }];
    
}
- (void)tapGesture1{
    sanjiao.image = Title.numberOfLines ==0?UIIMAGE(@"icon_文章_下箭头收起"):UIIMAGE(@"icon_文章_上箭头收起");
    Title.numberOfLines = Title.numberOfLines>0?0:2;
}
- (void)setNav:(UINavigationController *)nav{
    touxiang.nav = nav;
}

- (void)setModel:(MedalListBadgeInfoModel *)model{
    NSString * XZStyle = [NSString stringWithFormat:@"【%@】",model.name];
    NSString * onetextstr = [NSString stringWithFormat:@"%@%@",XZStyle,model.info];
    AttributedStringModel * models = [AttributedStringModel new];
    models.textString = onetextstr;
    models.bianString = XZStyle;
    models.fount = 15;
    NSArray * modelarray = @[models];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    Title.attributedText = AttributedStr;
    subtitle.text = [NSString stringWithFormat:@"%@人已点亮",model.getBadgeNum];
//    NSMutableArray * arr = [NSMutableArray array];
//    for (int i = 0; i<2; i++) {
//        [arr addObjectsFromArray:model.friendList];
//    }
//    touxiang.nav = self.nav;
    touxiang.itemarray = model.studentList;
}
//- (void)PushFriendViewCOntroller:(PushStyle)stylr{
//    [self.delegate PushFriendViewCOntroller:stylr];

//}

@end
