//
//  BaseNavigationController.m
//  Phippy
//
//  Created by toby on 10/07/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "BaseNavigationController.h"
#import "NavigationBarView.h"

@interface BaseNavigationController ()<UIGestureRecognizerDelegate>{
    
    NavigationBarView *_navBarView;
}

@property (nonatomic,strong)NavigationBarView *navBarView;
@end

@implementation BaseNavigationController

- (void)addBackButton{
    //自定义一个按钮
    UIButton  *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    [leftBtn addTarget:self action:@selector(backLastView) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.frame = CGRectMake(-12, -17, 30, 22);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //将leftItem设置为自定义按钮
    
    UIView *backView = [[UIView alloc]init];
    [backView addSubview:leftBtn];
    UIBarButtonItem  *leftItem =[[UIBarButtonItem alloc]initWithCustomView: backView];
    self.topViewController.navigationItem.leftBarButtonItem = leftItem;

}

- (void)backLastView{
    [self popViewControllerAnimated:YES];
}

- (void)setNavBarView:(NavigationBarView *)navBarView{
    _navBarView = navBarView;
    self.visibleViewController.navigationItem.titleView = navBarView;
}

- (void)originalNavigationBarView{
    self.navBarView = [NavigationBarView originalNavigationBarView];
    
}

- (void)standardNavigationBarView{
    self.navBarView = [NavigationBarView standardNavigationBarView];
}

- (void)translucentAndCenterTitleNavigationBarView{
    self.navBarView = [NavigationBarView translucentAndCenterTitleNavigationBarView];
    
     [self.visibleViewController.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]] forBarMetrics:UIBarMetricsDefault];
    
    self.visibleViewController.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.去掉nav下方的 黑线
//     2.
    [self.navigationBar setBackgroundImage:[self createImageWithColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.8]] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.barStyle = UIBarStyleDefault;
    
    //navbar自带的 透明
//    self.navigationBar.translucent = NO;
    [self.navigationBar setShadowImage:[UIImage new]];
    self.extendedLayoutIncludesOpaqueBars = YES;
    
    //解决自定义返回按钮 手势返回消失问题
    self.interactivePopGestureRecognizer.enabled = YES;
    self.interactivePopGestureRecognizer.delegate = self;
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    return YES;
}

- (UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
