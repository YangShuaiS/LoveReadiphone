//
//  NBCOtherReadBookTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/11.
//  Copyright © 2019 YS. All rights reserved.
//

#import "NBCOtherReadBookTableViewCell.h"
#import "NBCGoodBookCollectionView.h"
#define itemWidth (WIDTH - LENGTH(13)*2 -LENGTH(24)*2)/3
#define itemHeight LENGTH(170)+LENGTH(19)
@implementation NBCOtherReadBookTableViewCell{
    NBCGoodBookCollectionView * collectView;

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(13);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(13);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(5), LENGTH(24), 0, LENGTH(24));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[NBCGoodBookCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    collectView.decelerationRate = UIScrollViewDecelerationRateNormal;
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(10));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws);
        make.height.mas_equalTo(itemHeight);
    }];
}
- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    collectView.itemarray = itemArray;
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
