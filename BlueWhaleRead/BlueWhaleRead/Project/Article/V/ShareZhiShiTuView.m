//
//  ShareZhiShiTuView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/17.
//  Copyright © 2019 YS. All rights reserved.
//

#import "ShareZhiShiTuView.h"

@implementation ShareZhiShiTuView{
    UIImageView * imamgeView;
    UIImageView * erweima;
    BaseLabel * title;
    BaseLabel * subtitle;
    BaseLabel * downLabel;
    NSInteger nowtype;
}

- (instancetype)initWithType:(NSInteger)type{
    self = [super init];
    if (self) {
        //0 知识图  //1 脉络图
        nowtype = type;
        [self addview:type];
    }
    return self;
}
- (void)addview:(NSInteger)type{
    self.backgroundColor = [UIColor whiteColor];
    WS(ws);
    imamgeView = [UIImageView new];
    imamgeView.contentMode = UIViewContentModeScaleAspectFill;
    imamgeView.layer.masksToBounds = YES;
    imamgeView.backgroundColor = RGB(175, 175, 175);
    [self addSubview:imamgeView];

    
    if (type == 0) {
        [imamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.right.mas_equalTo(ws);
            make.size.mas_equalTo(CGSizeMake(LENGTH(375), LENGTH(220)));
        }];
    }else{
        [imamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.right.mas_equalTo(ws);
            make.size.mas_equalTo(CGSizeMake(LENGTH(375), LENGTH(110)));
        }];
    }
    
    erweima = [UIImageView new];
    erweima.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:erweima];
    [erweima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imamgeView.mas_bottom).with.offset(LENGTH(43));
        make.left.mas_equalTo(ws).with.offset(LENGTH(17));
        make.size.mas_equalTo(CGSizeMake(LENGTH(72), LENGTH(72)));
    }];

    BaseLabel * label = [[BaseLabel alloc] initWithTxteColor:RGB(31,31,31) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"识别二维码查看"];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->erweima);
        make.top.mas_equalTo(self->erweima.mas_bottom).with.offset(LENGTH(10));
    }];
    
    UIView * shuxian = [UIView new];
    shuxian.backgroundColor = RGB(210, 210, 210);
    [self addSubview:shuxian];
    [shuxian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imamgeView.mas_bottom).with.offset(LENGTH(24));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(46));
        make.size.mas_equalTo(CGSizeMake(LENGTH(2), LENGTH(145)));
        make.left.mas_equalTo(self->erweima.mas_right).with.offset(LENGTH(18));
    }];
    
    title = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFont(23) TextAlignment:NSTextAlignmentLeft Text:@"原始宗教"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imamgeView.mas_bottom).with.offset(LENGTH(22));
        make.left.mas_equalTo(shuxian.mas_right).with.offset(LENGTH(14));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(16));
    }];
    
    subtitle = [[BaseLabel alloc] initWithTxteColor:RGB(120, 120, 120) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentLeft Text:@"楚汉战争历时4年多，战地之辽阔，规模之巨大，用兵韬略之丰富，前所未有，在中国古代战争史上占有重要地位。"];
    subtitle.numberOfLines = 4;
    [self addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(12));
        make.left.mas_equalTo(shuxian.mas_right).with.offset(LENGTH(14));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(16));
    }];
    
    downLabel = [[BaseLabel alloc] initWithTxteColor:RGB(153,153,153) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentRight Text:@"博万卷·脉络图"];
    [self addSubview:downLabel];
    [downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(16));
        make.bottom.mas_equalTo(ws.mas_bottom).with.offset(-LENGTH(22));
    }];
    if (type == 0) {
        downLabel.text = @"博万卷·知识图";
    }else{
        downLabel.text = @"博万卷·脉络图";
    }
    
    UIImageView * logo = [UIImageView new];
    logo.contentMode = UIViewContentModeScaleAspectFit;
    logo.image = UIIMAGE(@"天天爱读");
    logo.layer.shadowColor = RGB(30, 52, 48).CGColor;
    logo.layer.shadowOffset = CGSizeMake(0,1);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    logo.layer.shadowRadius = LENGTH(1.5);
    logo.layer.shadowOpacity = 0.16;
    [self addSubview:logo];
    [logo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self->downLabel.mas_left).with.offset(-LENGTH(8));
        make.size.mas_equalTo(CGSizeMake(LENGTH(17), LENGTH(17)));
        make.centerY.mas_equalTo(self->downLabel);
    }];
}

- (void)setModel:(FenXiangModel *)model{
    _model = model;
    WS(ws);
    [erweima sd_setImageWithURL:URLIMAGE(model.small_program_code) completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        ws.now ++;
    }];
}
- (void)setZhishishuModel:(ZhiShiShuModel *)zhishishuModel{
    _zhishishuModel = zhishishuModel;
    WS(ws);
    if (nowtype == 0) {
        [imamgeView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTX,zhishishuModel.data.knowledge_img1]] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            ws.now ++;
        }];
    }else{
        [imamgeView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTX,zhishishuModel.data.knowledge_width_img]] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            ws.now ++;
        }];
    }
    title.text = zhishishuModel.data.name;
    subtitle.text = zhishishuModel.data.knowledge_info;
}
@end
