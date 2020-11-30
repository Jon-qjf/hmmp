//
//  MVVMController.m
//  MVVM
//
//  Created by User on 2020/11/23.
//

#import "MVVMViewController.h"
#import "MVVMViewModel.h"
#import "MVVMView.h"

static NSString *const MVVMReuserId = @"MVVMReuserId";


@interface MVVMViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) MVVMViewModel *vm;
@property (nonatomic, strong) UIButton *reloadBtn;

@end

@implementation MVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(reloadBtn:)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
    self.vm = [[MVVMViewModel alloc] init];
    __weak typeof(self)weakSelf = self;
    // UI  <->  model 绑定 
    [self.vm initWithBlock:^(id data) {
        __strong typeof(self)strongSelf = weakSelf;
        NSArray *array = data;
        [strongSelf.dataArray removeAllObjects];
        [strongSelf.dataArray addObjectsFromArray:array];
        MVVMView *headView = [[MVVMView alloc] initWithFrame:CGRectMake(0, 0, strongSelf.view.frame.size.width, (array.count +1)/4*50)];
        [headView headViewWithData:array];
        strongSelf.tableView.tableHeaderView = headView;
        [strongSelf.tableView reloadData];
    } fail:^{
            
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MVVMReuserId forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.vm.contentKey = self.dataArray[indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)reloadBtn:(UIButton *)sender {
    NSLog(@"刷新数据");
    [self.vm loadData];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:MVVMReuserId];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArray;
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
