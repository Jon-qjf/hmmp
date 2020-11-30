//
//  Target_RAC.m
//  MVVM
//
//  Created by User on 2020/11/24.
//

#import "Target_RAC.h"
#import "RACViewController.h"

@implementation Target_RAC

- (UIViewController *)Action_nativeFetchDetailViewController:(NSDictionary *)params
{
    // 因为action是从属于ModuleA的，所以action直接可以使用ModuleA里的所有声明
    RACViewController *viewController = [[RACViewController alloc] init];
    return viewController;
}


@end
