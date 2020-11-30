//
//  MVCModule.m
//  MVVM
//
//  Created by User on 2020/11/19.
//

#import "Target_MVC.h"
#import "MVCViewController.h"

@implementation Target_MVC

- (UIViewController *)Action_nativeFetchDetailViewController:(NSDictionary *)params
{
    // 因为action是从属于ModuleA的，所以action直接可以使用ModuleA里的所有声明
    MVCViewController *viewController = [[MVCViewController alloc] init];
    return viewController;
}

@end
