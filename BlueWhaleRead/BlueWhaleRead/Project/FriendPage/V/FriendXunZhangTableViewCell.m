//
//  FriendXunZhangTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FriendXunZhangTableViewCell.h"
#import "FiendOrMedalView.h"
@implementation FriendXunZhangTableViewCell{
    BaseLabel * LV;
    FiendOrMedalView * touxiang;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setInter:(NSInteger)inter{
    _inter = inter;
    if (inter == 0 || inter == 3) {
        self.backgroundColor = RGB(188,141,222);
        LV.textColor =RGB(169,97,220);
    }else if (inter == 1 || inter == 4){
        self.backgroundColor = RGB(178,175,241);
        LV.textColor =RGB(140,135,233);
    }else if (inter == 2 || inter == 5){
        self.backgroundColor = RGB(220,210,252);
        LV.textColor =RGB(169,97,220);
    }
}
- (void)setupUI{
    
    LV = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(220,210,252) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"lv9"];
    LV.backgroundColor = RGBA(255, 255, 255, 0.7);
    LV.layer.masksToBounds = YES;
    LV.layer.cornerRadius = LENGTH(16);
    [self addSubview:LV];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(LENGTH(35),LENGTH(35));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(5);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(5);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    touxiang = [[FiendOrMedalView alloc] initWithLayOut:flowLayout];
    touxiang.backgroundColor = [UIColor clearColor];
    [self addSubview:touxiang];
    

    WS(ws);
    [LV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(12.5));
        make.width.mas_equalTo(LENGTH(32));
        make.height.mas_equalTo(LENGTH(32));
        make.top.equalTo(ws).with.offset(LENGTH(7));
        make.bottom.equalTo(ws).with.offset(-LENGTH(7));

//        make.centerY.mas_equalTo(ws);
    }];
    
    [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws);
        make.left.equalTo(self->LV.mas_right).with.offset(LENGTH(10));
        make.right.equalTo(ws).with.offset(-LENGTH(30.5));
        make.height.mas_equalTo(LENGTH(35));
//        make.bottom.equalTo(ws).with.offset(-LENGTH(10));
    }];

}

- (void)setModel:(BageLeveListModel *)model{
    _model = model;
    
    LV.text = [NSString stringWithFormat:@"Lv%ld",(long)model.level];
    touxiang.nav = self.nav;
    touxiang.itemarray= model.levelbadgeList;

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
