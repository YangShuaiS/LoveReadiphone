//
//  FoundMedalCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/8/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundMedalCollectionViewCell.h"
#import "JInDuHeadImage.h"
@implementation FoundMedalCollectionViewCell{
    JInDuHeadImage * imageView;
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
    imageView = [JInDuHeadImage new];
    imageView.touxiang.image = UIIMAGE(@"发现_你的同学_勋章缺省位置");
    imageView.layer.masksToBounds = YES;
    imageView.progress = 0;//进度
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
//        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(self->imageView.mas_height);
    }];
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    imageView.layer.cornerRadius = imageView.frame.size.width/2;
}
- (void)setModel:(BadgeOnlyImageModel *)model{
    _model = model;
    [imageView.touxiang sd_setImageWithURL:URLIMAGE(model.min_logo) placeholderImage:UIIMAGE(ZHANWEITUXZ)];
        CGFloat f = 1-1.000000001*model.book_count/model.task_num;
    imageView.progress = f;//进度

}
@end
