//
//  ViewController.m
//  MVVM
//
//  Created by User on 2020/11/19.
//

#import "ViewController.h"
#import <CTMediator.h>

static NSString *const cells = @"cells";
static NSString *const kCTMediatorTargetMVCController = @"MVC";
static NSString *const kCTMediatorTargetMVPController = @"MVP";
static NSString *const kCTMediatorTargetMVVMController = @"MVVM";
static NSString *const kCTMediatorTargetRACController = @"RAC";
static NSString *const kCTMediatorActionNativeFetchDetailViewController = @"nativeFetchDetailViewController";


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cells forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            CTMediator *ct = [CTMediator sharedInstance];
            UIViewController *viewController = [ct performTarget:kCTMediatorTargetMVCController action:kCTMediatorActionNativeFetchDetailViewController params:@{@"key":@"MVC架构"} shouldCacheTarget:NO];
            UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:viewController];
            naVC.modalPresentationStyle = 0;
            [self presentViewController:naVC animated:YES completion:nil];
        }
            break;
        case 1:
        {
            CTMediator *ct = [CTMediator sharedInstance];
            UIViewController *viewController = [ct performTarget:kCTMediatorTargetMVPController action:kCTMediatorActionNativeFetchDetailViewController params:@{@"key":@"MVP架构"} shouldCacheTarget:NO];
            UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:viewController];
            naVC.modalPresentationStyle = 0;
            [self presentViewController:naVC animated:YES completion:nil];
        }
            break;
        case 2:
        {
            CTMediator *ct = [CTMediator sharedInstance];
            UIViewController *viewController = [ct performTarget:kCTMediatorTargetMVVMController action:kCTMediatorActionNativeFetchDetailViewController params:@{@"key":@"MVVM架构"} shouldCacheTarget:NO];
            UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:viewController];
            naVC.modalPresentationStyle = 0;
            [self presentViewController:naVC animated:YES completion:nil];
        }
            break;
        case 3:
        {
            CTMediator *ct = [CTMediator sharedInstance];
            UIViewController *viewController = [ct performTarget:kCTMediatorTargetRACController action:kCTMediatorActionNativeFetchDetailViewController params:@{@"key":@"MVVM+RAC架构"} shouldCacheTarget:NO];
            UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:viewController];
            naVC.modalPresentationStyle = 0;
            [self presentViewController:naVC animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}
        
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:@"MVC", @"MVP", @"MVVM", @"RAC",nil];
    }
    return  _dataArray;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cells];
    }
    return _tableView;
}




@end
