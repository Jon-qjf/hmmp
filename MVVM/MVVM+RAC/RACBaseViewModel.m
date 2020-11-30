//
//  RACBaseViewModel.m
//  MVVM
//
//  Created by User on 2020/11/24.
//

#import "RACBaseViewModel.h"

@implementation RACBaseViewModel

- (void)initWithBlock:(SuccessBlock)successBlock fail:(FailBlock)failBlock{
    _successBlock = successBlock;
    _failBlock = failBlock;
}

@end
