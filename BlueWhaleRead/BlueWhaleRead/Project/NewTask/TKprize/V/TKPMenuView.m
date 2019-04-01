//
//  TKPMenuView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/28.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "TKPMenuView.h"
@interface TKPMenuView () <UIScrollViewDelegate> {
    
    UIButton *_selectButton;
    UIScrollView *_titleScroll;
    UIScrollView *_controllerScroll;
}
@property (nonatomic, strong) NSMutableArray<BaseButton *> *buttonArray;
@property (nonatomic, strong) BaseButton * lastbutton;

@end
@implementation TKPMenuView{
    UIImageView * imageView;
}

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
    imageView = [UIImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = UIIMAGE(@"切换按钮1");
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(19));
        make.width.mas_equalTo(LENGTH(258));
        make.height.mas_equalTo(LENGTH(34));
        make.centerX.mas_equalTo(ws);
    }];
    imageView.userInteractionEnabled = YES;
}
- (void)setTitarray:(NSArray *)titarray{
    _titarray = titarray;
    WS(ws);
    for (int i = 0; i < _titarray.count; i++) {
        BaseButton *titleButton = [BaseButton buttonWithType:UIButtonTypeCustom];
        [titleButton setTitleColor:RGB(3,3,3) forState:UIControlStateNormal];
        [titleButton setTitle:_titarray[i] forState:UIControlStateNormal];
        titleButton.titleLabel.font = TextFontCu(18);
        titleButton.tag = 100+i;
        [titleButton addTarget:self action:@selector(scrollViewSelectToIndex:) forControlEvents:UIControlEventTouchUpInside];
        [imageView addSubview:titleButton];
        [self.buttonArray addObject:titleButton];
        
        
        
        if (i ==0 ) {
            self.lastbutton = titleButton;
            _selectButton = titleButton;
        }else{
            self.lastbutton = ws.buttonArray[i-1];
        }
        [titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i==0) {
                make.left.equalTo(self->imageView).with.offset(0);
                
            }else{
                make.left.equalTo(ws.lastbutton.mas_right).with.offset(0);
                make.width.equalTo(ws.lastbutton);
            }
            make.top.and.bottom.mas_equalTo(self->imageView);
        }];
        
    }
    
    self.lastbutton = ws.buttonArray[_titarray.count-1];
    [self.lastbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->imageView).offset(0);
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
    if (index == 0) {
        imageView.image = UIIMAGE(@"切换按钮1");
    }else{
        imageView.image = UIIMAGE(@"切换2");

    }
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
