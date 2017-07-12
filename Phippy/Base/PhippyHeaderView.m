//
//  baseHeaderView.m
//  Phippy
//
//  Created by toby on 10/07/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "PhippyHeaderView.h"

@interface PhippyHeaderView()


@end
@implementation PhippyHeaderView


+ (instancetype)headerViewForFood{
    
    PhippyHeaderView *header = [[PhippyHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/3.7+30)];

    header.backGroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/3.7)];
    [header addSubview:header.backGroundImageView];
    
    UILabel *bottomLab = [[UILabel alloc]initWithFrame:CGRectMake(0, header.frame.size.height-30, header.bounds.size.width, 30)];
    bottomLab.textAlignment = NSTextAlignmentCenter;
    bottomLab.text = @"猜你喜欢";
    bottomLab.backgroundColor = [UIColor colorWithRed:188/255.0 green:188/255.0 blue:188/255.0 alpha:1];
    [header addSubview:bottomLab];
    return header;
}

+ (instancetype)headerViewForTour{
    
    PhippyHeaderView *header = [[PhippyHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/3.7+30)];

    header.backGroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/3.7)];
    
    [header addSubview:header.titleOfLeftDonw];
   
    UILabel *bottomLab = [[UILabel alloc] initWithFrame:CGRectMake(0, header.frame.size.height-30, header.bounds.size.width, 30)];
    bottomLab.textAlignment = NSTextAlignmentCenter;
    bottomLab.text = @"推荐攻略";
    bottomLab.backgroundColor = [UIColor colorWithRed:188/255.0 green:188/255.0 blue:188/255.0 alpha:1];
    [header addSubview:bottomLab];
    
    return header;
}

+ (instancetype)headerViewForMe{
    
    PhippyHeaderView *header = [[PhippyHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/3.7)];

    return header;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (void)setHeight:(NSInteger)height{
    CGRect frame = self.frame;
    self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, height);
}


- (void)setBackGroundImageView:(UIImageView *)backGroundImageView{
    
    _backGroundImageView = backGroundImageView;
    
    if(_backGroundImageView ){
        
        if(_backGroundImageView.superview) [_backGroundImageView removeFromSuperview];
        
        [self addSubview:_backGroundImageView];
        
        _titleOfLeftDonw = [[UILabel alloc]initWithFrame:CGRectMake(5, _backGroundImageView.bounds.size.height-30, self.bounds.size.width, 30)];
        _titleOfLeftDonw.textColor = [UIColor whiteColor];
        [_backGroundImageView addSubview:_titleOfLeftDonw];
    }
    
}


@end
