//
//  SJProtocalJumpViewController.m
//  oc-test
//
//  Created by 刘圣洁 on 2022/5/14.
//

#import "SJProtocalJumpViewController.h"

@interface SJProtocalJumpViewController ()

@end

@implementation SJProtocalJumpViewController

+ (void)load{
    [SJMediator registerProtocal:@protocol(SJProtocalJumpViewControllerProtocal) class:[self class]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIViewController *)jumpVCWithParams:(NSDictionary * _Nullable)params {
//    NSString *colorStr = params[@"color"];
    UIViewController *vc = [[[self class] alloc] init];
//    vc.view.backgroundColor = [UIColor colorWithHexString:colorStr];
    return vc;
}

@end
