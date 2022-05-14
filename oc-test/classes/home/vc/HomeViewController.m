//
//  HomeViewController.m
//  oc-test
//
//  Created by 刘圣洁 on 2022/5/3.
//

#import "HomeViewController.h"
#import "HomeDetailViewController.h"
#import "HomeListCollectionCell.h"
#import "homeModel.h"
#import "SJMediator.h"


static NSString *const cellID = @"cellId";
@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,copy) NSArray *listArray;
@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpdata];
    [self setUpVIew];
}

- (void)setUpVIew{
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(kNavBarAndStatusBarHeight);
        make.bottom.equalTo(self.view.mas_bottom).offset(-kTabBarHeight);
    }];
}

- (void)setUpdata{
    
    NSData *data = [[NSData alloc] initWithContentsOfFile:kPath(@"homeList", @"json")];
    NSError *error;
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (arr && !error) {
        self.listArray = [HomeModel mj_objectArrayWithKeyValuesArray:arr];
        NSLog(@"%@",self.listArray);
        [self.collectionView reloadData];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    HomeDetailViewController *vc = [[HomeDetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark- UICollectionViewDelegate,UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.listArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    HomeModel *model = self.listArray[section];
    return model.items.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeModel *model = self.listArray[indexPath.section];
    HomeListCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    [cell configViewWithString:model.items[indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        //open URL跳转其他APP
        if (indexPath.row == 0) {
            NSString *urlScheme = @"lsjSwiftDemo://";
            NSString *customString = [urlScheme stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            NSURL *url = [NSURL URLWithString:customString];
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url];
            }else{
                UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"URL Error" message:@"" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                [alertVC addAction:action];
                [self presentViewController:alertVC animated:YES completion:nil];
            }
        }else if(indexPath.row == 1){
            //通过target-action方式跳转详情页
            UIViewController *vc = [SJMediator getHomeDetailVCWithContent:@"target-action"];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row == 2){
            //通过scheme方式跳转详情页
            NSDictionary *params = @{@"nav":self.navigationController,@"color":@"#550088"};
            [SJMediator openUrl:@"chemeJump://" params:params];
        }else{
            //通过protocal_class方式跳转详情页
            Class cls = [SJMediator fetchClassForProtocal:@protocol(SJProtocalJumpViewControllerProtocal)];
            NSDictionary *params = @{@"color":@"#550088"};
            [self.navigationController pushViewController:[[cls alloc] jumpVCWithParams:params] animated:YES];
        }
    }else{
        HomeModel *model = self.listArray[indexPath.section];
        HomeDetailViewController *detailVC = [[HomeDetailViewController alloc] initWithContent:@"普通跳转" color:[UIColor colorWithHexString:@"#FF8855"]];
        detailVC.title = model.items[indexPath.row];
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}

#pragma mark- lazyload
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake((kScreenWidth - 36)/2.0, 50);
        flowLayout.minimumLineSpacing = 15;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.sectionInset = UIEdgeInsetsMake(20, 12, 0, 12);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor darkGrayColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[HomeListCollectionCell class] forCellWithReuseIdentifier:cellID];
    }
    return _collectionView;
}
@end
