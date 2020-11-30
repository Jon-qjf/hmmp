//
//  MVPTableViewCell.h
//  MVVM
//
//  Created by User on 2020/11/20.
//

#import <UIKit/UIKit.h>
#import "MVPPresent.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVPTableViewCell : UITableViewCell

@property (nonatomic, strong) UIButton *subBtn;
@property (nonatomic, strong) UIButton *addBtn;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *numLabel;
@property (nonatomic, assign) int num;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, weak) id<PresentDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
