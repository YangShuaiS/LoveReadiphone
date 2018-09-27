//
//  MyQingKuangView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyQingKuangView.h"
#import "MyQingKuang.h"
@implementation MyQingKuangView{
    MyQingKuang * ydqk;
    MyQingKuang * csqk;
    BaseLabel * title;
    FLAnimatedImageView * bacImage;
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
    bacImage = [FLAnimatedImageView new];
//    bacImage.backgroundColor = RANDOMCOLOR;
    bacImage.contentMode = UIViewContentModeScaleAspectFill;
    bacImage.layer.masksToBounds = YES;
    bacImage.image = UIIMAGE(@"bg_我的_能力情况");
    [self addSubview:bacImage];

    
    NSMutableArray * ydqkarray = [NSMutableArray array];
    [ydqkarray addObject:@"阅读均衡"];
    [ydqkarray addObject:@"阅读能力"];
    [ydqkarray addObject:@"阅读量"];
//    [ydqkarray addObject:@"阅读速度"];
    ydqk = [MyQingKuang new];
    ydqk.title = @"阅读情况";
    ydqk.itemarray = ydqkarray;
    [self addSubview:ydqk];
    
    NSMutableArray * csqkarray = [NSMutableArray array];
//    [csqkarray addObject:@"诵读完成"];
    [csqkarray addObject:@"识字量"];
    [csqkarray addObject:@"识词量"];
    csqk = [MyQingKuang new];
    csqk.title = @"测试情况";
    csqk.itemarray = csqkarray;
    [self addSubview:csqk];
    
    [ydqk mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.top.mas_equalTo(ws);
    }];
    
    [csqk mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.top.mas_equalTo(self->ydqk.mas_bottom);
        make.bottom.mas_equalTo(ws);
    }];
    
    
}

- (void)setNav:(UINavigationController *)nav{
    ydqk.nav = nav;
    csqk.nav = nav;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (self.frame.size.width>0) {
        WS(ws);
        bacImage.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//        [bacImage mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(ws);
//            make.left.mas_equalTo
//        }];
    }

}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
}

- (void)setModel:(MyDeModel *)model{
    _model = model;
    NSMutableArray * ydqkcontentarray = [NSMutableArray array];
    if ([model.is_balance isEqualToString:@"0"]) {
        [ydqkcontentarray addObject:@"不均衡"];
    }else{
        [ydqkcontentarray addObject:@"均衡"];
    }
    
    if ([model.abilityNum isEqualToString:@"0"]) {
        [ydqkcontentarray addObject:@"不达标"];
    }else{
        [ydqkcontentarray addObject:@"达标"];
    }
    
    [ydqkcontentarray addObject:[NSString stringWithFormat:@"%@\n本",model.myReadNum]];
//    [ydqkcontentarray addObject:@"111234\n字/分钟"];
    ydqk.contertarray = ydqkcontentarray;
    
    NSMutableArray * csqkcontentarray = [NSMutableArray array];
//    [csqkcontentarray addObject:@"5\n篇"];
    [csqkcontentarray addObject:[NSString stringWithFormat:@"%@字",model.myLiteracy]];
    [csqkcontentarray addObject:[NSString stringWithFormat:@"%@词",model.myGlossary]];
    csqk.contertarray = csqkcontentarray;
    
//    if (itemarray.count == 0) {
//        title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(22) TextAlignment:NSTextAlignmentCenter Text:@"你的阅读量不足，快去读书吧！"];
//        [self addSubview:title];
//        WS(ws);
//        [title mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.mas_equalTo(ws);
//        }];
//    }
}
@end
