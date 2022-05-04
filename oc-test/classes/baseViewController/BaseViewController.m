//
//  BaseViewController.m
//  oc-test
//
//  Created by 刘圣洁 on 2022/5/3.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property (nonatomic,strong) UIView *navView;
@property (nonatomic,strong) UIButton *leftButton;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *rightButton;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationController.navigationBarHidden = YES;
    //创建导航栏
    self.navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,kScreenWidth,kNavBarAndStatusBarHeight)];
    self.navView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.navView];
    
    
    [self.navView addSubview:self.titleLabel];
    self.titleLabel.text = self.title;
//    [self.navView addSubview:self.rightButton];
    if (self.navigationController.viewControllers.count > 1) {
        [self.navView addSubview:self.leftButton];
    }
    
}

- (void)setLeftBarButtonWithView:(UIView *)view clickBlock:(void(^)(id data))block{
    if (view) {
        [self.leftButton removeFromSuperview];
        view.frame = CGRectMake(0, kStatusBarHeight, kNavHeight, kNavHeight);
        view.userInteractionEnabled = YES;
        [view addGestureRecognizer:[UITapGestureRecognizer sj_gestureRecognizerWithActionBlock:^(id  _Nonnull gestureRecognizer) {
            if (block) {
                block(nil);
            }
        }]];
        [self.navView addSubview:view];
    }
}

- (void)setRightBarButtonWithView:(UIView *)view clickBlock:(void(^)(id data))block{
    if (view) {
        [self.rightButton removeFromSuperview];
        view.frame = CGRectMake(kScreenWidth - kNavHeight, kStatusBarHeight, kNavHeight, kNavHeight);
        view.userInteractionEnabled = YES;
        [view addGestureRecognizer:[UITapGestureRecognizer sj_gestureRecognizerWithActionBlock:^(id  _Nonnull gestureRecognizer) {
            if (block) {
                block(nil);
            }
        }]];
        [self.navView addSubview:view];
    }
}
- (void)setViewTitle:(NSString *)title{
    self.titleLabel.text = title;
}

- (void)clickLeftButton:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickRighhtButton:(UIButton *)sender{
    
}

#pragma mark- lazyload
- (UIButton *)leftButton{
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.frame = CGRectMake(0, kStatusBarHeight, kNavHeight, kNavHeight);
        [_leftButton setImage:[UIImage imageNamed:@"nav_back_icon"] forState:UIControlStateNormal];
        [_leftButton setAdjustsImageWhenHighlighted:NO];
        [_leftButton addTarget:self action:@selector(clickLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, kStatusBarHeight, kScreenWidth - 300, kNavHeight)];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:20];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.frame = CGRectMake(kScreenWidth - kNavHeight, kStatusBarHeight, kNavHeight, kNavHeight);
        [_rightButton setTitle:@"完成" forState:UIControlStateNormal];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:18];
        _rightButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_rightButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(clickRighhtButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}
@end
