


//
//  MyXunZhangView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyXunZhangView.h"
//#import "FriendXunZhangTable.h"
@implementation MyXunZhangView{
//    FriendXunZhangTable * XunZhang;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
//    XunZhang = [FriendXunZhangTable new];
//    XunZhang.layer.masksToBounds = YES;
//    XunZhang.layer.cornerRadius = LENGTH(10);
//    [self addSubview:XunZhang];
//
//    [XunZhang mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(ws).with.offset(LENGTH(50));
//        make.right.equalTo(ws).with.offset(-LENGTH(50));
//        make.top.equalTo(ws).with.offset(LENGTH(30));
//        make.bottom.equalTo(ws).with.offset(-LENGTH(30));
//    }];;
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
//    XunZhang.itemarray = itemarray;

}
@end
