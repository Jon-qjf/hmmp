//
//  RACBaseViewModel.h
//  MVVM
//
//  Created by User on 2020/11/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^SuccessBlock)(id);
typedef void (^FailBlock)(void);

@interface RACBaseViewModel : NSObject

@property (nonatomic, copy) SuccessBlock successBlock;

@property (nonatomic, copy) FailBlock failBlock;

- (void)initWithBlock:(SuccessBlock)successBlock fail:(FailBlock)failBlock;


@end

NS_ASSUME_NONNULL_END
