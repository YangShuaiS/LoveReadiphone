//
//  BuyXieYiView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/5/6.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyXieYiView.h"
#import "AgreementViewController.h"
@implementation BuyXieYiView{
    YYLabel * titlabel;
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
    titlabel = [[YYLabel alloc] init];
    titlabel.font = TextFont(11);
    titlabel.textAlignment = NSTextAlignmentCenter;
    titlabel.text = @"开通会员即同意 《博万卷会员服务协议》以及《自动续费协议》";
    titlabel.textColor = RGB(186,186,186);
    titlabel.numberOfLines = 0;
    titlabel.preferredMaxLayoutWidth = WIDTH-LENGTH(40);//设置最大宽度
    [self addSubview:titlabel];
    [titlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(0));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(WIDTH-LENGTH(40));
        make.height.mas_equalTo(LENGTH(36));
        make.bottom.mas_equalTo(ws);
    }];
    
    NSDictionary *attributeDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                   TextFont(11),NSFontAttributeName,nil];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:titlabel.text attributes:attributeDict];
    [attributedString yy_setTextHighlightRange:[[attributedString string] rangeOfString:@"《博万卷会员服务协议》"] color:RGB(33,200,198) backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        AgreementViewController * vc = [AgreementViewController new];
        vc.titl = @"博万卷会员服务协议";
        vc.url = @"http://tiantianaidu.com/app_help/member_xy.html";
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }];
    
    [attributedString yy_setTextHighlightRange:[[attributedString string] rangeOfString:@"《自动续费协议》"] color:RGB(33,200,198) backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        AgreementViewController * vc = [AgreementViewController new];
        vc.titl = @"博万卷会员服务协议";
        vc.url = @"http://tiantianaidu.com/app_help/member_renewal.html";
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }];
    titlabel.attributedText = attributedString;
}

@end
