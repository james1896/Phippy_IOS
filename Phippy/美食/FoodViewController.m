//
//  FoodViewController.m
//  Phippy
//
//  Created by toby on 10/07/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "FoodViewController.h"
#import "FoodTableViewCell.h"
#import "PhippyHeaderView.h"
#import "FoodDetailViewController.h"
@interface FoodViewController ()

@end

@implementation FoodViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FoodTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"FoodTableViewCell" owner:nil options:nil]lastObject];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FoodDetailViewController *detail = [[FoodDetailViewController alloc]init];
    detail.hidesBottomBarWhenPushed = YES;
    [self.phippyNavigationController pushViewController:detail animated:YES];
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
