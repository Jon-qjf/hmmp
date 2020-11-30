//
//  MVVMViewModel.h
//  MVVM
//
//  Created by User on 2020/11/23.
//

#import "MVVMBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVVMViewModel : MVVMBaseViewModel

@property (nonatomic, copy) NSString *contentKey;
- (void)loadData;

@end

NS_ASSUME_NONNULL_END
