//
//  BaseViewController.h
//  oc-test
//
//  Created by 刘圣洁 on 2022/5/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

- (void)setViewTitle:(NSString *)title;
- (void)setLeftBarButtonWithView:(UIView *)view clickBlock:(void(^)(id data))block;
- (void)setRightBarButtonWithView:(UIView *)view clickBlock:(void(^)(id data))block;
@end

NS_ASSUME_NONNULL_END
