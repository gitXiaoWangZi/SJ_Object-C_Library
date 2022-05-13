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
@end
