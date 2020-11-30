//
//  MVVMBaseViewModel.m
//  MVVM
//
//  Created by User on 2020/11/23.
//

#import "MVVMBaseViewModel.h"

@implementation MVVMBaseViewModel

- (void)initWithBlock:(SuccessBlock)successBlock fail:(FailBlock)failBlock{
    _successBlock = successBlock;
    _failBlock = failBlock;
}

@end
