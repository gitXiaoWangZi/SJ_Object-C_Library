//
//  SceneDelegate.m
//  oc-test
//
//  Created by 刘圣洁 on 2022/5/3.
//

#import "SceneDelegate.h"
#import "ManagerTool.h"
#import "MainTabbarController.h"
#ifdef DEBUG
#import <DoraemonKit/DoraemonManager.h>
#endif
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    if (@available(ios 13.0, *)) {
        
#ifdef DEBUG
        [[DoraemonManager shareInstance] installWithPid:@"productId"];//productId为在“平台端操作指南”中申请的产品id
#endif
        
        UIWindowScene *windowScene = (UIWindowScene *)scene;
        [self.window setWindowScene:windowScene];
        self.window.backgroundColor = [UIColor whiteColor];
        MainTabbarController *tabbarVC = [[MainTabbarController alloc] init];
        self.window.rootViewController = tabbarVC;
        
        [ManagerTool setStatusBarBackgroundColor:[UIColor whiteColor]];
        [self.window makeKeyAndVisible];
    }else{
        
    }
}

- (void)scene:(UIScene *)scene openURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts{

    NSArray *members = [URLContexts allObjects];
        UIOpenURLContext *urlContext = [members firstObject];
    NSLog(@"%@",urlContext.URL);
    
    NSLog(@"URL scheme: %@", [urlContext.URL scheme]);
    NSArray *paramsArr = [[urlContext.URL query] componentsSeparatedByString:@"&"];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    for (NSString *str in paramsArr) {
        [params setObject:[str componentsSeparatedByString:@"="].lastObject forKey:[str componentsSeparatedByString:@"="].firstObject];
    }
    NSLog(@"params: %@", params);
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
