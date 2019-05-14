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
    BaseLabel * rightlabel;
    YYLabel * titlabel;
    NSString * itemid;
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
    itemid = @"";
    self.backgroundColor = [UIColor whiteColor];
    UIImageView * leftimageview = [UIImageView new];
    leftimageview.contentMode = UIViewContentModeScaleAspectFit;
    leftimageview.image = UIIMAGE(@"博万卷-图标");
    [self addSubview:leftimageview];
    [leftimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(18));
        make.centerY.mas_equalTo(ws);
        make.size.mas_equalTo(CGSizeMake(LENGTH(20), LENGTH(17)));
    }];
    
    titlabel = [[YYLabel alloc] init];
    titlabel.font = TextFont(15);
    titlabel.textAlignment = NSTextAlignmentLeft;
    titlabel.text = @"";
    titlabel.textColor = RGB(3,3,3);
//    titlabel.numberOfLines = 2;
//    titlabel.preferredMaxLayoutWidth = WIDTH-LENGTH(40);//设置最大宽度
    [self addSubview:titlabel];
    [titlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftimageview.mas_right).with.offset(LENGTH(11));
        make.top.mas_equalTo(ws).with.offset(LENGTH(16));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(15));
    }];
    
    rightlabel = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@""];
    rightlabel.backgroundColor = RGB(37, 155, 242);
    rightlabel.layer.cornerRadius = LENGTH(10);
    rightlabel.layer.masksToBounds = YES;
    [self addSubview:rightlabel];
    [rightlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(25));
        make.centerY.mas_equalTo(ws);
        make.size.mas_equalTo(CGSizeMake(LENGTH(43), LENGTH(20)));
    }];
    rightlabel.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(push)];
    [rightlabel addGestureRecognizer:tap];
}

- (void)setModel:(LunBoTuXQModel *)model{
    _model = model;
    if (model.knowledgeGrade.count ==3) {
        [self addview];
        NSString * str = [NSString stringWithFormat:@""];
        for (int i = 0 ; i < model.knowledgeGrade.count; i++) {
            knowledgeGradeModel * knowmodel  = model.knowledgeGrade[i];
            if (i == 1) {
                str = [str stringByAppendingString:[NSString stringWithFormat:@"%@ > ",knowmodel.name]];
            }else if (i == 2){
                str = [str stringByAppendingString:[NSString stringWithFormat:@"%@",knowmodel.name]];
            }else{
                rightlabel.text = knowmodel.name;
                itemid = knowmodel._id;
            }
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
//                    [attributedString yy_setTextHighlightRange:[[attributedString string] rangeOfString:knowmodel.name] color:RGB(3,3,3) backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
//                        ZhiShiShuViewController * vc = [ZhiShiShuViewController new];
//                        vc.ids = knowmodel._id;
//                        [[blockSelf viewController].navigationController pushViewController:vc animated:YES];
//                    }];
                    
                    
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
    NSString * str = [NSString stringWithFormat:@""];
    if ([ZhiShiSHUmodel.data.knowledgeGrade isKindOfClass:[NSMutableArray class]]) {
        if (ZhiShiSHUmodel.data.knowledgeGrade.count== 3) {
            [self addview];
            for (int i = 0 ; i < ZhiShiSHUmodel.data.knowledgeGrade.count; i++) {
                knowledgeGradeModel * knowmodel  = ZhiShiSHUmodel.data.knowledgeGrade[i];
                if (i == 1) {
                    str = [str stringByAppendingString:[NSString stringWithFormat:@"%@ > ",knowmodel.name]];
                }else if (i == 2){
                    str = [str stringByAppendingString:[NSString stringWithFormat:@"%@",knowmodel.name]];
                }else{
                    rightlabel.text = knowmodel.name;
                    itemid = knowmodel._id;
                }
            }
            NSDictionary *attributeDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                           TextFont(15),NSFontAttributeName,nil];
            
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str attributes:attributeDict];
            __weak ArticleTopView * blockSelf = self;
            if (ZhiShiSHUmodel.data.knowledgeGrade.count == 3) {
                for (int i = 0; i<ZhiShiSHUmodel.data.knowledgeGrade.count; i++) {
                    knowledgeGradeModel *knowmodel = ZhiShiSHUmodel.data.knowledgeGrade[i];
                    NSRange range = [str rangeOfString:knowmodel.name];
                    if (i == 0) {
                        
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
       
    }
}

- (void)push{
    ZhiShiShuViewController * vc = [ZhiShiShuViewController new];
    vc.ids = itemid;
    [[self viewController].navigationController pushViewController:vc animated:YES];
}
@end
