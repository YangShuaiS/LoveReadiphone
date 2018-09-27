//
//  ZhiShiShuNEiRong.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuNEiRong.h"

@implementation ZhiShiShuNEiRong{
    FLAnimatedImageView * imageview;
    BaseLabel * label;
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
    imageview.layer.masksToBounds = YES;
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.top.mas_equalTo(ws);
        make.width.mas_equalTo(0);
        make.height.mas_equalTo(0);
    }];
    
    label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x44, 0x33, 0x33) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"立刻就打了开始觉得就爱看老师经典款啦建设大街阿卡丽加了肯德基阿里看见的可垃圾袋恐龙当家卡拉胶"];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageview.mas_bottom);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
    }];
}
- (void)addimage{
    NSArray * arr = @[@"http://a.hiphotos.baidu.com/image/pic/item/0824ab18972bd407b564b0fd70899e510fb3090a.jpg",
                      @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537524317714&di=3a7ccc917c372d564596f8e825255440&imgtype=0&src=http%3A%2F%2Fimg0.pcauto.com.cn%2Fpcauto%2F1711%2F01%2F10902097_bb_thumb.gif",
                      @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537524336966&di=0e1a6c0abdfad507818060a359bad681&imgtype=0&src=http%3A%2F%2Fs9.rr.itc.cn%2Fr%2FwapChange%2F20165_22_23%2Fa7rv5o3601854473362.jpg",
                      @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537524363853&di=d8311f1f747f4e178108e25ba566d450&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01094b57d625810000012e7e9a23d1.gif",
                      @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537524384471&di=531fcb692e53666f3357811d23d8554d&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fupload%2F20170414%2F2327751c50ec49b89373ed26d290dfdc.jpg",
                      @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537524410937&di=9c8e996b07a996e92734301faf3819ac&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20180105%2F412edbb5774a42cd93e0c9e4a5973104.gif",
                      @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537524461079&di=eb619b4c8255f1459ff212488fc1f9b0&imgtype=0&src=http%3A%2F%2Fdesk.fd.zol-img.com.cn%2Ft_s960x600c5%2Fg4%2FM0B%2F03%2F07%2FCg-4zFT-nEaIFpILAAyss3NZRFwAAWcIwCcaqoADKzL003.jpg",
                      @"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2794083473,3953050015&fm=26&gp=0.jpg"];
//    NSInteger inter = arc4random() % arr.count-1;
//    if (inter <= 0) {
//        inter = 0;
//    }
//    if (inter>=arr.count) {
//        inter = arr.count-1;
//    }
                [self->imageview sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537525299436&di=bc0e6fbd5c96130b16b7fd5c6bacf53f&imgtype=0&src=http%3A%2F%2Fs9.rr.itc.cn%2Fr%2FwapChange%2F20165_22_23%2Fa7rv5o3601854473362.jpg"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self->imageview mas_updateConstraints:^(MASConstraintMaker *make) {
                            make.width.mas_equalTo(image.size.width);
                            make.height.mas_equalTo(image.size.height);
                        }];
//                        [self->imageview layoutIfNeeded];
                    });
                }];
}
@end
