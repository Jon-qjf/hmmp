//
//  Tatget_MVP.h
//  MVVM
//
//  Created by User on 2020/11/20.
//

#import <CTMediator/CTMediator.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Target_MVP : CTMediator

- (UIViewController *)Action_nativeFetchDetailViewController:(NSDictionary *)params;


@end

NS_ASSUME_NONNULL_END
