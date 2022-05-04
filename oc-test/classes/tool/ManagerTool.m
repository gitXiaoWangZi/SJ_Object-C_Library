//
//  ManagerTool.m
//  oc-test
//
//  Created by 刘圣洁 on 2022/5/3.
//

#import "ManagerTool.h"
#import <UIKit/UIKit.h>

@implementation ManagerTool

+ (void)setStatusBarBackgroundColor:(UIColor *)color{
    if (@available(iOS 13.0, *)) {
        static UIView *statusBar = nil;
        if (!statusBar) {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                statusBar = [[UIView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.windowScene.statusBarManager.statusBarFrame];
                [[UIApplication sharedApplication].keyWindow addSubview:statusBar];
                statusBar.backgroundColor = color;
            });
        }else{
            statusBar.backgroundColor = color;
        }
    }else{
        UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
        if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
            statusBar.backgroundColor = color;
        }
    }
}
@end
