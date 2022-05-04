//
//  UIGestureRecognizer+Block.m
//  oc-test
//
//  Created by 刘圣洁 on 2022/5/3.
//

#import "UIGestureRecognizer+Block.h"
#import <objc/runtime.h>

@implementation UIGestureRecognizer (Block)

static const int target_key;

+ (instancetype)sj_gestureRecognizerWithActionBlock:(SJGesturBlock)block{
    __typeof(self) weakSelf = self;
    return [[weakSelf alloc] initWithActionBlock:block];
}

- (instancetype)initWithActionBlock:(SJGesturBlock)block{
    self = [self init];
    [self addActionBlock:block];
    [self addTarget:self action:@selector(sj_tapClick:)];
    return self;
}

- (void)addActionBlock:(SJGesturBlock)block{
    if (block) {
        objc_setAssociatedObject(self, &target_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

- (void)sj_tapClick:(id)sender{
    SJGesturBlock block = objc_getAssociatedObject(self, &target_key);
    if (block) {
        block(sender);
    }
}
@end
