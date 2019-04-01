//
//  NBookXQTopView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/18.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NBookXQTopView.h"
#import "NBTCollectionView.h"
#import "JYEqualCellSpaceFlowLayout.h"
#import "NewBookTopClickModel.h"
#import "NBXQJJALLView.h"
@implementation NBookXQTopView{
    FLAnimatedImageView * leftImageView;
    UIView * yy;
    BaseLabel * Title;
    BaseLabel * subtitle;
    BaseLabel * dengji;
    BaseLabel * ydcs;
    NBTCollectionView * collectView;
    BaseLabel * jjxq;
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
    self.userInteractionEnabled = YES;
    self.backgroundColor = [UIColor whiteColor];
    
    UIView * yinyig = [UIView new];
    yinyig.backgroundColor = [UIColor whiteColor];
    [self addSubview:yinyig];
    [yinyig mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(20));
        make.top.equalTo(ws).with.offset(17);
        make.width.mas_equalTo(LENGTH(110));
        make.height.equalTo(yinyig.mas_width).multipliedBy(1.4283333333);
    }];
    yinyig.layer.shadowOpacity = 0.16;
    yinyig.layer.shadowColor = [UIColor blackColor].CGColor;
    yinyig.layer.shadowRadius = LENGTH(4);
    yinyig.layer.shadowOffset = CGSizeMake(0,0);
    yinyig.layer.cornerRadius = LENGTH(5);
    
    yy = [UIView new];
    yy.backgroundColor = [UIColor whiteColor];
    [self addSubview:yy];
    [yy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(20));
        make.top.equalTo(ws).with.offset(17);
        make.width.mas_equalTo(LENGTH(110));
        make.height.equalTo(self->yy.mas_width).multipliedBy(1.4283333333);
    }];
    
    leftImageView = [FLAnimatedImageView new];
    leftImageView.image = UIIMAGE(@"发现_你的同学_书缺省位置");
    leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    [yy addSubview:leftImageView];
    [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->yy);
    }];
    
    UIImageView * xian = [UIImageView new];
    xian.image = UIIMAGE(@"书线");
    [yy addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.and.left.mas_equalTo(self->yy);
        make.width.mas_equalTo(LENGTH(9));
    }];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(31,31,31) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    Title.numberOfLines = 1;
    [self addSubview:Title];
    
    
    UIView * backxx = [UIView new];
    backxx.backgroundColor = RGBA(0, 0, 0, 0.6);
    [leftImageView addSubview:backxx];
    
    _jKStarDisplayView = [[JKStarDisplayView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.jKStarDisplayView.redValue = [@"0" floatValue];
    [leftImageView addSubview:self.jKStarDisplayView];
    [backxx mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.jKStarDisplayView).with.insets(UIEdgeInsetsMake(-LENGTH(2), -LENGTH(2), -LENGTH(2), -LENGTH(2)));
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImageView.mas_right).with.offset(LENGTH(18));
        make.top.equalTo(self->leftImageView.mas_top).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(-LENGTH(20));
    }];
    
    [_jKStarDisplayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->leftImageView.mas_right).with.offset(-LENGTH(2));
        make.bottom.equalTo(self->leftImageView.mas_bottom).with.offset(-LENGTH(2));
        make.width.mas_equalTo(LENGTH(80));
        make.height.mas_equalTo(LENGTH(13));
    }];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(153,153,153) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"作者："];
    [self addSubview:subtitle];
    
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImageView.mas_right).with.offset(LENGTH(18));
        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(6));
        make.right.equalTo(ws).with.offset(-LENGTH(18));
    }];
    
    dengji = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(153,153,153) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"阅读分级："];
    [self addSubview:dengji];
    
    [dengji mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImageView.mas_right).with.offset(LENGTH(18));
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(6));
        make.right.equalTo(ws).with.offset(-LENGTH(18));
    }];
    
    UIImageView * huo = [UIImageView new];
    huo.contentMode = UIViewContentModeScaleAspectFit;
    huo.image = UIIMAGE(@"阅读次数-火");
    [self addSubview:huo];
    
    ydcs = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(102,102,102) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"0次阅读"];
    [self addSubview:ydcs];
    
    [huo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->dengji.mas_bottom).with.offset(LENGTH(60));
        make.left.equalTo(self->leftImageView.mas_right).with.offset(LENGTH(18));
        make.width.mas_equalTo(LENGTH(13.5));
        make.height.mas_equalTo(LENGTH(15.5));
    }];
    
    [ydcs mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(huo.mas_right).with.offset(LENGTH(3));
        make.centerY.mas_equalTo(huo);
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(WIDTH/4,LENGTH(81));
//    flowLayout.estimatedItemSize = CGSizeMake(20, 60);  // layout约束这边必须要用estimatedItemSize才能实现自适应,使用itemSzie无效
    
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(0);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(0);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(0), 0, LENGTH(0));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[NBTCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->yy.mas_bottom);
        make.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(81));
    }];
    [collectView setBlock:^{
        [ws UpDengLu];
    }];
    UIView * downxian = [UIView new];
    downxian.backgroundColor = RGB(229,229,229);
    [self addSubview:downxian];
    [downxian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->collectView.mas_bottom);
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
        make.height.mas_equalTo(1);
    }];
    
    BaseLabel * jj = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentLeft Text:@"简介"];
    [self addSubview:jj];
    [jj mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(downxian.mas_bottom).with.offset(LENGTH(10));
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
    }];
    
    jjxq = [[BaseLabel alloc] initWithTxteColor:RGB(175, 175, 175) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@""];
    jjxq.numberOfLines = 2;
    [self addSubview:jjxq];
    [jjxq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(21));
        make.top.mas_equalTo(jj.mas_bottom).with.offset(LENGTH(10));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(54));
        make.bottom.equalTo(ws.mas_bottom).with.offset(-LENGTH(20));
    }];
    
    UIImageView * rightimage = [UIImageView new];
    rightimage.contentMode = UIViewContentModeScaleAspectFit;
    rightimage.image = UIIMAGE(@"icon_个人资料_箭头");
    rightimage.image = [rightimage.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
    rightimage.tintColor = RGB(153,153,153);
    [self addSubview:rightimage];
    [rightimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->jjxq);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
        make.size.mas_equalTo(CGSizeMake(LENGTH(7.5), LENGTH(13)));
    }];
    
    UIView * rightview = [UIView new];
    [self addSubview:rightview];
    [rightview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.mas_equalTo(self->jjxq);
        make.right.mas_equalTo(ws);
        make.left.mas_equalTo(self->jjxq.mas_right);
    }];
    
    rightview.userInteractionEnabled = YES;
    UITapGestureRecognizer *wjmmtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(push)];
    //将手势添加到需要相应的view中去
    [rightview addGestureRecognizer:wjmmtap];
    
}
- (void)setModel:(BookXQModel *)model{
    _model = model;
    [leftImageView sd_setImageWithURL:URLIMAGE(model.book.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    Title.text = model.book.name;
    
    NSString * zuozhe = [NSString stringWithFormat:@"作者：%@",model.book.author];
    AttributedStringModel * zzmodel = [AttributedStringModel new];
    zzmodel.textString = zuozhe;
    zzmodel.bianString = model.book.b_score;
    zzmodel.color = RGB(102,102,102);
    NSArray * zuozhearray = @[zzmodel];
    NSMutableAttributedString *AttributedZZStr = [BaseObject Attributed:zuozhearray];
    subtitle.attributedText = AttributedZZStr;
    
    NSString * str = [NSString stringWithFormat:@"阅读分级：%@ 分值：%@",model.book.levels,model.book.b_score];
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = str;
    model1.bianString = model.book.levels;
    model1.color = RGB(102,102,102);
    
    AttributedStringModel * model2 = [AttributedStringModel new];
    model2.textString = str;
    model2.bianString = model.book.b_score;
    model2.color = RGB(102,102,102);
    NSArray * modelarray = @[model1,model2];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    dengji.attributedText = AttributedStr;
    
    ydcs.text = [NSString stringWithFormat:@"%@次阅读",model.book.read_times];
    self.jKStarDisplayView.redValue = [model.book.mark floatValue];
    
    NSMutableArray * arrays = [NSMutableArray array];
    for (int i = 0; i < 4; i ++) {
        NewBookTopClickModel * clickmodel = [NewBookTopClickModel new];
        if (i == 0) {
            clickmodel.title = @"我喜欢";
            if (_model.book.is_like==0) {
                clickmodel.image =@"组 457";
            }else{
                clickmodel.image =@"组 459";
            }
            clickmodel.is_like = _model.book.is_like;
            clickmodel.style = 0;
        }
        
        if (i == 1) {
            clickmodel.title = @"去答题";
            if (_model.book.is_read == 0) {
                clickmodel.image = @"组 455";
                clickmodel.style = 0;
            }else if (_model.book.is_read == 1){
                clickmodel.image = @"组 455";
                clickmodel.style = 0;
                if (_model.book.dayTimes<=0) {
                    clickmodel.downtitle = @"(明日再来)";
                    clickmodel.image = @"组 4500";
                    clickmodel.style = 1;
                }
            }else{
                clickmodel.image = @"组 4500";
                clickmodel.style = 1;
            }
        }
        if (i == 2) {
            if (model.bookBuyLink.count == 0) {
                clickmodel.title = @"去购买";
//                clickmodel.image = @"组 417";
                clickmodel.image = @"组 461";
                clickmodel.style = 1;
            }else{
                clickmodel.title = @"去购买";
                clickmodel.image = @"组 417";
                //            clickmodel.image = @"组 461";
                clickmodel.style = 0;
            }

        }
        
        if (i == 3) {
            clickmodel.title = @"在线阅读";
            if ([_model.book.b_download isEqualToString:@""]) {
                clickmodel.image = @"组 463";
                clickmodel.style = 1;
            }else{
                clickmodel.image = @"组 433";
                clickmodel.style = 0;
            }

        }
        [arrays addObject:clickmodel];
    }
    collectView.bookid = model.book.ssid;
    collectView.is_read = model.book.is_read;
    collectView.model = model;
    collectView.itemArray = arrays;
    jjxq.text = model.book.info;
}

- (void)push{
    WS(ws);
    NBXQJJALLView * view = [NBXQJJALLView new];
    view.model = _model;
    [[self viewController].view.window addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo([ws viewController].view.window);
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];

    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:yy.bounds byRoundingCorners:UIRectCornerBottomRight | UIRectCornerTopRight cornerRadii:CGSizeMake(LENGTH(5),LENGTH(5))];
    //创建 layer
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = yy.bounds;
    //赋值
    maskLayer.path = maskPath.CGPath;
    yy.layer.mask = maskLayer;
    
}
@end
