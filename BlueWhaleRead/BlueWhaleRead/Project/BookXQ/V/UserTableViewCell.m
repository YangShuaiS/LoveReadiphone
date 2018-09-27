//
//  UserTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserTableViewCell.h"
#import "FiendOrMedalView.h"

@implementation UserTableViewCell
{
    FLAnimatedImageView * UserImage;
    BaseLabel * Name;
    //    BaseLabel * TheClass;
    BaseLabel * Live;
    BaseLabel *YDLALL;
    BaseLabel * JFALL;
    FiendOrMedalView * touxiang;

}
- (void)layoutSubviews{
    [super layoutSubviews];
}
 
- (void)setFrame:(CGRect)frame{
    frame.origin.x =  frame.origin.x + LENGTH(5);
    frame.origin.y =  frame.origin.y + LENGTH(5);
    frame.size.width = frame.size.width - LENGTH(10);
    frame.size.height = frame.size.height - LENGTH(10);
    [super setFrame:frame];

}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    self.layer.shadowOpacity = 0.2;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowRadius = LENGTH(3);
//    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = LENGTH(3);
    
    WS(ws);
    BaseView * backview = [BaseView new];
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(LENGTH(75));
    }];
    
    UserImage = [FLAnimatedImageView new];
    UserImage.layer.masksToBounds = YES;
    UserImage.layer.cornerRadius = LENGTH(20);
    [backview addSubview:UserImage];
    
    [UserImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(backview.mas_centerY);
        make.left.equalTo(backview.mas_left).with.offset(LENGTH(14));
        make.height.mas_equalTo(LENGTH(40));
        make.width.mas_equalTo(LENGTH(40));
    }];
    
    Name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(4,51,50) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:Name];
    
    //    TheClass = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font15) TextAlignment:NSTextAlignmentLeft Text:@""];
    //    [self addSubview:TheClass];
    
    Live = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(251,143,37) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:Live];
    

    
    BaseLabel * YDL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentRight Text:@"阅读量："];
    [self addSubview:YDL];
    
    YDLALL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(4,51,50) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:YDLALL];
    
    BaseLabel * JF = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentRight Text:@"积分："];
    [self addSubview:JF];
    
    JFALL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(4,51,50) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:JFALL];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(LENGTH(23.5),LENGTH(23.5));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = -LENGTH(8);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = 0;
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    touxiang = [[FiendOrMedalView alloc] initWithLayOut:flowLayout];
    [self addSubview:touxiang];
    
    
    [Name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->UserImage.mas_right).with.offset(LENGTH(10));
        make.top.equalTo(backview.mas_top).with.offset(LENGTH(11));
    }];
    
    //    [TheClass mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.equalTo(self->Name.mas_right).with.offset(LENGTH(10));
    //        make.top.equalTo(self->UserImage.mas_top).with.offset(0);
    //    }];
    
    [Live mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->Name.mas_right).with.offset(LENGTH(5));
        make.centerY.equalTo(self->Name.mas_centerY).with.offset(0);
    }];
    
    [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->UserImage.mas_right).with.offset(LENGTH(10));
        make.bottom.equalTo(ws).with.offset(-LENGTH(10));
//        make.right.equalTo(JF.mas_left).with.offset(-LENGTH(10));
        make.height.mas_equalTo(LENGTH(23.5));
    }];
    
    [YDL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(JF.mas_bottom).with.offset(LENGTH(1));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(54));
    }];

    [YDLALL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(YDL.mas_right).with.offset(0);
        make.centerY.mas_equalTo(YDL);
    }];
    
    [JF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.mas_top).with.offset(LENGTH(16));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(54));
    }];
    
    [JFALL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(JF.mas_right).with.offset(0);
        make.centerY.mas_equalTo(JF);
    }];
    
}
- (void)setNav:(UINavigationController *)nav{
    touxiang.nav = nav;
}

- (void)setModel:(BookXQReadFriendModel *)model{
    [UserImage sd_setImageWithURL:URLIMAGE(model.avatar) placeholderImage:UIIMAGE(ZHANWEITUTX)];
    Name.text = model.name;
    Live.text = [NSString stringWithFormat:@"Lv%@",model.level];
    
    YDLALL.text = model.readnum;
    JFALL.text = model.score;
    touxiang.itemarray = model.badgeList;
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
