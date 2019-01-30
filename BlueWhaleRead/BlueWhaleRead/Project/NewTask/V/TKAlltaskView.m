//
//  TKAlltaskView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKAlltaskView.h"
#import "TKYuanQuan.h"

@implementation TKAlltaskView{
    UIView * backview;
    TKYuanQuan * yqone;
    TKYuanQuan * yqtwo;
    
    UIImageView * backimageview;
    BaseLabel * name;
    BaseLabel * yd;
    BaseLabel * lq;
    
    BaseLabel * cjtime;
    UIImageView * shanchu;

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
    backview = [UIView new];
    backview.backgroundColor = RGB(255, 255, 255);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(LENGTH(10), LENGTH(20), LENGTH(10), LENGTH(20)));
    }];
    backview.layer.shadowOpacity = 0.24;
    backview.layer.shadowRadius = LENGTH(8);
    backview.layer.shadowOffset = CGSizeMake(0,4);
    backview.layer.cornerRadius = LENGTH(12);
    
    
    backimageview = [UIImageView new];
    backimageview.layer.masksToBounds = YES;
    backimageview.layer.cornerRadius = LENGTH(12);
    backimageview.contentMode = UIViewContentModeScaleAspectFill;
    backimageview.layer.masksToBounds = YES;
    [backview addSubview:backimageview];
    [backimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->backview);
        make.height.mas_equalTo(LENGTH(110));
    }];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFontCu(19) TextAlignment:NSTextAlignmentLeft Text:@"任务"];
    [backview addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backview).with.offset(LENGTH(25));
        make.top.mas_equalTo(self->backview).with.offset(LENGTH(20));
    }];
    
    yqone = [TKYuanQuan new];
    [backview addSubview:yqone];
    [yqone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backview).with.offset(LENGTH(26));
        make.top.mas_equalTo(self->name.mas_bottom).with.offset(LENGTH(18));
    }];
    
    yqtwo = [TKYuanQuan new];
    [backview addSubview:yqtwo];
    [yqtwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backview).with.offset(LENGTH(26));
        make.top.mas_equalTo(self->yqone.mas_bottom).with.offset(LENGTH(13));
    }];
    
    lq = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFontCu(12) TextAlignment:NSTextAlignmentLeft Text:@"298736人已领取"];
    [self addSubview:lq];
    [lq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->yqone.mas_right).with.offset(LENGTH(8));
        make.centerY.mas_equalTo(self->yqone);
        
    }];
    
    yd = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFontCu(12) TextAlignment:NSTextAlignmentLeft Text:@"298736人已完成"];
    [backview addSubview:yd];
    [yd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->yqtwo.mas_right).with.offset(LENGTH(8));
        make.centerY.mas_equalTo(self->yqtwo);
    }];
    
    cjtime = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFontCu(12) TextAlignment:NSTextAlignmentLeft Text:@""];
    [backview addSubview:cjtime];
    [cjtime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backview).with.offset(LENGTH(26));
        make.top.mas_equalTo(self->name.mas_bottom).with.offset(LENGTH(5));
    }];
    cjtime.hidden = YES;
    
    shanchu = [UIImageView new];
    shanchu.contentMode = UIViewContentModeScaleAspectFit;
    shanchu.image = UIIMAGE(@"删除");
    [backview addSubview:shanchu];
    [shanchu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backview).with.offset(LENGTH(23));
        make.bottom.mas_equalTo(self->backview.mas_bottom).with.offset(-LENGTH(17));
        make.width.and.height.mas_equalTo(LENGTH(19));
    }];
    shanchu.hidden = YES;
    shanchu.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shanchu)];
    //将手势添加到需要相应的view中去
    [shanchu addGestureRecognizer:tapviewtap];
    
}
- (void)shanchu{
    [[MBProgressHUDYS SharedMBProgressHUDYS] addview:self.window];
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TASKREMOVE];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"missionid":_model.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            TKMymissionListModel * model = [TKMymissionListModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [[MBProgressHUDYS SharedMBProgressHUDYS] shoumessage:@"删除成功"];
                [[MBProgressHUDYS SharedMBProgressHUDYS] hideAnimated:YES afterDelay:1];
                self.block();
            }else{
                [[MBProgressHUDYS SharedMBProgressHUDYS] shoumessage:@"删除失败"];
                [[MBProgressHUDYS SharedMBProgressHUDYS] hideAnimated:YES afterDelay:1];
            }
        }else{
        }
    }];
}
- (void)setModel:(TKTaskListModel *)model{
    _model = model;
    NSMutableArray * colorarray = [BaseObject TaskColorArray:[model.mission_type integerValue]];
    UIColor * backcolor = colorarray[5];
    backview.layer.shadowColor = backcolor.CGColor;
    yqone.wview.backgroundColor = colorarray[6];
    yqtwo.wview.backgroundColor = colorarray[6];
    [backimageview sd_setImageWithURL:URLIMAGE(model.mission_background)];
    
    TKAlltaskStyle style = [model.mission_type integerValue];
    if (style == 1) {
        
    }else if (style == 3){
        [self addTKAlltaskStyleZJALL];
    }else{
        [self addTKAlltaskStyleZJ];
    }
}

- (void)addTKAlltaskStyleZJ{
    name.text = _model.mission_name;
    yqone.hidden = NO;
    yqtwo.hidden = NO;
    cjtime.hidden = YES;
    shanchu.hidden = YES;
    yd.text = [NSString stringWithFormat:@"%@人已完成",_model.completedNum];
    lq.text = [NSString stringWithFormat:@"%@人已领取",_model.receiveNum];
}

- (void)addTKAlltaskStyleZJALL{
    name.text = _model.mission_name;
    yqone.hidden = YES;
    yqtwo.hidden = YES;
    shanchu.hidden = NO;
    yd.text = @"";
    lq.text = @"";
    cjtime.hidden = NO;
    cjtime.text = [NSString stringWithFormat:@"%@  创建",_model.create_time];
}

@end
