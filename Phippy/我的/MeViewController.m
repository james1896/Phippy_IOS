//
//  MeViewController.m
//  Phippy
//
//  Created by toby on 10/07/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "MeViewController.h"
#import "PhippyHeaderView.h"
@interface MeViewController ()

@end

@implementation MeViewController

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"meCell"];
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"我的收藏",@"应急求助",@"商务合作",@"关于我们",@"退出登录"];
    [self.phippyNavigationController translucentAndCenterTitleNavigationBarView];
    
    
    /***************************************/
    //当前controller 在nav中 需要这样设置
//    -(UIStatusBarStyle)preferredStatusBarStyle {
//        
//        return UIStatusBarStyleLightContent; //白色
//        
//        return UIStatusBarStyleDefault; //黑色
//        
//    } 在导航控制器中，以上代码不起作用。
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
//    self.navigationController.navigationBar.barStyle = UIBarStyleDefault; //状态栏改为黑色
    /***************************************/
    
    PhippyHeaderView *headerView = [PhippyHeaderView  headerViewMe];
    headerView.backgroundColor = [UIColor redColor];
//    headerView.height = 300;
    self.tableView.tableHeaderView = headerView;
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
