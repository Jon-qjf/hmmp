//
//  RACView.m
//  MVVM
//
//  Created by User on 2020/11/24.
//

#import "RACView.h"

@implementation RACView


- (void)headViewWithData:(NSArray *)array {
    
    for (int i=0; i<array.count; i++) {
        UILabel *lb = [UILabel new];
        [self addSubview:lb];
        lb.frame = CGRectMake(i%4*(self.frame.size.width/4), (trunc(i*(self.frame.size.width/4)/self.frame.size.width))*50, self.frame.size.width/4, 50);
        UIColor * randomColor= [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
        lb.backgroundColor = randomColor;
        lb.font = [UIFont systemFontOfSize:15];
        lb.textColor = [UIColor whiteColor];
        lb.text = array[i];
        lb.textAlignment = 1;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
