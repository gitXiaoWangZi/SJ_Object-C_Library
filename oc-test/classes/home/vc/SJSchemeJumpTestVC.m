//
//  SJSchemeJumpTestVC.m
//  oc-test
//
//  Created by 刘圣洁 on 2022/5/14.
//

#import "SJSchemeJumpTestVC.h"
#import "SJMediator.h"

@interface SJSchemeJumpTestVC ()

@end

@implementation SJSchemeJumpTestVC

+ (void)load{
    [SJMediator registerScheme:@"chemeJump://" block:^(NSDictionary *params) {
        SJSchemeJumpTestVC *vc = [[SJSchemeJumpTestVC alloc] init];
        UINavigationController *nav = params[@"nav"];
        NSString *colorStr = params[@"color"];
        vc.view.backgroundColor = [UIColor colorWithHexString:colorStr];
        [nav pushViewController:vc animated:YES];
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setViewTitle:@"scheme跳过来的"];
    
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.image = [UIImage imageNamed:@"temp"];
    
    __weak typeof(self) weakSelf = self;
    [self setLeftBarButtonWithView:imageV clickBlock:^(id  _Nonnull data) {
        [weakSelf.navigationController popViewControllerAnimated:NO];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
