//
//  AchievementTableViewCell.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "AchievementTableViewCell.h"
#import "AchievementView.h"
@implementation AchievementTableViewCell{
    AchievementView * topView;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    self.backgroundColor = [UIColor clearColor];
    
    topView = [AchievementView new];
    topView.layer.masksToBounds = YES;
    topView.layer.cornerRadius = LENGTH(10);
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(10));
        make.left.mas_equalTo(ws).with.offset(LENGTH(15));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(15));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(8));
    }];
}
- (void)setGlossaryNum:(NSInteger)glossaryNum{
    _glossaryNum = glossaryNum;
    topView.glossaryNum = _glossaryNum;
}
-(void)setLiteracyNum:(NSInteger)literacyNum{
    _literacyNum = literacyNum;
    topView.literacyNum = _literacyNum;
}
- (void)setMyReadNum:(NSInteger)myReadNum{
    _myReadNum = myReadNum;
    topView.myReadNum = _myReadNum;
}
- (void)setName:(NSString *)name{
    if (_name == nil) {
        _name = name;
        topView.style = _style;
        switch (_style) {
            case ChartStyleRadar:
                topView.readBalance = _readBalance;
                break;
            case ChartStyleRadarNengLi:
                topView.readPower = _readPower;
                break;
            case ChartStyleYueDuLiang:
                topView.readNum = _readNum;
                break;
            case ChartStyleSHIZI:
                topView.literacy = _literacy;
                break;
            case ChartStyleSHICI:
                topView.glossary = _glossary;
                break;
            case ChartStyleBarCharts:
                
                break;
            case ChartStyleBarLine:
                
                break;
            default:
                break;
        }
        topView.name = name;
    }
}
#pragma mark -------------------- 雷达图
- (void)addRadar{
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
