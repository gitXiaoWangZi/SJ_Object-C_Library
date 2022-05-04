//
//  MainTabbarController.m
//  oc-test
//
//  Created by 刘圣洁 on 2022/5/3.
//

#import "MainTabbarController.h"
#import "MainNavigationController.h"
#import "HomeViewController.h"
#import "MineViewController.h"

@interface MainTabbarController ()

@end

@implementation MainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MainNavigationController *homeNav = [self configNavgationVCWithVC:[[HomeViewController alloc] init] title:@"首页" imageName:@"home" slectImageName:@"home_select"];
    MainNavigationController *mineNav = [self configNavgationVCWithVC:[[MineViewController alloc] init] title:@"我的" imageName:@"mine" slectImageName:@"mine_select"];
    [self setViewControllers:@[homeNav,mineNav]];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBar.tintColor = [UIColor purpleColor];
    self.selectedIndex = 0;
}

- (MainNavigationController *)configNavgationVCWithVC:(BaseViewController *)vc title:(NSString *)title imageName:(NSString *)imageName slectImageName:(NSString *)selectImageName{
    MainNavigationController *nav = [[MainNavigationController alloc] initWithRootViewController:vc];
    vc.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:imageName];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return nav;
}

@end
