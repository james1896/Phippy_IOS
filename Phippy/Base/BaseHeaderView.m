//
//  baseHeaderView.m
//  Phippy
//
//  Created by toby on 10/07/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "BaseHeaderView.h"

@implementation BaseHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIImageView *)backGroundImageView{
    if(!_backGroundImageView){
        _backGroundImageView = [[UIImageView alloc]initWithFrame:self.bounds];
    }
    return _backGroundImageView;
}

- (UILabel *)titleOfLeftDonw{
    if(!_titleOfLeftDonw){
        _titleOfLeftDonw = [[UILabel alloc]initWithFrame:CGRectMake(5, self.bounds.size.height-30, self.bounds.size.width, 30)];
    }
    return _titleOfLeftDonw;
}

+ (instancetype)initFoodHeaderView{
    
    BaseHeaderView *header = [[BaseHeaderView alloc]init];
    
    return header;
}

+ (instancetype)initTourHeaderView{
    
    BaseHeaderView *header = [[BaseHeaderView alloc]init];
  
    return header;
}

+ (instancetype)initMeHeaderView{
    BaseHeaderView *header = [[BaseHeaderView alloc]init];
    header.backgroundColor= [UIColor purpleColor];
    
    return header;
}

- (instancetype)init{
    if(self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/3.7)]){
//        self.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.backGroundImageView];
        [self addSubview:self.titleOfLeftDonw];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

@end
