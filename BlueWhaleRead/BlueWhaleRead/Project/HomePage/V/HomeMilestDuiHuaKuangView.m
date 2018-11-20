//
//  HomeMilestDuiHuaKuangView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeMilestDuiHuaKuangView.h"

@implementation HomeMilestDuiHuaKuangView{
    BaseLabel * title;
    BaseLabel * subtitle;
    FLAnimatedImageView * xinxing;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addView];
    }
    return self;
}
- (void)addView{
    WS(ws);
    xinxing = [FLAnimatedImageView new];
    xinxing.image = UIIMAGE(@"bg_里程碑_对话框");
//    xinxing.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:xinxing];
    [xinxing mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(170));
        make.height.mas_equalTo(LENGTH(74));
    }];
#pragma legacy ------------------------ 富文本居中？
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(1,117,223) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"小朋友你已经读完了 0  本书"];
    [xinxing addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->xinxing.mas_top).with.offset(LENGTH(10)+LENGTH(6));
        make.left.mas_equalTo(self->xinxing);
        make.right.mas_equalTo(self->xinxing);
    }];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(1,117,223) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"完成了第 0 个里程碑"];
    [xinxing addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->xinxing);
        make.right.mas_equalTo(self->xinxing);
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(2));
    }];

}

- (void)setNow:(NSInteger)now{
    _now = now;
    NSString * lcball = [NSString stringWithFormat:@"完成了第 %ld 个里程碑",now];
    AttributedStringModel * lcbmodel = [AttributedStringModel new];
    lcbmodel.textString = lcball;
    lcbmodel.bianString = [NSString stringWithFormat:@"%ld",now];
    lcbmodel.color = RGB(253,171,82);
    lcbmodel.fount = 15;
    NSArray * lcblarray = @[lcbmodel];
    NSMutableAttributedString *lcbAttributedStr = [BaseObject Attributed:lcblarray];
    subtitle.attributedText = lcbAttributedStr;
}

- (void)setBookS:(NSString *)bookS{
    _bookS = bookS;
    NSString * bookall = [NSString stringWithFormat:@"小朋友你已经读完了 %@  本书",bookS];
    AttributedStringModel * bookmodel = [AttributedStringModel new];
    bookmodel.textString = bookall;
    bookmodel.bianString = bookS;
    bookmodel.color = RGB(253,171,82);
    bookmodel.fount = 15;
    NSArray * modelarray = @[bookmodel];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    title.attributedText = AttributedStr;
}
-(void)setLeftImage:(BOOL)leftImage{
    if (leftImage == YES) {
        xinxing.image = UIIMAGE(@"bg_里程碑_对话框左");
    }else{
        xinxing.image = UIIMAGE(@"bg_里程碑_对话框");

    }
}

- (void)weiwancheng{
    NSString * lcball = [NSString stringWithFormat:@"第 %ld 个里程碑哦",_now];
    AttributedStringModel * lcbmodel = [AttributedStringModel new];
    lcbmodel.textString = lcball;
    lcbmodel.bianString = [NSString stringWithFormat:@"%ld",_now];
    lcbmodel.color = RGB(253,171,82);
    lcbmodel.fount = 15;
    NSArray * lcblarray = @[lcbmodel];
    NSMutableAttributedString *lcbAttributedStr = [BaseObject Attributed:lcblarray];
    subtitle.attributedText = lcbAttributedStr;
    
    NSString * bookall = [NSString stringWithFormat:@"再读 %@ 本书可以完成",_bookS];
    AttributedStringModel * bookmodel = [AttributedStringModel new];
    bookmodel.textString = bookall;
    bookmodel.bianString = _bookS;
    bookmodel.color = RGB(253,171,82);
    bookmodel.fount = 15;
    NSArray * modelarray = @[bookmodel];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    title.attributedText = AttributedStr;
}
@end
