//
//  HomeListCollectionCell.m
//  oc-test
//
//  Created by 刘圣洁 on 2022/5/4.
//

#import "HomeListCollectionCell.h"


@interface HomeListCollectionCell()
@property (nonatomic,copy) UILabel *contentLabel;

@end

@implementation HomeListCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpView];
    }
    return self;
    
}

- (void)setUpView{
    [self addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
}

- (void)configViewWithString:(NSString *)string{
    self.contentLabel.text = string;
}

#pragma make- lazyload
- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = [UIColor colorWithHexString:@"FFED97"];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.numberOfLines = 1;
    }
    return _contentLabel;
}
@end
