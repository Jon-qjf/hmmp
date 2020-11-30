//
//  Target_MVVM.m
//  MVVM
//
//  Created by User on 2020/11/23.
//

#import "Target_MVVM.h"
#import "MVVMViewController.h"

@implementation Target_MVVM

- (UIViewController *)Action_nativeFetchDetailViewController:(NSDictionary *)params
{
    // 因为action是从属于ModuleA的，所以action直接可以使用ModuleA里的所有声明
    MVVMViewController *viewController = [[MVVMViewController alloc] init];
    return viewController;
}


@end
