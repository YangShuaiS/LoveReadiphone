//
//  HproverbView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HproverbView.h"

@implementation HproverbView{
    FLAnimatedImageView * imageview;
    BaseLabel * title;
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
    WS(ws);
    imageview = [FLAnimatedImageView new];
    imageview.contentMode = UIViewContentModeScaleToFill;
    imageview.layer.masksToBounds = YES;
    imageview.image = UIIMAGE(@"组29");
    
    imageview.layer.shadowColor = RGB(0, 0, 0).CGColor;
    imageview.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    imageview.layer.shadowRadius = LENGTH(12);
    imageview.layer.shadowOpacity = 0.13;
    
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(LENGTH(13), LENGTH(11), LENGTH(13), LENGTH(11)));
        make.height.mas_equalTo(LENGTH(44));
    }];
    
//    BaseLabel * leftlabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[UIColor blackColor] LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"每日\n谚语"];
//    leftlabel.numberOfLines = 2;
//    leftlabel.backgroundColor = RANDOMCOLOR;
//    [imageview addSubview:leftlabel];
//    [leftlabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self->imageview).with.offset(LENGTH(10));
//        make.centerY.mas_equalTo(ws);
//    }];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(56,133,139) LabelFont:TextFontCu(16) TextAlignment:NSTextAlignmentLeft Text:CHANGWENZI];
    [imageview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(15));
        make.centerY.mas_equalTo(ws);
    }];
    
}

- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    if (itemArray.count>0) {
        NHProverbModel * model = itemArray[0];
        title.text = model.content;
    }
}
@end
