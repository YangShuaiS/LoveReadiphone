//
//  GZWKWebView.m
//  WKWebView
//
//  Created by zzh on 16/11/2.
//  Copyright © 2016年 Gavin Zeng. All rights reserved.
//

#import "GZWKWebView.h"
#import "UIView+GZExtend.h"

@interface GZWKWebView ()
@property(nonatomic,strong) NSMutableArray *screenShotImages;
@property(nonatomic,assign) NSInteger pageCount;
@property(nonatomic,assign) NSInteger currentPage;
@property(nonatomic,assign) CGPoint oldContentOffset;
@property(nonatomic,copy) void(^complete)(UIImage *);
@property(nonatomic,strong) UIView *snapView;
@end

@implementation GZWKWebView

#pragma mark -- public

- (void)screenShot{
    if (self.currentPage == self.pageCount) {
        //拼接图
        CGSize contentSize = self.scrollView.contentSize;
        CGRect scrollFrame = self.scrollView.frame;
        UIGraphicsBeginImageContextWithOptions(contentSize, NO, [UIScreen mainScreen].scale);
        for (NSInteger i = 0; i < self.screenShotImages.count; i++) {
            UIImage *image = self.screenShotImages[i];
            if (i != self.screenShotImages.count - 1) {
                [image drawInRect:CGRectMake(0, i * scrollFrame.size.height, scrollFrame.size.width, scrollFrame.size.height)];
            }else{
                [image drawInRect:CGRectMake(0, contentSize.height - scrollFrame.size.height, scrollFrame.size.width, scrollFrame.size.height)];
            }
        }
        UIImage *togetherImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.scrollView.contentOffset = self.oldContentOffset;
        });
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.snapView removeFromSuperview];
            if (self.complete) {
                self.complete(togetherImage);
            }
        });
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.currentPage == self.pageCount - 1) {
                self.scrollView.contentOffset = CGPointMake(0, self.scrollView.contentSize.height - self.scrollView.frame.size.height);
            }else{
                self.scrollView.contentOffset = CGPointMake(0, self.currentPage * self.frame.size.height);
            }
        });
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage *image = [self imageFromView];
            [self.screenShotImages addObject:image];
            self.currentPage = self.currentPage + 1;
            [self screenShot];
        });
    }
}


- (void)captureContentImage:(void (^)(UIImage *))complete{
    CGFloat contentHeight = self.scrollView.contentSize.height;
    if (contentHeight <= self.scrollView.frame.size.height) {
        if (complete) {
            complete([self imageFromView]);
        }
        return;
    }
    self.complete = complete;
    self.snapView = [self customSnpaView];
    self.snapView.frame = self.frame;
    [self.superview addSubview:self.snapView];
    
    self.pageCount = ceilf(contentHeight/self.scrollView.frame.size.height);
    self.currentPage = 0;
    self.oldContentOffset = self.scrollView.contentOffset;
    self.screenShotImages = [NSMutableArray arrayWithCapacity:self.pageCount];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self screenShot];
    });
}

- (UIImageView *)customSnpaView{
    UIImage *image = [self imageFromView];
    UIImageView *imageView = [UIImageView new];
    imageView.image = image;
    return imageView;
}
@end
