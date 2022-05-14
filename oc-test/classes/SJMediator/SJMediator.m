//
//  SJMediator.m
//  oc-test
//
//  Created by 刘圣洁 on 2022/5/13.
//

#import "SJMediator.h"

@implementation SJMediator

+ (__kindof UIViewController *)getHomeDetailVCWithContent:(id)content{
    Class cls = NSClassFromString(@"HomeDetailViewController");
    //对应的两个object是方法中的两个入参值，根据performSelector的方法来看，最多只能有两个参数，参数可以是任意类型，所以我们尽可能的用字典等集合类型来传参
    UIViewController *vc = [[cls alloc] performSelector:NSSelectorFromString(@"initWithContent:color:") withObject:content withObject:[UIColor colorWithHexString:@"#FF0088"]];
    return vc;
}

+ (NSMutableDictionary *)mediatorCache{
    static NSMutableDictionary *cache;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        cache = [NSMutableDictionary dictionary];
    });
    return cache;
}

//scheme跳转
+(void)registerScheme:(NSString *)scheme block:(processBlock)block{
    if (scheme && block) {
        [[[self class] mediatorCache] setObject:block forKey:scheme];
    }
}
+(void)openUrl:(NSString *)url params:(NSDictionary *)params{
    //URL可能需要拆分出scheme进行使用，这里简单直接使用，默认URL就是单纯一个scheme
    processBlock block = [[[self class] mediatorCache] objectForKey:url];
    if (block) {
        block(params);
    }
}


//protocal协议跳转
+ (void)registerProtocal:(Protocol *)protocal class:(Class)class{
    if (protocal && class) {
        [[[self class] mediatorCache] setObject:class forKey:NSStringFromProtocol(protocal)];
    }
}
+ (Class)fetchClassForProtocal:(Protocol *)protocal{
    Class cls = [[[self class] mediatorCache] objectForKey:NSStringFromProtocol(protocal)];
    return cls;
}
@end
