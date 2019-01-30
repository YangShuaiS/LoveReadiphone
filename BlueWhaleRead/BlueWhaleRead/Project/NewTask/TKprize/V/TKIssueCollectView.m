//
//  TKIssueCollectView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKIssueCollectView.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@implementation TKIssueCollectView{
    UIImageView * userImageView;
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
    userImageView = [UIImageView new];
    userImageView.contentMode = UIViewContentModeScaleAspectFit;
    userImageView.backgroundColor = RANDOMCOLOR;
    userImageView.layer.masksToBounds = YES;
    [self addSubview:userImageView];
    [userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(5));
        make.height.mas_equalTo(self->userImageView.mas_width);
        make.top.mas_equalTo(ws).with.offset(LENGTH(5));
    }];
    
    UIImageView * BF = [UIImageView new];
    BF.contentMode = UIViewContentModeScaleAspectFit;
    BF.image = UIIMAGE(@"播放");
    [self addSubview:BF];
    [BF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.top.mas_equalTo(ws);
        make.width.and.height.mas_equalTo(ws.mas_width).multipliedBy(0.5);
        make.top.mas_equalTo(ws);
    }];
    BF.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(queren)];
    //将手势添加到需要相应的view中去
    [BF addGestureRecognizer:tap];
    
    label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(3,3,3) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"杨树林"];
//    label.adjustsFontSizeToFitWidth = YES;
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->userImageView.mas_bottom).with.offset(ws.frame.size.height*0.134);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(5));
        make.height.mas_equalTo(ws.mas_height).multipliedBy(0.175);
    }];
}

- (void)queren{
    if ([_model.student_video isEqualToString:@""]) {
        UIAlertController *alart = [UIAlertController alertControllerWithTitle:@"提示" message:@"该用户未上传视频" preferredStyle:UIAlertControllerStyleAlert];
        [[self viewController] presentViewController:alart animated:YES completion:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [alart dismissViewControllerAnimated:YES completion:nil];
            });
        }];
    }else{
        //步骤1：获取视频路径
        NSString *webVideoPath = [NSString stringWithFormat:@"%@%@",IMAGEURL,_model.student_video];
        NSURL *webVideoUrl = [NSURL URLWithString:webVideoPath];
        //步骤2：创建AVPlayer
        AVPlayer *avPlayer = [[AVPlayer alloc] initWithURL:webVideoUrl];
        [avPlayer play];
        //步骤3：使用AVPlayer创建AVPlayerViewController，并跳转播放界面
        AVPlayerViewController *avPlayerVC =[[AVPlayerViewController alloc] init];
        avPlayerVC.player = avPlayer;
        [[self viewController] presentViewController:avPlayerVC animated:YES completion:nil];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    userImageView.layer.cornerRadius = LENGTH(5);
    WS(ws);
    [label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->userImageView.mas_bottom).with.offset(ws.frame.size.height*0.134);
    }];
    if (self.frame.size.width == LENGTH(67)) {
        label.font = TextFont(18);
    }else if (self.frame.size.width == LENGTH(67)){
        label.font = TextFont(16);
    }else{
        label.font = TextFont(14);
    }
}

- (void)setModel:(TKPstudentListModel *)model{
    _model = model;
    [userImageView sd_setImageWithURL:URLIMAGE(model.avatar)];
    label.text = model.name;
}
@end
