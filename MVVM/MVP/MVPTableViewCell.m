//
//  MVPTableViewCell.m
//  MVVM
//
//  Created by User on 2020/11/20.
//

#import "MVPTableViewCell.h"
#import "ThiredHeader.h"


@implementation MVPTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
     
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.mas_equalTo(20);
    }];
    
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.mas_equalTo(-10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.mas_equalTo(self.addBtn.mas_left);
        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    
    [self.subBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.numLabel.mas_left);
        make.size.centerY.equalTo(self.addBtn);
    }];
}

// commond + option + 左右
-(void)setupUI {
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.addBtn];
    [self.contentView addSubview:self.numLabel];
    [self.contentView addSubview:self.subBtn];
}


-(void)didClickSubBtn:(UIButton *)sender {
    if ([self.numLabel.text intValue]<=0) {
        return;
    }
    self.num--;
}

-(void)didClickAddBtn:(UIButton *)sender {
    if ([self.numLabel.text intValue]>200) {
        return;
    }
    self.num++;
}

- (void)setNum:(int)num {
    _num = num;
    self.numLabel.text = [NSString stringWithFormat:@"%d", self.num];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickNumBtnWithNum:indexPath:)]) {
        [self.delegate didClickNumBtnWithNum:self.numLabel.text indexPath:self.indexPath];
    }
}

-(UILabel *)numLabel {
    if (!_numLabel) {
        _numLabel = [[UILabel alloc] init];
        _numLabel.text = @"0";
        _numLabel.textAlignment= NSTextAlignmentCenter;
        _numLabel.font = [UIFont systemFontOfSize:20];
        _numLabel.textColor = [UIColor redColor];
    }
    return _numLabel;
}

-(UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"qiao";
        _nameLabel.textAlignment= NSTextAlignmentCenter;
        _nameLabel.font = [UIFont systemFontOfSize:20];
        _nameLabel.textColor = [UIColor redColor];
    }
    return _nameLabel;
}

-(UIButton *)subBtn {
    if (!_subBtn) {
        _subBtn = [UIButton buttonWithType:0];
        [_subBtn setTitle:@" - " forState:UIControlStateNormal];
        [_subBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_subBtn setBackgroundColor:[UIColor blueColor]];
        [_subBtn addTarget:self action:@selector(didClickSubBtn:) forControlEvents:UIControlEventTouchUpInside];
        _subBtn.titleLabel.font = [UIFont systemFontOfSize:20];
   //     _subBtn.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    }
    return _subBtn;
}

-(UIButton *)addBtn {
    if (!_addBtn) {
        _addBtn = [UIButton buttonWithType:0];
        [_addBtn setTitle:@" + " forState:UIControlStateNormal];
        [_addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_addBtn setBackgroundColor:[UIColor blueColor]];
        [_addBtn addTarget:self action:@selector(didClickAddBtn:) forControlEvents:UIControlEventTouchUpInside];
        _addBtn.titleLabel.font = [UIFont systemFontOfSize:20];
   //     _addBtn.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    }
    return _addBtn;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
