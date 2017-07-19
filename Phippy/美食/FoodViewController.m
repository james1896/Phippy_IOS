//
//  FoodViewController.m
//  Phippy
//
//  Created by toby on 10/07/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "FoodViewController.h"
//#import "FoodTableViewCell.h"
#import "FoodWechatCell.h"
#import "PhippyHeaderView.h"
#import "FoodDetailViewController.h"
@interface FoodViewController ()

@end

@implementation FoodViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FoodWechatCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"FoodWechatCell" owner:nil options:nil]lastObject];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FoodDetailViewController *detail = [[FoodDetailViewController alloc]init];
    detail.hidesBottomBarWhenPushed = YES;
    [self.phippyNavigationController pushViewController:detail animated:YES];
}



//    7-04 更新微信相关：
//    weixin://dl/scan 扫一扫
//    weixin://dl/feedback 反馈
//    weixin://dl/moments 朋友圈
//    weixin://dl/settings 设置
//    weixin://dl/notifications 消息通知设置
//    weixin://dl/chat 聊天设置
//    weixin://dl/general 通用设置
//    weixin://dl/officialaccounts 公众号
//    weixin://dl/games 游戏
//    weixin://dl/help 帮助
//    weixin://dl/feedback 反馈
//    weixin://dl/profile 个人信息
//    weixin://dl/features 功能插件

//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"weixin://dl/chat"] options:@{} completionHandler:nil];

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.phippyNavigationController standardNavigationBarView];
    PhippyHeaderView *headerView = [PhippyHeaderView  headerViewFood];
    self.tableView.tableHeaderView = headerView;
     headerView.backGroundImageView.image = [UIImage imageNamed:@"food_rec_header_img.jpg"];
    headerView.titleOfLeftDonw.text = @"美食";
    
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
