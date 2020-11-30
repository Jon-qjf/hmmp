//
//  Person.m
//  MVVM
//
//  Created by User on 2020/11/20.
//

#import "MVCPresent.h"
#import <YYModel.h>
#import "MVCModel.h"

@implementation MVCPresent

- (instancetype)init {
    if (self=[super init]) {
        [self loadData];    // init天生自带属性,网络请求数据尽量别写在init中, 因为异步加载会有延迟性 影响视图加载
    }
    return self;
}

- (void)loadData {
    NSArray *temArray = @[@{@"name":@"张一", @"sex":@"男", @"num":@"10"},
                          @{@"name":@"张二", @"sex":@"女", @"num":@"20"},
                          @{@"name":@"张三", @"sex":@"女", @"num":@"30"},
                          @{@"name":@"张四", @"sex":@"男", @"num":@"40"},
                          @{@"name":@"张五", @"sex":@"男", @"num":@"50"},
    ];
    for (int i = 0; i<temArray.count; i++) {
        MVCModel *model = [MVCModel yy_modelWithDictionary:temArray[i]];
        [self.dataArray addObject:model];
    }
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArray;
}

@end
