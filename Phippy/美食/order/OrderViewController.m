//
//  OrderViewController.m
//  Phippy
//
//  Created by toby on 08/08/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "OrderViewController.h"

#import "MyOrderTableViewCell.h"
#import "MyOrderFooterView.h"
#import "MyOrderHeaderView.h"
@interface OrderViewController ()<UITableViewDelegate,UITableViewDataSource>



@end

@implementation OrderViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr = self.dataArray[section];
    return arr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 110;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 40.f;
}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 65.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    MyOrderFooterView *footerView = [[MyOrderFooterView alloc]initWithFrame:CGRectMake(0, 0, tableView.width, 40)];
    return footerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    MyOrderHeaderView *headerView = [[MyOrderHeaderView alloc]initWithFrame:CGRectMake(0, 0, tableView.width, 65)];
    return headerView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyOrderTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"MyOrderTableViewCell" owner:nil options:nil] lastObject];
    return cell;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.style = UITableViewStyleGrouped;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.style = UITableViewStyleGrouped;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.phippyNavigationController addBackButton];
    self.title = @"订单详情";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    NSLog(@"order data:%@",self.dataArray);
    
    //需要请求 订单号 接口
    
}

- (void)yiyudingpress{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)peisongzhongPress{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)yiwanchengPress{
    NSLog(@"%@",NSStringFromSelector(_cmd));
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
