//
//  YDWZTimeView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "YDWZTimeView.h"

@implementation YDWZTimeView{
    BaseLabel * times;
    BaseLabel * fen;
    
    NSTimer * time;
    NSInteger  seconds;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    BaseView * backview = [BaseView new];
    backview.backgroundColor = RGBA(94,195,191,0.3);
    backview.layer.masksToBounds = YES;
    backview.layer.cornerRadius = LENGTH(18);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws.mas_centerY);
        make.left.equalTo(ws).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(-LENGTH(0));
        make.height.mas_equalTo(LENGTH(38));
    }];
    
    times = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(50,162,158) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"99"];
    [self addSubview:times];
    [times mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws.mas_centerY);
        make.left.equalTo(ws).with.offset(LENGTH(52));
        make.right.equalTo(ws).with.offset(-LENGTH(0));
    }];
    
    fen = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(252,252,253) LabelFont:TextFont(22) TextAlignment:NSTextAlignmentCenter Text:@"80分"];
    fen.layer.masksToBounds = YES;
    fen.layer.cornerRadius = LENGTH(26);
    fen.backgroundColor = RGB(94,195,191);
    [self addSubview:fen];
    [fen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(0));
        make.top.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(52));
        make.height.mas_equalTo(LENGTH(52));
    }];
    
}
- (void)setInter:(NSInteger)inter{
    _inter = inter;
    seconds = inter;
    time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownAction) userInfo:nil repeats:YES]; //启动倒计时后会每秒钟调用一次方法 countDownAction
    [[NSRunLoop mainRunLoop] addTimer:time forMode:NSRunLoopCommonModes];
    
    //设置倒计时显示的时间
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];//时
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];//分
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];//秒
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    times.text = format_time;
}
-(void) countDownAction{
    //倒计时-1
    seconds--;
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    //修改倒计时标签现实内容
    times.text = format_time;
    //当倒计时到0时，做需要的操作，比如验证码过期不能提交
    if(seconds==0){
        [time invalidate];
        time = nil;
    }
}
- (NSInteger)EndTime{
    [time invalidate];
    time = nil;
    return seconds;
}
@end
