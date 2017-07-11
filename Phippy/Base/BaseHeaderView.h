//
//  baseHeaderView.h
//  Phippy
//
//  Created by toby on 10/07/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseHeaderView : UIView

@property (nonatomic,strong) UIImageView *backGroundImageView;
@property (nonatomic,strong) UILabel *titleOfLeftDonw;

+ (instancetype)initFoodHeaderView;
+ (instancetype)initTourHeaderView;
+ (instancetype)initMeHeaderView;
@end
