//
//  FoodViewController.m
//  Phippy
//
//  Created by toby on 10/07/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "FoodViewController.h"
#import "FoodTableViewCell.h"
#import "BaseHeaderView.h"
@interface FoodViewController ()

@end

@implementation FoodViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FoodTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"FoodTableViewCell" owner:nil options:nil]lastObject];
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BaseHeaderView *headerView = [BaseHeaderView  initFoodHeaderView];
    self.tableView.tableHeaderView = headerView;
     headerView.backGroundImageView.image = [UIImage imageNamed:@"food_rec_header_img.jpg"];
    
    
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
