//
//  NavigationBarView.h
//  Phippy
//
//  Created by toby on 11/07/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationBarView : UIView

@property (nonatomic,strong) NSString *title;

+ (instancetype)originalNavigationBarView;
+(instancetype)standardNavigationBarView;
+(instancetype)translucentAndCenterTitleNavigationBarView;
@end
