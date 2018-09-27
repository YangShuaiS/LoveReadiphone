//
//  TZXZView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TZXZView.h"
#import "GeneralBookImageNumberView.h"
@implementation TZXZView{
    BaseView * leftView;
    BaseLabel * rightView;
    GeneralBookImageNumberView * bookimageView;
    
    BaseLabel * RLXZang;
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
        RLXZang = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"认领勋章"];
        RLXZang.backgroundColor = RANDOMCOLOR;
        [self addSubview:RLXZang];
    
        [RLXZang mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws).with.offset(0);
            make.left.equalTo(ws).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
            make.bottom.equalTo(ws).with.offset(0);
        }];
    
        RLXZang.userInteractionEnabled = YES;
        UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(RLXZ)];
        //将手势添加到需要相应的view中去
        [RLXZang addGestureRecognizer:tapGesture1];
    
    
    
    leftView = [BaseView new];
    leftView.backgroundColor = RANDOMCOLOR;
    [self addSubview:leftView];
    

    rightView = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:@"挑战勋章"];
    rightView.backgroundColor = RANDOMCOLOR;
    rightView.userInteractionEnabled = YES;
    [self addSubview:rightView];
    
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Tzxz)];
    //将手势添加到需要相应的view中去
    [rightView addGestureRecognizer:tapGesture2];
    
    
    UICollectionViewFlowLayout *flowLayout1 = [[UICollectionViewFlowLayout alloc] init];
    flowLayout1.itemSize = CGSizeMake(LENGTH(26),LENGTH(23));
    //定义每个UICollectionView 横向的间距
    flowLayout1.minimumLineSpacing = LENGTH(10);
    //定义每个UICollectionView 纵向的间距
    flowLayout1.minimumInteritemSpacing = LENGTH(10);
    //定义每个UICollectionView 的边距距
    flowLayout1.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
    flowLayout1.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    bookimageView = [[GeneralBookImageNumberView alloc] initWithLayOut:flowLayout1];
    [leftView addSubview:bookimageView];
    
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(-TabBarHeight);
        make.bottom.equalTo(self->rightView.mas_top).with.offset(0);
    }];
    
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
    }];
    
    [bookimageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self->leftView);
        make.center.mas_equalTo(self->leftView);
        make.height.mas_equalTo(LENGTH(23));
    }];
    leftView.hidden = YES;
    rightView.hidden = YES;
    

}
- (void)setModel:(MedalListDetailModel *)model{
    _model = model;
    bookimageView.allinter = 8;
    bookimageView.haveinter = model.read_book_num;
}
- (void)RLXZ{
    self.block();
    RLXZang.hidden = YES;
    leftView.hidden = NO;
    rightView.hidden = NO;
}

- (void)Tzxz{
    self.tzxzBlock();
}
@end
