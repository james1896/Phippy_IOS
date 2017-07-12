//
//  FoodDetailViewController.m
//  Phippy
//
//  Created by toby on 12/07/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "FoodDetailViewController.h"
#import "PhippyHeaderView.h"
@interface FoodDetailViewController ()

@end

@implementation FoodDetailViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    FoodTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"FoodTableViewCell" owner:nil options:nil]lastObject];
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.phippyNavigationController addBackButton];
    
    PhippyHeaderView *headerView = [PhippyHeaderView headerViewTourDetail];
    headerView.titleOfLeftDonw.text = @"吃饭详情";
    headerView.backGroundImageView.image = [UIImage imageNamed:@"food_rec_header_img.jpg"];
    self.tableView.tableHeaderView = headerView;
    
    
    

}

- (void)backLastView{
    [self.navigationController popViewControllerAnimated:YES];
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
