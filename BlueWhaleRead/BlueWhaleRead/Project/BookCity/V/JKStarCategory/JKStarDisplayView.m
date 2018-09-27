//
//  JKStarDisplayView.m
//  JKStar
//
//  Created by 王冲 on 2018/4/6.
//  Copyright © 2018年 希爱欧科技有限公司. All rights reserved.
//

#import "JKStarDisplayView.h"

#import "UIView+JKUiviewExtension.h"
@interface JKStarDisplayView ()
{
    
    
}

@property(nonatomic,strong)UIView *redSupView;


@end
@implementation JKStarDisplayView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"star_off"];
        
        self.redSupView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
        
        [self addSubview:self.redSupView];
        
        WS(ws);
        [_redSupView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws);
        }];
        
        UIImageView *redImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
        redImageView.image = [UIImage imageNamed:@"star_on"];
        
        [self.redSupView addSubview:redImageView];
        [redImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws);
        }];
        self.redSupView.clipsToBounds = YES;
//        [self layOutSubView];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.redSupView.width = self.width*(_redValue/5.0);

}


- (void)setRedValue:(float)redValue{
    
    _redValue = redValue;
    
    self.redSupView.width = self.width*(_redValue/5.0);

}


@end


