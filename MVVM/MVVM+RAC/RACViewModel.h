//
//  RACViewModel.h
//  MVVM
//
//  Created by User on 2020/11/24.
//

#import "RACBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RACViewModel : RACBaseViewModel

@property (nonatomic, copy) NSString *contentKey;
- (void)loadData;

@end

NS_ASSUME_NONNULL_END
