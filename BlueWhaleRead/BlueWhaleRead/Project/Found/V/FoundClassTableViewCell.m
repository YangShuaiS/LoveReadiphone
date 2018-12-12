//
//  FoundClassTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundClassTableViewCell.h"
#import "HomeModerateCollectView.h"

#import "FriendViewController.h"

#define itemWidth LENGTH(74)
#define itemHeight LENGTH(148.5)
@implementation FoundClassTableViewCell{
    FLAnimatedImageView * UserImageView;
    BaseLabel * Name;
    BaseLabel * lV;
    BaseLabel * Jf;
//    HomeFriendReadingCollectionView * collectView;
    HomeModerateCollectView * collectView;
    BaseLabel * weidu;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    
    UserImageView = [FLAnimatedImageView new];
    UserImageView.image = UIIMAGE(ZHANWEITUTX);
    UserImageView.layer.masksToBounds = YES;
    UserImageView.layer.cornerRadius = LENGTH(30);
    [self addSubview:UserImageView];
    
    Name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(4,51,50) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentLeft Text:@"名字"];
    [self addSubview:Name];
    
    lV = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,154,73) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"Lv2"];
    [self  addSubview:lV];
    
    Jf = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"9999积分"];
    [self addSubview:Jf];
    
    BaseLabel * ZJZD =  [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"最近在读的书"];
    
    [self addSubview:ZJZD];
    
    WS(ws);
    [UserImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(16));
        make.left.equalTo(ws).with.offset(LENGTH(15));
        make.width.mas_equalTo(LENGTH(60));
        make.height.mas_equalTo(LENGTH(60));
    }];
    
    [Name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->UserImageView.mas_centerY).with.offset(-LENGTH(10));
        make.left.equalTo(self->UserImageView.mas_right).with.offset(LENGTH(9));
    }];
    
    [lV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->Name.mas_centerY);
        make.left.equalTo(self->Name.mas_right).with.offset(LENGTH(5));
    }];
    
    [Jf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->UserImageView.mas_centerY).with.offset(LENGTH(10));
        make.left.equalTo(self->UserImageView.mas_right).with.offset(LENGTH(9));
//        make.bottom.equalTo(self->UserImageView.mas_bottom).with.offset(-LENGTH(2));
    }];
    
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self->UserImageView.mas_centerY);
//        make.left.equalTo(self->lV.mas_right).with.offset(LENGTH(40));
//        make.right.equalTo(ws).with.offset(-LENGTH(26));
//    }];
    
    [ZJZD mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->UserImageView.mas_bottom).with.offset(LENGTH(16.5));
        make.left.equalTo(ws).with.offset(LENGTH(15));
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(15);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(15);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(17), 0, LENGTH(17));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
 
    
    collectView = [[HomeModerateCollectView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    collectView.foundinter = 4;
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ZJZD.mas_bottom).with.offset(LENGTH(11));
        make.right.equalTo(ws).with.offset(0);
//        make.bottom.equalTo(ws).with.offset(-LENGTH(31));
        make.height.mas_offset(itemHeight);
    }];

    
    weidu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:weidu];
    [weidu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(self->collectView.mas_bottom).with.offset(LENGTH(8));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(-LENGTH(10));
//        make.height.mas_offset(itemHeight);
    }];
    
    UserImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [UserImageView addGestureRecognizer:tap];
    
}

- (void) setModel:(FoundFriendBooKModel *)model{
    collectView.nav = self.nav;
    _model = model;
    UIImage * img;
    if (model.sex == 1) {
        img = UIIMAGE(ZHANWEITUTXN);
    }else{
        img = UIIMAGE(ZHANWEITUTXV);
    }
    [UserImageView sd_setImageWithURL:URLIMAGE(model.avatar) placeholderImage:img];
    Name.text = model.name;
    lV.text = [NSString stringWithFormat:@"Lv%@",model.level];
    Jf.text = [NSString stringWithFormat:@"%@积分",model.score];

    if (model.studentBook.count == 0) {
        weidu.text = @"TA暂时还没读书哦~";
        collectView.itemarray = model.studentBook;
    }else{
        weidu.text = @"";
        collectView.itemarray = model.studentBook;
    }
}


- (void)tap{
    FriendViewController * vc = [FriendViewController new];
    vc.itemid = _model.ssid;
    [self.nav pushViewController:vc animated:YES];

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
