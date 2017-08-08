//
//  OrderFooterView.m
//  Phippy
//
//  Created by toby on 06/08/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "MyOrderFooterView.h"

@implementation MyOrderFooterView

- (instancetype)init
{
    self = [super init];
    if (self) {
      
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel *orderNumber = [[UILabel alloc]initWithFrame:CGRectMake(8, 0, 200, self.height)];
        orderNumber.text = @"配送费：100P";
        orderNumber.font = [UIFont systemFontOfSize:15];
        
        
        
        UILabel *orderStatus = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-250, 0, 240, self.height)];
        orderStatus.backgroundColor = RGB(46, 237, 2);
        orderStatus.text = @"共11件商品 共计： 1100P";
        orderStatus.textAlignment  = NSTextAlignmentRight;
        
        [self addSubview:orderNumber];
        
        [self addSubview:orderStatus];
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}
@end
