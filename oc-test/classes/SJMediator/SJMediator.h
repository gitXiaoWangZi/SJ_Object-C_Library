//
//  SJMediator.h
//  oc-test
//
//  Created by 刘圣洁 on 2022/5/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SJMediator : NSObject

+ (__kindof UIViewController *)getHomeDetailVCWithContent:(id)content;
@end

NS_ASSUME_NONNULL_END
