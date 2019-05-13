//
//  ShouCangMenuView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/14.
//  Copyright © 2019 YS. All rights reserved.
//

#import "ShouCangMenuView.h"
@interface ShouCangMenuView () <UIScrollViewDelegate> {
    UIButton *_selectButton;
    UIScrollView *_titleScroll;
    UIScrollView *_controllerScroll;
    UIView * xian;
    BaseView * backView;
}
@property (nonatomic, strong) NSMutableArray<BaseButton *> *buttonArray;
@property (nonatomic, strong) BaseButton * lastbutton;

@end
@implementation ShouCangMenuView

#pragma mark - 懒加载
- (NSMutableArray *)buttonArray {
    
    if (_buttonArray == nil) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
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
    self.backgroundColor = [UIColor whiteColor];
    WS(ws);
    backView = [[BaseView alloc] init];
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(LENGTH(45));
    }];
}
- (void)setTitarray:(NSArray *)titarray{
    _titarray = titarray;
    _titarray = titarray;
    WS(ws);
    xian = [[UIView alloc] init];
    xian.backgroundColor =RGB(82,199,198);
    [backView addSubview:xian];
    for (int i = 0; i < _titarray.count; i++) {
        BaseButton *titleButton = [BaseButton buttonWithType:UIButtonTypeCustom];
        [titleButton setTitleColor:RGBA(0x31, 0x31, 0x31, 1.0) forState:UIControlStateNormal];
        [titleButton setTitle:_titarray[i] forState:UIControlStateNormal];
        titleButton.titleLabel.font = [UIFont systemFontOfSize:15];
        titleButton.tag = 100+i;
        [titleButton addTarget:self action:@selector(scrollViewSelectToIndex:) forControlEvents:UIControlEventTouchUpInside];
        [backView addSubview:titleButton];
        [self.buttonArray addObject:titleButton];
        
        
        
        if (i ==0 ) {
            self.lastbutton = titleButton;
            _selectButton = titleButton;
            [_selectButton setTitleColor:RGB(82,199,198) forState:UIControlStateNormal];
            
            [xian mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self->_selectButton.mas_bottom).with.offset(-LENGTH(10));
                make.centerX.mas_equalTo(self->_selectButton);
                make.width.mas_equalTo(LENGTH(30));
                make.height.mas_equalTo(@2);
            }];
        }else{
            self.lastbutton = ws.buttonArray[i-1];
        }
        [titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i==0) {
                make.left.equalTo(self->backView).with.offset(0);
                
            }else{
                make.left.equalTo(ws.lastbutton.mas_right).with.offset(0);
                make.width.equalTo(ws.lastbutton);
            }
            make.top.and.bottom.mas_equalTo(self->backView);
        }];
        
    }
    
    self.lastbutton = ws.buttonArray[_titarray.count-1];
    [self.lastbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->backView).offset(0);
    }];
}
// 切换到相应的控制器页面
- (void)scrollViewSelectToIndex:(UIButton *)button{
    
    [self selectButton:button.tag-100];
    // 切换到选中的控制器的view
    [UIView animateWithDuration:0.5 animations:^{
        self->_controllerScroll.contentOffset = CGPointMake(WIDTH*(button.tag-100), 0);
    }];
}
//选择某个按钮
- (void)selectButton:(NSInteger)index
{
    // 如果选中其他的按钮，默认按钮回复原来的字体颜色和大小
    [_selectButton setTitleColor:RGB(31,31,31) forState:UIControlStateNormal];
    
    // 设置选中的按钮
    _selectButton = _buttonArray[index];
    [_selectButton setTitleColor:RGB(82,199,198) forState:UIControlStateNormal];
    [UIView animateWithDuration:0.5 animations:^{
        [self->xian mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self->_selectButton);
            make.bottom.equalTo(self->_selectButton.mas_bottom).with.offset(-LENGTH(10));
            make.width.mas_equalTo(LENGTH(30));
            make.height.mas_equalTo(@2);
        }];
        [self.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
    
    self.blocks(index);
}

- (void)setControllerArray:(NSArray *)controllerArray {
    
    _controllerArray = controllerArray;
    [self setupViewControllerScroll];
}

- (void)setupViewControllerScroll
{
    WS(ws);
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.delegate = self;
    scrollView.scrollEnabled = YES;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws).with.insets(UIEdgeInsetsMake(LENGTH(53), 0, 0, 0));
        scrollView.contentSize = CGSizeMake(scrollView.frame.size.width*self->_controllerArray.count, scrollView.frame.size.height-LENGTH(53));
        
    }];
    
    _controllerScroll = scrollView;
    // 设置scrollView的子视图，即过渡视图contentSize，并设置其约束
    UIView *horizontalContainerView = [[UIView alloc]init];
    [_controllerScroll addSubview:horizontalContainerView];
    [horizontalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self->_controllerScroll);
        make.height.equalTo(self->_controllerScroll);
    }];
    //过渡视图添加子视图
    UIView *previousView =nil;
    for (int i = 0; i < _controllerArray.count; i++) {
        //        UIView *viewcon = [[UIView alloc] initWithFrame:CGRectMake(WIDTH*i, 0, WIDTH, HEIGHT)];
        UITableView *viewcon = _controllerArray[i];
        viewcon.frame = CGRectMake(WIDTH*i, 0, WIDTH, HEIGHT);
        //        viewcon.backgroundColor = RGB(0xf6, 0xf6, 0xf6);
        [scrollView addSubview:viewcon];
        [viewcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(horizontalContainerView);
            make.bottom.equalTo(horizontalContainerView.mas_bottom).with.offset(0);
            
            make.width.equalTo(scrollView);
            
            if (previousView)
            {
                make.left.mas_equalTo(previousView.mas_right);
            }
            else
            {
                make.left.mas_equalTo(0);
            }
        }];
        
        previousView = viewcon;
    }
    // 设置过渡视图的右距（此设置将影响到scrollView的contentSize）
    [horizontalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(previousView.mas_right);
    }];
    
}
//监听滚动事件判断当前拖动到哪一个控制器
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / WIDTH;
    [self selectButton:index];
}
@end
