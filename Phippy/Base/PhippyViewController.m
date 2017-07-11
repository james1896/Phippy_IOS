//
//  BaseViewController.m
//  Phippy
//
//  Created by toby on 11/07/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "PhippyViewController.h"


@interface PhippyViewController ()

@end

@implementation PhippyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置 navbar
    //默认是 standard 的
    [self.phippyNavigationController standardNavigationBarView];
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


/*  ~~~~~~~     UIViewController(UIViewControllerItem)     ~~~~~~~~~~~~~~~   */

#pragma mark UIViewController(UIViewControllerItem)
@implementation UIViewController(UIViewControllerItem)


//- (BaseTabBarController *)baseTabbarController{
//    if([self.tabBarController isMemberOfClass:[BaseTabBarController class]]){
//        return (BaseTabBarController *)self.tabBarController;
//    }
//    return nil;
//}

- (BaseNavigationController *)phippyNavigationController{
    
    if([self.navigationController isMemberOfClass:[BaseNavigationController class]]){
        return (BaseNavigationController *)self.navigationController;
    }
    return nil;
    
}

@end
