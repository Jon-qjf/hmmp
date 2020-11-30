//
//  MVPPresent.h
//  MVVM
//
//  Created by User on 2020/11/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN


// MVP: 面向协议编程
// 分类,协议,类,文件 在runtime的map_images方法中加载到内存

@protocol PresentDelegate <NSObject>

@required   // 必须实现 默认

@optional   // 可选实现

- (void)didClickNumBtnWithNum:(NSString *)num indexPath:(NSIndexPath *)indexPath;
- (void)reloadUI;

@end


@interface MVPPresent : NSObject<PresentDelegate>

@property (nonatomic, weak) id<PresentDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *dataArray;


@end

NS_ASSUME_NONNULL_END
