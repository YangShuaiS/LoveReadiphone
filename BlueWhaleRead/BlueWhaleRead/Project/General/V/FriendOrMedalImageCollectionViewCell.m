//
//  FriendOrMedalImageCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FriendOrMedalImageCollectionViewCell.h"

@implementation FriendOrMedalImageCollectionViewCell{
    FLAnimatedImageView * imageView;
    
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
//    imageView.backgroundColor = RANDOMCOLOR;
    imageView.layer.masksToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        
    }];
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
//    imageView.layer.cornerRadius = self.frame.size.width/2;
}

- (void)setModel:(ReadPeopleModel *)model{
    UIImage * img;
    if (model.sex == 1) {
        img = UIIMAGE(ZHANWEITUTXN);
    }else{
        img = UIIMAGE(ZHANWEITUTXV);
    }
    imageView.layer.cornerRadius = self.frame.size.width/2;
    [imageView sd_setImageWithURL:URLIMAGE(model.avatar) placeholderImage:img];
}
- (void)setBadgeModel:(CityBadgeListModel *)badgeModel{
    [imageView sd_setImageWithURL:URLIMAGE(badgeModel.min_logo) placeholderImage:UIIMAGE(ZHANWEITUXZ)];

}

- (void)setBadgeimagemodel:(BadgeOnlyImageModel *)badgeimagemodel{
    [imageView sd_setImageWithURL:URLIMAGE(badgeimagemodel.min_logo) placeholderImage:UIIMAGE(ZHANWEITUXZ)];

}
@end
