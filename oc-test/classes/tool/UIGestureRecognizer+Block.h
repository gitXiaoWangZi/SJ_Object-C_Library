//
//  UIGestureRecognizer+Block.h
//  oc-test
//
//  Created by 刘圣洁 on 2022/5/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^SJGesturBlock)(id gestureRecognizer);

@interface UIGestureRecognizer (Block)

+ (instancetype)sj_gestureRecognizerWithActionBlock:(SJGesturBlock)block;
@end

NS_ASSUME_NONNULL_END
