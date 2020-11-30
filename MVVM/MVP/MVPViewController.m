//
//  MVPViewController.m
//  MVVM
//
//  Created by User on 2020/11/20.
//

#import "MVPViewController.h"
#import "MVPModel.h"
#import <YYModel.h>
#import "MVPTableViewCell.h"
#import "MVPPresent.h"
#import "FLDataSource.h"

static NSString *const MVPReuserId = @"MVPReuserId";


@interface MVPViewController ()<PresentDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MVPPresent *pt;
@property (nonatomic, strong) FLDataSource *dataSource;

@end

@implementation MVPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 数据提供者
    self.pt = [[MVPPresent alloc] init];
    // tableView代理
    __weak typeof(self) weakSelf = self;
    self.dataSource = [[FLDataSource alloc] initWithIdentifier:MVPReuserId configureBlock:^(MVPTableViewCell *cell, MVPModel *model, NSIndexPath * _Nonnull indexPath) {
        __strong typeof(self) strongSelf = weakSelf;
        cell.numLabel.text = model.num;
        cell.nameLabel.text = model.name;
        cell.indexPath = indexPath;
        cell.delegate = strongSelf.pt;
    }];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.dataSource addDataArray:self.pt.dataArray];
    self.tableView.dataSource = self.dataSource;
    self.pt.delegate = self;
}

- (void)reloadUI {
    [self.dataSource addDataArray:self.pt.dataArray];
    [self.tableView reloadData];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[MVPTableViewCell class] forCellReuseIdentifier:MVPReuserId];
    }
    return _tableView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
