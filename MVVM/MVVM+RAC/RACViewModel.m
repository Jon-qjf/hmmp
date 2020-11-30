//
//  RACViewModel.m
//  MVVM
//
//  Created by User on 2020/11/24.
//

#import "RACViewModel.h"
#import <ReactiveObjC.h>

@implementation RACViewModel

- (instancetype)init {
    if (self=[super init]) {
        
        // 响应式编程 RAC
        // 1.创建信号
        RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            // 3.发送信号
            [subscriber sendNext:@"发送"];
            // 4.销毁信号
            return [RACDisposable disposableWithBlock:^{
                NSLog(@"销毁");
            }];
            
        }];
        // 2.订阅信号
        [signal subscribeNext:^(id  _Nullable x) {
            NSLog(@"订阅信号 --- %@", x);
        }];
        
        [RACObserve(self, contentKey) subscribeNext:^(id  _Nullable x) {
            NSArray *array = @[@"转账", @"信用卡", @"充值中心", @"蚂蚁借呗", @"电影票", @"滴滴出行", @"城市服务", @"蚂蚁森林"];
            NSMutableArray *mArray = [NSMutableArray arrayWithArray:array];
            [mArray removeObject: x];
            if (self.successBlock) {
                self.successBlock(mArray);
            }
        }];
    }
    return self;
}


- (void)loadData {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray *array = @[@"转账", @"信用卡", @"充值中心", @"蚂蚁借呗", @"电影票", @"滴滴出行", @"城市服务", @"蚂蚁森林"];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.successBlock) {
                self.successBlock(array);
            }
        });
    });
}

@end
