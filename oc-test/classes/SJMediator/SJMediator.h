//
//  SJMediator.h
//  oc-test
//
//  Created by 刘圣洁 on 2022/5/13.
//

#import <Foundation/Foundation.h>

@protocol SJProtocalJumpViewControllerProtocal <NSObject>

- (UIViewController *)jumpVCWithParams:(NSDictionary *_Nullable)params;

@end

NS_ASSUME_NONNULL_BEGIN

@interface SJMediator : NSObject
//target-action方式
+ (__kindof UIViewController *)getHomeDetailVCWithContent:(id)content;
//scheme跳转
typedef void(^processBlock)(NSDictionary *params);
+(void)registerScheme:(NSString *)scheme block:(processBlock)block;
+(void)openUrl:(NSString *)url params:(NSDictionary *)params;
//protocal协议跳转
+ (void)registerProtocal:(Protocol *)protocal class:(Class)class;
+ (Class)fetchClassForProtocal:(Protocol *)protocal;
@end

NS_ASSUME_NONNULL_END
