
//
//  UserXZageView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserXZageView.h"
#import "UserXZageCollectionView.h"
@implementation UserXZageView{
    UserXZageCollectionView * collection;
    NSString * nianji;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    self.backgroundColor = [UIColor whiteColor];
    WS(ws);
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(87,87,87) LabelFont:TextFont(21) TextAlignment:NSTextAlignmentCenter Text:@"你所在的年级？"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(NavHeight+LENGTH(48));
        make.centerX.mas_equalTo(ws);
    }];
    
    BaseLabel * subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(160,160,160) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"智能推荐适合孩子的内容"];
    [self addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(8));
        make.centerX.mas_equalTo(ws);
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(LENGTH(88),LENGTH(52));
    flowLayout.headerReferenceSize =CGSizeMake(WIDTH,LENGTH(20));//头视图大小
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(5);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(5);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(0), LENGTH(40),0, LENGTH(40));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collection = [[UserXZageCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:collection];
    [collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(subtitle.mas_bottom).with.offset(LENGTH(40));
        make.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(10));
    }];
    [collection setBlock:^(NSString * _Nonnull str) {
        [ws hunianji:str];
    }];
    
    BaseLabel * wc = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"完成"];
    wc.backgroundColor = RGB(82,199,198);
    wc.layer.masksToBounds = YES;
    wc.layer.cornerRadius = LENGTH(25);
    wc.layer.shadowColor = RGB(82, 199, 198).CGColor;
    wc.layer.shadowOffset = CGSizeMake(0,2.5);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    wc.layer.shadowRadius = LENGTH(15);
    wc.layer.shadowOpacity = 0.3;
    [self addSubview:wc];
    [wc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(76));
        make.left.mas_equalTo(ws).with.offset(LENGTH(50));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(50));
        make.height.mas_equalTo(LENGTH(50));
    }];
    wc.userInteractionEnabled = YES;
    //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
    //将手势添加到需要相应的view中去
    [wc addGestureRecognizer:tapGesture1];

    [self load];
}
- (void)hunianji:(NSString *)str{
    nianji = str;
}
- (void)tapGesture1{
    self.block(nianji);
    [self remoview];
}
- (void)load{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_HQCLASS];
    NSString *filePatch = [BaseObject AddPathName:[NSString stringWithFormat:@"%@.plist",ALLCLASS]];
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:nil andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            [responseObject writeToFile:filePatch atomically:YES];
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {
                self->collection.itemArray = m.levelList;
            }

        }else{
        }
    }];

}
- (void)remoview{
    [self removeFromSuperview];
}
@end
