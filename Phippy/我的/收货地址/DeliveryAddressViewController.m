//
//  DeliveryAddress.m
//  Phippy
//
//  Created by toby on 09/08/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "DeliveryAddressViewController.h"
#import "DeliveryAddressTabViewCell.h"
@implementation DeliveryAddressViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.style = UITableViewStyleGrouped;
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = @"收货地址";
    [self.phippyNavigationController addBackButton];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = COLOR(238, 238, 238, 1);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = COLOR(238, 238, 238, 1);
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"DeliveryAddressTabViewCell" owner:nil options:nil]lastObject];
    
    return cell;
}

@end
