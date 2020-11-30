//
//  FLDataSource.h
//  MVVM
//
//  Created by User on 2020/11/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

//声明一个block，用于回调cell，model，下标
typedef void (^CellConfigureBefore)(id cell, id model, NSIndexPath * indexPath);

@interface FLDataSource : NSObject<UITableViewDataSource,UICollectionViewDataSource>

@property (nonatomic, strong)  NSMutableArray *dataArray;;

//自定义
- (id)initWithIdentifier:(NSString *)identifier configureBlock:(CellConfigureBefore)before;

//
@property (nonatomic, strong) IBInspectable NSString *cellIdentifier;

@property (nonatomic, copy) CellConfigureBefore cellConfigureBefore;


- (void)addDataArray:(NSArray *)datas;

- (id)modelsAtIndexPath:(NSIndexPath *)indexPath;


@end

NS_ASSUME_NONNULL_END
