//
//  FriendOrMedaliAndNameCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FriendOrMedaliAndNameCollectionViewCell.h"

@implementation FriendOrMedaliAndNameCollectionViewCell{
    FLAnimatedImageView * imageView;
    BaseLabel * label;
    
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    imageView = [FLAnimatedImageView new];
    imageView.layer.masksToBounds = YES;
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(-LENGTH(0));
        make.height.mas_equalTo(ws.mas_width);
    }];
    label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(8) TextAlignment:NSTextAlignmentCenter Text:@"123"];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->imageView.mas_centerX);
        make.width.mas_equalTo(self->imageView.mas_width).with.offset(LENGTH(5));
        make.bottom.equalTo(ws).with.offset(-LENGTH(0));
    }];
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    imageView.layer.cornerRadius = imageView.frame.size.width/2;
}
- (void)setFriendMoedl:(MedalBageFriendModel *)friendMoedl{
    _friendMoedl = friendMoedl;
    UIImage * img;
    if (friendMoedl.sex == 1) {
        img = UIIMAGE(ZHANWEITUTXN);
    }else{
        img = UIIMAGE(ZHANWEITUTXV);
    }
    [imageView sd_setImageWithURL:URLIMAGE(friendMoedl.avatar) placeholderImage:img];
    label.text = friendMoedl.name;

}
@end
