//
//  HomeDetailViewController.m
//  oc-test
//
//  Created by 刘圣洁 on 2022/5/3.
//

#import "HomeDetailViewController.h"

@interface HomeDetailViewController ()
@property (nonatomic,strong) UILabel *contentLabel;

@property (nonatomic,copy) NSString *contentStr;
@end

@implementation HomeDetailViewController

- (instancetype)initWithContent:(NSString *)content color:(UIColor *)color{
    if (self = [super init]) {
        self.contentStr = content;
        self.view.backgroundColor = color;
        [self setUpView];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self setUpView];
}

- (void)setUpView{
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.image = [UIImage imageNamed:@"temp"];
    
    __weak typeof(self) weakSelf = self;
    [self setLeftBarButtonWithView:imageV clickBlock:^(id  _Nonnull data) {
        [weakSelf.navigationController popViewControllerAnimated:NO];
    }];
    
    [self.view addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
    }];
    self.contentLabel.text = self.contentStr;
    [self.contentLabel sizeToFit];
}

#pragma mark--lazyload
- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _contentLabel.textColor = [UIColor redColor];
        _contentLabel.font = [UIFont systemFontOfSize:18];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.numberOfLines = 1;
    }
    return _contentLabel;
}
@end
