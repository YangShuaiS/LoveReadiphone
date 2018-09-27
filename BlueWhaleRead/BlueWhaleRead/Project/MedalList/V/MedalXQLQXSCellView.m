



//
//  MedalXQLQXSCellView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalXQLQXSCellView.h"
#import "MedalChooseABookCollectionView.h"
@implementation MedalXQLQXSCellView{
    FLAnimatedImageView * UserImage;
    BaseLabel * Name;
    BaseLabel * Live;
    MedalChooseABookCollectionView * BookList;
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
    BaseView * backview = [BaseView new];
    backview.backgroundColor = WhitColor;
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(LENGTH(75));
    }];
    
    UserImage = [FLAnimatedImageView new];
    UserImage.image = UIIMAGE(ZHANWEITUTX);
    UserImage.layer.masksToBounds = YES;
    UserImage.layer.cornerRadius = LENGTH(20);
    [backview addSubview:UserImage];
    
    [UserImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(backview.mas_centerY);
        make.left.equalTo(backview.mas_left).with.offset(LENGTH(5));
        make.height.mas_equalTo(LENGTH(40));
        make.width.mas_equalTo(LENGTH(40));
    }];
    
    Name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"123"];
    [backview addSubview:Name];
    
    Live = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(251, 143, 37) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"lv9"];
    [backview addSubview:Live];
    
    [Name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(backview.mas_centerY).with.offset(-LENGTH(10));
        make.left.equalTo(self->UserImage.mas_right).with.offset(LENGTH(6));
//        make.top.equalTo(self->UserImage.mas_top).with.offset(0);
    }];
    
    [Live mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(backview.mas_centerY).with.offset(LENGTH(10));
        make.left.equalTo(self->UserImage.mas_right).with.offset(LENGTH(6));
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(LENGTH(23),LENGTH(31));
//    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(3);
//    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(3);
//    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    BookList = [[MedalChooseABookCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
    [backview addSubview:BookList];
    [BookList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(backview.mas_centerY);
        make.left.mas_equalTo(self->UserImage.mas_right).with.offset(LENGTH(68));
        make.right.mas_equalTo(backview.mas_right).with.offset(-LENGTH(0));
        make.height.mas_equalTo(LENGTH(31));
    }];
    
}
- (void)setBooknumber:(NSInteger)Booknumber{
    _Booknumber = Booknumber;
    BookList.Booknumber = Booknumber;
}

- (void)setModel:(MedalStudentListModel *)model{
    _model = model;
    UIImage * img;
    if (model.student.sex == 1) {
        img = UIIMAGE(ZHANWEITUTXN);
    }else{
        img = UIIMAGE(ZHANWEITUTXV);
    }
    [UserImage sd_setImageWithURL:URLIMAGE(model.student.avatar) placeholderImage:img];
    Name.text = model.student.name;
    Live.text = [NSString stringWithFormat:@"lv%@",model.student.level];
    BookList.nav = self.nav;
    BookList.itemArray = model.badgeStudentBookList;
}
@end
