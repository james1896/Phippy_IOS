//
//  OrderFooterView.m
//  Phippy
//
//  Created by toby on 06/08/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "OrderFooterView.h"

@implementation OrderFooterView

- (instancetype)init
{
    self = [super init];
    if (self) {
        UILabel *orderNumber = [[UILabel alloc]initWithFrame:CGRectMake(8, 5, 200, 15)];
        orderNumber.text = @"订单号:3635536272764";
        orderNumber.font = [UIFont systemFontOfSize:15];
        
        UILabel *shifukuanLab = [[UILabel alloc]initWithFrame:CGRectMake(8, orderNumber.bottom, 70, 35)];
        shifukuanLab.text = @"实付款:";
        
        UILabel *priceLab = [[UILabel alloc]initWithFrame:CGRectMake(shifukuanLab.right+30, shifukuanLab.top, 100, shifukuanLab.height)];
        priceLab.textColor = RGB(241, 65, 113);
        
        UILabel *orderStatus = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-100, 0, 80, 50)];
        orderStatus.backgroundColor = RGB(46, 237, 2);
        
        [self addSubview:orderNumber];
        [self addSubview:shifukuanLab];
        [self addSubview:priceLab];
        [self addSubview:orderStatus];
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

@end
