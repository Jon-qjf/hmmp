//
//  MVCViewController.m
//  MVVM
//
//  Created by User on 2020/11/19.
//

#import "MVCViewController.h"
#import "MVCModel.h"
#import <YYModel.h>
#import "MVCTableViewCell.h"
#import "MVCPresent.h"
#import "FLDataSource.h"

static NSString *const reuserId = @"reuserId";

@interface MVCViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MVCPresent *pt;
@property (nonatomic, strong) FLDataSource *dataSource;

 
@end

@implementation MVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 数据提供者
    self.pt = [[MVCPresent alloc] init];
    // tableView代理
    self.dataSource = [[FLDataSource alloc] initWithIdentifier:reuserId configureBlock:^(MVCTableViewCell *cell, MVCModel *model, NSIndexPath * _Nonnull indexPath) {
        cell.model = model;
//        cell.numLabel.text = model.num;
//        cell.nameLabel.text = model.name;
    }];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.dataSource addDataArray:self.pt.dataArray];
    self.tableView.dataSource = self.dataSource;
    
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[MVCTableViewCell class] forCellReuseIdentifier:reuserId];
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
