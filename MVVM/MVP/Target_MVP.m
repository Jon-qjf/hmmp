//
//  Tatget_MVP.m
//  MVVM
//
//  Created by User on 2020/11/20.
//

#import "Target_MVP.h"
#import "MVPViewController.h"

@implementation Target_MVP

- (UIViewController *)Action_nativeFetchDetailViewController:(NSDictionary *)params
{
    // 因为action是从属于ModuleA的，所以action直接可以使用ModuleA里的所有声明
    MVPViewController *viewController = [[MVPViewController alloc] init];
    return viewController;
}


@end
