//
//  MeViewController.m
//  Phippy
//
//  Created by toby on 10/07/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "MeViewController.h"
#import "PhippyHeaderView.h"
#import "BaseTableViewCell.h"
#import "CollectViewController.h"
#import "EmergencyViewController.h"
#import "SettingViewController.h"
#import "FeedbackViewController.h"
#import "CooperateViewController.h"
#import "AboutUsViewController.h"

#import "LoginViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseTableViewCell *cell = [[BaseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"meCell"];
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PhippyViewController *controller = nil;
    
    switch (indexPath.row) {
        case 0:{
            controller = [[CollectViewController alloc]init];
            controller.title = @"我的收藏";
            break;
        }
        case 1:{
            controller = [[EmergencyViewController alloc]init];
            controller.title = @"应急求助";
            break;
        }
        case 2:{
            controller = [[SettingViewController alloc]init];
            controller.title = @"常用设置";
            break;
        }
        case 3:{
            controller = [[FeedbackViewController alloc]init];
            controller.title = @"意见反馈";
            break;
        }
        case 4:{
            controller = [[CooperateViewController alloc]init];
            controller.title = @"商家入驻";
            break;
        }
        case 5:{
            controller = [[AboutUsViewController alloc]init];
            controller.title = @"关于我们";
            break;
            break;
        }
          
    }
    
    if(controller){
        controller.hidesBottomBarWhenPushed = YES;
        [self.phippyNavigationController pushViewController:controller animated:YES];
    }
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

     [self.phippyNavigationController translucentAndCenterTitleNavigationBarView];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
 
//    [self.phippyNavigationController originalNavigationBarView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"应急求助",@"常用设置",@"意见反馈",@"商务合作",@"关于我们",@"退出登录"];
   
    
    
    /***************************************/
    //当前controller 在nav中 需要这样设置
//    -(UIStatusBarStyle)preferredStatusBarStyle {
//        
//        return UIStatusBarStyleLightContent; //白色
//        
//        return UIStatusBarStyleDefault; //黑色
//        
//    } 在导航控制器中，以上代码不起作用。
    
    
//    self.navigationController.navigationBar.barStyle = UIBarStyleDefault; //状态栏改为黑色
    /***************************************/
    
    PhippyHeaderView *headerView = [PhippyHeaderView  headerViewMe];
    headerView.backgroundColor = [UIColor redColor];
    self.tableView.tableHeaderView = headerView;
    
    //因为设置了 automaticallyAdjustsScrollViewInsets = no
    self.tableViewHeight = SCREEN_HEIGHT-TABBAR_HEIGHT;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(login:)];
    [headerView addGestureRecognizer:tap];
    
    
}

- (void)login:(UITapGestureRecognizer *)tap {
    
   
    LoginViewController *login = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
     UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:login];
   
    [self presentViewController:nav animated:YES completion:nil];
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
