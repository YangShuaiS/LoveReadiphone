//
//  ArticleTopView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/20.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ArticleTopView.h"
#import "ZhiShiShuViewController.h"
#import "ZhiShiShuShuViewController.h"
@implementation ArticleTopView{
    YYLabel * titlabel;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
- (void)addview{
    WS(ws);
    self.backgroundColor = [UIColor whiteColor];
    titlabel = [[YYLabel alloc] init];
    titlabel.font = TextFont(15);
    titlabel.textAlignment = NSTextAlignmentLeft;
    titlabel.text = @"知识体系>";
    titlabel.textColor = RGB(3,3,3);
    titlabel.numberOfLines = 2;
    titlabel.preferredMaxLayoutWidth = WIDTH-LENGTH(40);//设置最大宽度
    [self addSubview:titlabel];
    [titlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
        make.top.mas_equalTo(ws).with.offset(LENGTH(16));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(15));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
    }];
}

- (void)setModel:(LunBoTuXQModel *)model{
    _model = model;
    if (model.knowledgeGrade.count ==3) {
        [self addview];
        NSString * str = [NSString stringWithFormat:@"知识体系"];
        for (knowledgeGradeModel *knowmodel in model.knowledgeGrade) {
            str = [str stringByAppendingString:[NSString stringWithFormat:@" > %@",knowmodel.name]];
        }
        NSDictionary *attributeDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                       TextFont(15),NSFontAttributeName,nil];
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str attributes:attributeDict];
        __weak ArticleTopView * blockSelf = self;
        if (model.knowledgeGrade.count == 3) {
            for (int i = 0; i<model.knowledgeGrade.count; i++) {
                knowledgeGradeModel *knowmodel = model.knowledgeGrade[i];
                NSRange range = [str rangeOfString:knowmodel.name];
                if (i == 0) {
                    [attributedString yy_setTextHighlightRange:[[attributedString string] rangeOfString:knowmodel.name] color:RGB(3,3,3) backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
                        ZhiShiShuViewController * vc = [ZhiShiShuViewController new];
                        vc.ids = knowmodel._id;
                        [[blockSelf viewController].navigationController pushViewController:vc animated:YES];
                    }];
                    
                    
                }else if (i == 1){
                    [attributedString yy_setTextHighlightRange:[[attributedString string] rangeOfString:knowmodel.name] color:RGB(3,3,3) backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
                        knowledgeGradeModel *knowmodel1 = model.knowledgeGrade[0];
                        ZhiShiShuViewController * vc = [ZhiShiShuViewController new];
                        vc.ids = knowmodel1._id;
                        vc.twoid = knowmodel._id;
                        [[blockSelf viewController].navigationController pushViewController:vc animated:YES];
                    }];
                }else if (i  == 2){
                    [attributedString yy_setTextHighlightRange:[[attributedString string] rangeOfString:knowmodel.name] color:RGB(3,3,3) backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
                        ZhiShiShuShuViewController * vc = [ZhiShiShuShuViewController new];
                        vc.itemid =knowmodel.knowledge._id;
                        [[blockSelf viewController].navigationController pushViewController:vc animated:YES];
                    }];
                }
                [attributedString addAttribute:(NSString *)kCTUnderlineStyleAttributeName
                                         value:[NSNumber numberWithInt:(kCTUnderlineStyleSingle|kCTUnderlinePatternSolid)]
                                         range:range];
                [attributedString addAttribute:NSUnderlineColorAttributeName value:RGB(33,193,193) range:range];
                [attributedString addAttribute:NSFontAttributeName
                                         value:TextFontCu(15)
                                         range:range];
                //行间距
                NSMutableParagraphStyle *paragraphStyle=[[NSMutableParagraphStyle alloc] init];
                [paragraphStyle setLineSpacing:LENGTH(5)];
                [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedString.length)];
            }
            titlabel.attributedText = attributedString;
        }
    }
}
- (void)setZhiShiSHUmodel:(ZhiShiShuModel *)ZhiShiSHUmodel{
    NSString * str = [NSString stringWithFormat:@"知识体系"];
    for (knowledgeGradeModel *knowmodel in ZhiShiSHUmodel.data.knowledgeGrade) {
        str = [str stringByAppendingString:[NSString stringWithFormat:@" > %@",knowmodel.name]];
    }
    NSDictionary *attributeDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                   TextFont(15),NSFontAttributeName,nil];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str attributes:attributeDict];
    __weak ArticleTopView * blockSelf = self;
    if (ZhiShiSHUmodel.data.knowledgeGrade.count == 3) {
        [self addview];
        for (int i = 0; i<ZhiShiSHUmodel.data.knowledgeGrade.count; i++) {
            knowledgeGradeModel *knowmodel = ZhiShiSHUmodel.data.knowledgeGrade[i];
            NSRange range = [str rangeOfString:knowmodel.name];
            if (i == 0) {
                [attributedString yy_setTextHighlightRange:[[attributedString string] rangeOfString:knowmodel.name] color:RGB(3,3,3) backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
                    ZhiShiShuViewController * vc = [ZhiShiShuViewController new];
                    vc.ids = knowmodel._id;
                    [[blockSelf viewController].navigationController pushViewController:vc animated:YES];
                }];
                
                
            }else if (i == 1){
                [attributedString yy_setTextHighlightRange:[[attributedString string] rangeOfString:knowmodel.name] color:RGB(3,3,3) backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
                    knowledgeGradeModel *knowmodel1 = ZhiShiSHUmodel.data.knowledgeGrade[0];
                    ZhiShiShuViewController * vc = [ZhiShiShuViewController new];
                    vc.ids = knowmodel1._id;
                    vc.twoid = knowmodel._id;
                    [[blockSelf viewController].navigationController pushViewController:vc animated:YES];
                }];
            }else if (i  == 2){
                [attributedString yy_setTextHighlightRange:[[attributedString string] rangeOfString:knowmodel.name] color:RGB(3,3,3) backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
                    ZhiShiShuShuViewController * vc = [ZhiShiShuShuViewController new];
                    vc.itemid =knowmodel.knowledge._id;
                    [[blockSelf viewController].navigationController pushViewController:vc animated:YES];
                }];
            }
            [attributedString addAttribute:(NSString *)kCTUnderlineStyleAttributeName
                                     value:[NSNumber numberWithInt:(kCTUnderlineStyleSingle|kCTUnderlinePatternSolid)]
                                     range:range];
            [attributedString addAttribute:NSUnderlineColorAttributeName value:RGB(33,193,193) range:range];
            [attributedString addAttribute:NSFontAttributeName
                                     value:TextFontCu(15)
                                     range:range];
            //行间距
            NSMutableParagraphStyle *paragraphStyle=[[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setLineSpacing:LENGTH(5)];
            [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedString.length)];
        }
        titlabel.attributedText = attributedString;
    }
}
@end
