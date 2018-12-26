//
//  TKJUserImageView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKJUserImageView.h"

@implementation TKJUserImageView{
    NSMutableArray * imagearray;
    BaseLabel * name;
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
    imagearray = [NSMutableArray array];
}
- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    

    NSInteger right;
    NSInteger width;
    NSInteger all;
    if (_inter == 1) {
        width = 52;
        right = width;
    }else if (_inter == 2){
        width = 46;
        right = 22;
    }else{
        width = 40;
        right = 10;
    }
    all = _itemArray.count;

    for (int i = 0; i < all; i++) {
        UIImageView * imageview = [UIImageView new];
        imageview.backgroundColor = RANDOMCOLOR;
        imageview.layer.masksToBounds = YES;
        imageview.layer.borderWidth = LENGTH(2);
        [imagearray addObject:imageview];
        TFVUserModel * model = _itemArray[i];
        [imageview sd_setImageWithURL:URLIMAGE(model.avatar)];
    }
    
    WS(ws);
    UIImageView * lastview;
    for (int i = 0; i < imagearray.count; i++) {
        UIImageView * view = imagearray[i];
        if (_inter == 1) {
            view.layer.borderColor = RGB(255,225,61).CGColor;
        }else{
            view.layer.borderColor = RGB(255,255,255).CGColor;
        }
        view.layer.cornerRadius = LENGTH(width)/2;
        [self addSubview:view];
        if (!lastview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(ws).with.offset(0);
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(lastview).with.offset(-LENGTH(right));
            }];
        }
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ws);
            make.width.and.height.mas_equalTo(LENGTH(width));
        }];
        if(i == imagearray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(ws);
            }];
        }
        lastview = view;
    }
    TFVUserModel * model = _itemArray[0];
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 61) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:model.name];
    [self addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lastview.mas_bottom);
        make.centerX.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
    }];
}
@end
