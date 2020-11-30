//
//  MVCTableViewCell.h
//  MVVM
//
//  Created by User on 2020/11/19.
//

#import <UIKit/UIKit.h>
#import "MVCModel.h"

NS_ASSUME_NONNULL_BEGIN


@interface MVCTableViewCell : UITableViewCell


@property (nonatomic, strong) UIButton *subBtn;
@property (nonatomic, strong) UIButton *addBtn;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *numLabel;
@property (nonatomic, assign) int num;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) MVCModel *model;



@end

NS_ASSUME_NONNULL_END
