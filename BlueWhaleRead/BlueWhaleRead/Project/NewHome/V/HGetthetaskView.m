//
//  HGetthetaskView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/9.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "HGetthetaskView.h"

@implementation HGetthetaskView{
    BaseLabel * title;
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
    self.backgroundColor = [UIColor whiteColor];
    UIView * backview = [UIView new];
    backview.backgroundColor = RGB(255, 255, 255);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(0, LENGTH(20), LENGTH(14), LENGTH(20)));
    }];
    backview.layer.shadowOpacity = 0.24;
    backview.layer.shadowColor = RGB(171, 171, 171).CGColor;
    backview.layer.shadowRadius = LENGTH(16);
    backview.layer.shadowOffset = CGSizeMake(0,8);
    backview.layer.cornerRadius = LENGTH(10);
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51, 51, 51) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:[NSString stringWithFormat:@"亲爱的 %@ 同学～\n你还没有属于自己的读书任务哦，\n快来制定你的读书任务吧！",Me.name]];
    title.numberOfLines = 0;
    [backview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backview).with.offset(LENGTH(24));
        make.left.mas_equalTo(backview).with.offset(LENGTH(23));
        make.right.mas_equalTo(backview).with.offset(-LENGTH(23));
    }];
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = title.text;
    model1.bianString = Me.name;
    model1.color = RGB(91,199,198);
    model1.fount = 18;
    
//    AttributedStringModel * model2 = [AttributedStringModel new];
//    model2.textString = title.text;
//    model2.bianString = [NSString stringWithFormat:@"读书任务"];
//    model2.color = RGB(91,199,198);
//    model2.integer = 1;
    NSArray * modelarray = @[model1];
    NSDictionary *attributeDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                   TextFont(15),NSFontAttributeName,nil];
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc] initWithString:title.text attributes:attributeDict];
    
    AttributedStr = [BaseObject AttributedAll:modelarray];
    NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    // 行间距设置为
    [paragraphStyle  setLineSpacing:LENGTH(3)];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [AttributedStr  addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [title.text length])];
    title.attributedText = AttributedStr;
    
    UIImageView * cengimage = [UIImageView new];
    cengimage.contentMode = UIViewContentModeScaleAspectFit;
    cengimage.image = UIIMAGE(@"首页-箭头");
    cengimage.image = [cengimage.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
    cengimage.tintColor = RGB(91,199,198);
    [backview addSubview:cengimage];
    [cengimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(8));
        make.centerX.mas_equalTo(backview);
//        make.width.and.height.mas_equalTo(LENGTH(40));
        make.width.mas_equalTo(LENGTH(25));
        make.height.mas_equalTo(LENGTH(15));
    }];
    
    BaseLabel * zdduju = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"制定你的读书任务"];
    zdduju.backgroundColor = RGB(91,199,198);
    [backview addSubview:zdduju];
    [zdduju mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(cengimage.mas_bottom).with.offset(LENGTH(8));
        make.centerX.mas_equalTo(backview);
        make.left.mas_equalTo(ws).with.offset(LENGTH(46));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(46));
        make.height.mas_equalTo(LENGTH(46));
        make.bottom.mas_equalTo(backview).with.offset(-LENGTH(30));
    }];
    zdduju.layer.masksToBounds = YES;
    zdduju.layer.cornerRadius = LENGTH(23);
}
@end
