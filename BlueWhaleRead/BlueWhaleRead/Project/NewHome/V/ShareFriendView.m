//
//  ShareFriendView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ShareFriendView.h"
#import "FenXiangView.h"
#import "NewHpViewModel.h"
@implementation ShareFriendView{
    UIImageView * image;
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
    self.backgroundColor = RGB(246,246,246);
    WS(ws);
    image = [UIImageView new];
    image.contentMode = UIViewContentModeScaleAspectFill;
    image.backgroundColor = RANDOMCOLOR;
    image.layer.masksToBounds = YES;
    image.layer.cornerRadius = LENGTH(5);
    [self addSubview:image];
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(12));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(12));
        make.left.mas_equalTo(ws).with.offset(LENGTH(9.5));
        make.width.and.height.mas_equalTo(LENGTH(56));
    }];
    
    label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(44,64,63) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"爱神的箭按时打算尽快的哈萨克较好的爱好大家阿达阿达爱读"];
    label.numberOfLines = 2;
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
        make.centerY.mas_equalTo(ws);
        make.left.mas_equalTo(self->image.mas_right).with.offset(LENGTH(13));
    }];
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backview)];
    //将手势添加到需要相应的view中去
    [self addGestureRecognizer:tapviewtap];
}
- (void)setModel:(HTShareListModel *)model{
    _model = model;
    [image sd_setImageWithURL:URLIMAGE(model.share_img)];
    label.text = model.share_name;
}

- (void)backview{
    NSString *filePatch = [BaseObject AddPathName:[NSString stringWithFormat:@"%@.plist",BENDIXINXI]];
    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    NewHpViewModel * model = [NewHpViewModel mj_objectWithKeyValues:dataDictionary];
    if (![model.sharetime isEqualToString:currentTimeString]) {
        WS(ws);
        FenXiangView * fenxiangs = [FenXiangView new];
        fenxiangs.inter = 1;
        fenxiangs.shareid = [_model.type integerValue];
        fenxiangs.sharestyle = ShareStyleTag11;
        fenxiangs.vc = [self viewController];
        [[self viewController].view addSubview:fenxiangs];
        [fenxiangs mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo([ws viewController].view);
        }];
        [fenxiangs setBlock:^(FenXiangModel *model, ShareStyle sharestyle) {
            [ws endshare];
        }];
    }

}
- (void)endshare{
    WS(ws);
    UIView * v = [UIView new];
    v.backgroundColor = RGBA(255, 255, 255, 0.5);
    [self addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    BaseLabel * label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(65,136,130) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:@"已分享"];
    label.backgroundColor = RGB(188, 229, 226);
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.top.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(47));
        make.height.mas_equalTo(LENGTH(17));
    }];
}
@end
