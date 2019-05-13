//
//  CommentsTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/9.
//  Copyright © 2019 YS. All rights reserved.
//

#import "CommentsTableViewCell.h"

@implementation CommentsTableViewCell{
    UIImageView * touxiang;
    BaseLabel * name;
    BaseLabel * time;
    BaseLabel * title;
    BaseLabel * shanchu;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    self.backgroundColor = [UIColor whiteColor];
    WS(ws);
    touxiang = [UIImageView new];
    touxiang.contentMode = UIViewContentModeScaleAspectFit;
    touxiang.layer.masksToBounds = YES;
    touxiang.layer.cornerRadius = LENGTH(17);
    [self addSubview:touxiang];
    [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(17));
        make.top.mas_equalTo(ws).with.offset(LENGTH(12));
        make.size.mas_equalTo(CGSizeMake(LENGTH(34), LENGTH(34)));
    }];
    
    name = [[BaseLabel alloc] initWithTxteColor:RGB(0, 0, 0) LabelFont:TextFontCu(13) TextAlignment:NSTextAlignmentLeft Text:@"姓名"];
    [self addSubview:name];
    
    time = [[BaseLabel alloc] initWithTxteColor:RGB(150,150,150) LabelFont:TextFont(10) TextAlignment:NSTextAlignmentRight Text:@"2019.13.23"];
    [self addSubview:time];
    
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->touxiang);
        make.left.mas_equalTo(self->touxiang.mas_right).with.offset(LENGTH(11));
        make.right.mas_equalTo(self->time.mas_left).with.offset(-LENGTH(10));
    }];
    
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
        make.centerY.mas_equalTo(self->touxiang);
    }];
    
    title = [[BaseLabel alloc] initWithTxteColor:RGB(0,0,0) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@""];
    title.numberOfLines = 0;
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->name.mas_bottom).with.offset(LENGTH(8));
        make.left.mas_equalTo(self->touxiang.mas_right).with.offset(LENGTH(11));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
    }];
    
    shanchu = [[BaseLabel alloc] initWithTxteColor:RGB(58, 58, 58) LabelFont:TextFontCu(11) TextAlignment:NSTextAlignmentCenter Text:@"删除"];
    [self addSubview:shanchu];
    [shanchu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(7));
        make.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(13));
        make.width.mas_equalTo(LENGTH(34)+LENGTH(22));
    }];
    
    shanchu.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shanchu)];
    [shanchu addGestureRecognizer:tap];
//    shanchu.text = @"";
}

- (void)setModel:(PingLunModel *)model{
    _model = model;
    [touxiang sd_setImageWithURL:URLIMAGE(model.avatar)];
    name.text = model.name;
    title.text = model.comment_content;
    time.text = model.create_time;
    if ([Me.ssid isEqualToString:model.student_id]) {
        shanchu.text = @"删除";
        shanchu.userInteractionEnabled = YES;
    }else{
        shanchu.text = @"";
        shanchu.userInteractionEnabled = NO;
    }
}
- (void)shanchu{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"删除评论"
                                                                   message:@"确认要删除该评论吗？"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                          }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             [self qurenshnchu];
                                                         }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [[self viewController] presentViewController:alert animated:YES completion:nil];
}
- (void)qurenshnchu{
    WS(ws);
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_REMOPINGLUN];
    NSDictionary * dic = @{@"commentid":_model.ssid,@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            ws.blocks(ws.model);
        }
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

@end
