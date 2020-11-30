//
//  MVCModule.h
//  MVVM
//
//  Created by User on 2020/11/19.
//

#import <CTMediator/CTMediator.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Target_MVC : CTMediator

- (UIViewController *)Action_nativeFetchDetailViewController:(NSDictionary *)params;


@end

NS_ASSUME_NONNULL_END
