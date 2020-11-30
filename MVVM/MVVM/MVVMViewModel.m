//
//  MVVMViewModel.m
//  MVVM
//
//  Created by User on 2020/11/23.
//

#import "MVVMViewModel.h"

@implementation MVVMViewModel

- (instancetype)init {
    if (self=[super init]) {
        
        [self addObserver:self forKeyPath:@"contentKey" options:NSKeyValueObservingOptionNew context:NULL];
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

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@", change);
    NSArray *array = @[@"转账", @"信用卡", @"充值中心", @"蚂蚁借呗", @"电影票", @"滴滴出行", @"城市服务", @"蚂蚁森林"];
    NSMutableArray *mArray = [NSMutableArray arrayWithArray:array];
    [mArray removeObject: change[NSKeyValueChangeNewKey]];
    if (self.successBlock) {
        self.successBlock(mArray);
    }
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"contentKey"];
}

@end
