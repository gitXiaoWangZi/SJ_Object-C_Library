//
//  HomeDetailViewController.m
//  oc-test
//
//  Created by 刘圣洁 on 2022/5/3.
//

#import "HomeDetailViewController.h"

@interface HomeDetailViewController ()

@end

@implementation HomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpView];
}

- (void)setUpView{
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.image = [UIImage imageNamed:@"temp"];
    
    __weak typeof(self) weakSelf = self;
    [self setLeftBarButtonWithView:imageV clickBlock:^(id  _Nonnull data) {
        [weakSelf.navigationController popViewControllerAnimated:NO];
    }];
}

@end
