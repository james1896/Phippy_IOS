//
//  DeliveryAddress.m
//  Phippy
//
//  Created by toby on 09/08/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "DeliveryAddressViewController.h"
#import "DeliveryAddressTabViewCell.h"

@interface DeliveryAddressViewController()

@property (nonatomic,strong) NSMutableArray *dataarray;
@end
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
    
    self.dataArray = @[@{@"name":@"james",@"phone":@"09162151896",@"address":@"dela costa evune antel spa hotel dela costa evune antel spa hotel makati, manila"},
                       @{@"name":@"james",@"phone":@"09162151896",@"address":@"antel spa hotel makati, manila"},
                       @{@"name":@"evan",@"phone":@"09162151896",@"address":@"antel spa hotel makati, manila"},
                       @{@"name":@"toby",@"phone":@"09162151896",@"address":@"antel spa hotel makati, manila"},
                       @{@"name":@"rea",@"phone":@"09162151896",@"address":@"antel spa hotel makati, manila"},
                       @{@"name":@"lucy",@"phone":@"09162151896",@"address":@"antel spa hotel makati, manila"},
                       @{@"name":@"james",@"phone":@"09162151896",@"address":@"antel spa hotel makati, manila"},
                       @{@"name":@"james",@"phone":@"09162151896",@"address":@"antel spa hotel makati, manila"},
                       @{@"name":@"james",@"phone":@"09162151896",@"address":@"antel spa hotel makati, manila"},];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 125;
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
    DeliveryAddressTabViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"DeliveryAddressTabViewCell" owner:nil options:nil]lastObject];
    
    if(indexPath.section == 0){
        [cell setColorForDefaultAddress];
    }
    
    NSDictionary *dict = self.dataArray[indexPath.section];
    cell.name.text = dict[@"name"];
    cell.phoneNumber.text = dict[@"phone"];
    cell.address.text = dict[@"address"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

@end
