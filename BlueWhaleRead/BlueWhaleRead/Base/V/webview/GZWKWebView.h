//
//  GZWKWebView.h
//  WKWebView
//
//  Created by zzh on 16/11/2.
//  Copyright © 2016年 Gavin Zeng. All rights reserved.
//

#import <WebKit/WebKit.h>

@interface GZWKWebView : WKWebView
- (void)captureContentImage:(void (^)(UIImage *))complete;
@end
