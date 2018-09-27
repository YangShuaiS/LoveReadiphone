//
//  AchievementMenu.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "AchievementMenu.h"

@implementation AchievementMenu{
    NSMutableArray * viewarray;
    BaseLabel * lastlabel;
    BaseView * downxian;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{


}

- (void)setModel:(AchievementModel *)model{
    WS(ws);
    
    viewarray = [NSMutableArray array];
    for (AchievementReportModel * m in model.report) {
        BaseLabel * label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:m.report_name];
        [viewarray addObject:label];
    }
    
    downxian = [BaseView new];
    downxian.backgroundColor = RGB(255, 255, 255);
    [self addSubview:downxian];
    
    CGFloat width = (WIDTH-LENGTH(19)*2)/model.report.count;
    for (int i = 0; i < viewarray.count; i++) {
        BaseLabel * label = viewarray[i];
        [self addSubview:label];
        
        BaseButton * click = [BaseButton buttonWithType:UIButtonTypeCustom];
        [click addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        click.tag = 100+i;
        [self addSubview:click];
        if (i == 0) {
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(ws).with.offset(0);
                make.left.equalTo(ws).with.offset(LENGTH(19));
                make.width.mas_equalTo(width);
            }];
            [downxian mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(label.mas_bottom).with.offset(LENGTH(5));
                make.centerX.mas_equalTo(label.mas_centerX);
                make.width.mas_equalTo(LENGTH(30));
                make.height.mas_equalTo(LENGTH(2));
                make.bottom.mas_equalTo(ws);
            }];
        }else if (i < model.report.count){
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self->lastlabel.mas_centerY).with.offset(0);
                make.left.equalTo(self->lastlabel.mas_right).with.offset(0);
            }];
        }else{
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self->lastlabel.mas_centerY).with.offset(0);
                make.left.equalTo(self->lastlabel.mas_right).with.offset(0);
                make.right.equalTo(ws).with.offset(-LENGTH(19));
            }];
        }
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(width);
        }];
        [click mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(label);
        }];
        lastlabel = label;
    }
}

- (void)click:(BaseButton *)button{
    NSInteger inter = button.tag-100;
    [self donghuaxin:inter];
    self.clickTag(inter);
}
- (void)donghuaxin:(NSInteger )inter{
    lastlabel = viewarray[inter];
    [UIView animateWithDuration:0.5 animations:^{
        self->downxian.center = CGPointMake(self->lastlabel.center.x, self->downxian.center.y);
        [self->downxian layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}
@end
