//
//  OrderViewController.m
//  Phippy
//
//  Created by toby on 08/08/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "OrderViewController.h"

#import "OrderTableViewCell.h"
#import "MyOrderFooterView.h"
#import "MyOrderHeaderView.h"
@interface OrderViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UIView *payView;

@end

@implementation OrderViewController{
    int payView_height;
}

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
    return 50.f;
}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 65.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    MyOrderFooterView *footerView = [[MyOrderFooterView alloc]initWithFrame:CGRectMake(0, 0, tableView.width, 40)];
    NSArray *array = self.dataArray[section];
    
    CGFloat money = 0.f;
    for(NSDictionary *dict in array){
        NSString *price = dict[@"price"];
        
        money += [price floatValue];
    }
    
    [footerView sumCount:[NSString stringWithFormat:@"%ld",array.count] Price:[NSString stringWithFormat:@"%.2f",money]];
    return footerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    MyOrderHeaderView *headerView = [[MyOrderHeaderView alloc]initWithFrame:CGRectMake(0, 0, tableView.width, 65)];
    return headerView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"OrderTableViewCell" owner:nil options:nil] lastObject];
    
    NSArray *array = self.dataArray[indexPath.section];
    NSDictionary *dict = array[indexPath.row];
    
    cell.name.text = dict[@"name"];
    cell.price.text = dict[@"price"];
    cell.count.text = @"1";
//    cell.imageView sd_
    return cell;
}

- (UIView *)payView{
    if(!_payView){
        _payView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.height-payView_height, self.view.width, payView_height)];
        _payView.backgroundColor = COLOR(239, 239, 244, 1);
        
        int btnWidth = 100;
        UIButton *payButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [payButton setTitle:@"货到付款" forState:UIControlStateNormal];
        payButton.titleLabel.font = [UIFont systemFontOfSize:16];
        payButton.layer.cornerRadius = 6;
        [payButton setBackgroundColor:[UIColor whiteColor]];
        [payButton setTitleColor:COLOR(70, 70, 70, 1) forState:UIControlStateNormal];
        payButton.frame = CGRectMake(_payView.width-20-btnWidth, 5, btnWidth, _payView.height-10);
        
        [_payView addSubview:payButton];
    }
    return _payView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.style = UITableViewStyleGrouped;
        payView_height = 50;
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
    self.tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height-payView_height);
    self.tableView.backgroundColor = [UIColor whiteColor];
//    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.payView];
    //需要请求 订单号 接口
    
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
