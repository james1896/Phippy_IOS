//
//  NavigationBarView.m
//  Phippy
//
//  Created by toby on 11/07/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "NavigationBarView.h"

@implementation NavigationBarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)addLogo{
    UIImageView *logo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 75, 44)];
    logo.image = [UIImage imageNamed:@"logo"];
    
    [self addSubview:logo];
}

+ (instancetype)standardNavigationBarView{
    NavigationBarView *barView = [[NavigationBarView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
//    barView.backgroundColor = [UIColor purpleColor];
    [barView addLogo];
    return barView;
}


+ (instancetype)translucentAndCenterTitleNavigationBarView{
    NavigationBarView *barView = [[NavigationBarView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];

    return barView;
}

@end
