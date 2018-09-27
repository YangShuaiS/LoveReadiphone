//
//  JoinBookCityTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "JoinBookCityTableViewCell.h"
#import "BookCityXunZhang.h"
@implementation JoinBookCityTableViewCell{
    FLAnimatedImageView * leftImage;
    BaseLabel * Title;
    BaseLabel * subtitle;
    BaseLabel * fuwenben;
    //    BaseView * downview;
    FLAnimatedImageView * RightImage;
    BaseButton * ComeOn;
    
    BookCityXunZhang * xunzhangone;
    
    BaseLabel * title;
    
    BaseLabel * like;
    BaseLabel * nolike;
    FLAnimatedImageView * likeimage;
    FLAnimatedImageView * nolikeimage;
    BaseLabel * JoinBookCity;
    FLAnimatedImageView * rightImageView;
    BaseView * rightView;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{

    
    leftImage = [FLAnimatedImageView new];
    leftImage.contentMode = UIViewContentModeScaleAspectFit;
    leftImage.image = UIIMAGE(ZHANWEITUSHU);
    [self addSubview:leftImage];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(26,26,26) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:Title];
    
    _jKStarDisplayView = [[JKStarDisplayView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.jKStarDisplayView.redValue = [@"4.3" floatValue];
    [self addSubview:self.jKStarDisplayView];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(122,120,120) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:subtitle];
    
    fuwenben = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(122,120,120) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"阅读分级: 99 分值: 80"];
    [self addSubview:fuwenben];
    
    
    WS(ws);
    [leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(20));
        make.left.equalTo(ws).with.offset(LENGTH(20));
        make.width.mas_equalTo(LENGTH(100));
        make.height.mas_equalTo(LENGTH(140));
        //        make.height.equalTo(self->leftImage.mas_width).multipliedBy(1.5);
        make.bottom.equalTo(ws).with.offset(-LENGTH(20));
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->leftImage.mas_top).with.offset(LENGTH(3));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(16));
        make.right.equalTo(ws).with.offset(-12);
    }];
    
    [_jKStarDisplayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(6));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(16));
        make.width.mas_equalTo(LENGTH(80));
        make.height.mas_equalTo(LENGTH(14));
        //       make.right.equalTo(ws).with.offset(-12);
    }];
    
    
    
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.jKStarDisplayView.mas_bottom).with.offset(LENGTH(16));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(16));
        make.right.equalTo(ws).with.offset(-12);
    }];
    
    [fuwenben mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(15));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(16));
        make.right.equalTo(ws).with.offset(-12);
//        make.width.mas_equalTo(LENGTH(200));
        //        make.bottom.equalTo(self->leftImage.mas_bottom).with.offset(LENGTH(0));
    }];
    
    xunzhangone = [BookCityXunZhang new];
    [self addSubview:xunzhangone];
    xunzhangone.hidden = YES;
    
    [xunzhangone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->leftImage.mas_right).with.offset(LENGTH(18));
        make.top.mas_equalTo(self->fuwenben.mas_bottom).with.offset(LENGTH(5));
        make.width.mas_equalTo(LENGTH(96));
        make.height.mas_equalTo(LENGTH(36));
    }];
    
    rightView = [BaseView new];
    rightView.backgroundColor = RGB(1,195,193);;
    rightView.layer.masksToBounds = YES;
    rightView.layer.cornerRadius = LENGTH(15);
    [self addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws.mas_right).with.offset(-LENGTH(15));
        make.centerY.mas_equalTo(self->xunzhangone.mas_centerY);
        make.width.mas_equalTo(LENGTH(103));
        make.height.mas_equalTo(LENGTH(30));
    }];
    
    JoinBookCity= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:WhitColor LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"加入书架"];
    [rightView addSubview:JoinBookCity];
    [JoinBookCity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self->rightView);
    }];
    
    rightImageView = [FLAnimatedImageView new];
    rightImageView.image = UIIMAGE(@"icon_书籍详情_选中对勾");
    [rightView addSubview:rightImageView];
    [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->rightView.mas_centerY);
        make.width.mas_equalTo(LENGTH(20));
        make.height.mas_equalTo(LENGTH(20));
        make.right.mas_equalTo(self->JoinBookCity.mas_left).with.offset(-LENGTH(66));
    }];
    
    rightView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Join)];
    [rightView addGestureRecognizer:tap];
}

- (void)Join{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_JOOINBOOKCITY];
    //studentid 学生id
    NSDictionary * dic = @{@"bookid":_allmodel.ssid,@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            BookCityModel * model = [BookCityModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self addBook];
                
            }
        }else{
            
        }
    }];
}
- (void)addBook{
    JoinBookCity.text = @"已加入";
    rightView.userInteractionEnabled = NO;
    _allmodel.joinstyle = 1;
    self.block();
    [UIView animateWithDuration:1 animations:^{
        [self->rightImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self->JoinBookCity.mas_left).with.offset(-LENGTH(5));
        }];
        [self->rightImageView layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setAllmodel:(AllBookListModel *)allmodel{
    _allmodel = allmodel;
    
    xunzhangone.hidden = YES;
    [leftImage sd_setImageWithURL:URLIMAGE(allmodel.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    Title.text = allmodel.name;
    self.jKStarDisplayView.redValue = [allmodel.mark floatValue];
    subtitle.text = allmodel.author;
    
    NSString * onetextstr = [NSString stringWithFormat:@"阅读分级: %@ 分值: %@",allmodel.levels,allmodel.b_score];
    fuwenben.text = onetextstr;
    
    NSMutableArray * array = allmodel.badgeList;
    if (array.count == 0) {
    }else if (array.count > 0&&xunzhangone!=nil){
        xunzhangone.hidden = NO;
        xunzhangone.model = array[0];
    }
    
    
    if (allmodel.is_read == 0) {
        JoinBookCity.text = @"加入书架";
        rightView.userInteractionEnabled = YES;
        [UIView animateWithDuration:1 animations:^{
            [self->rightImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self->JoinBookCity.mas_left).with.offset(-LENGTH(66));
            }];
            [self->rightImageView layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    }else{
        JoinBookCity.text = @"已加入";
        rightView.userInteractionEnabled = NO;
        [UIView animateWithDuration:1 animations:^{
            [self->rightImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self->JoinBookCity.mas_left).with.offset(-LENGTH(5));
            }];
            [self->rightImageView layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    }
}
@end
