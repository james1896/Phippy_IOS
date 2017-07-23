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

#import "PHIRequest.h"

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
    [cell.imgView phi_setImageWithURL:nil];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FoodDetailViewController *detail = [[FoodDetailViewController alloc]init];
    detail.title = @"餐厅名";
    detail.hidesBottomBarWhenPushed = YES;
    [self.phippyNavigationController pushViewController:detail animated:YES];
}


- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"viewDidAppear");
    
//    store_type = 2 表示餐馆
    [PHIRequest storeWithParameters:@{@"store_type":@"2"} success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"");
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
    NSLog(@"getFoodStore%@",[MsgScheduler getFoodStore]);
}

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
