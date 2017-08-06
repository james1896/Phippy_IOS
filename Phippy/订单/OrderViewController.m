//
//  OrderViewController.m
//  Phippy
//
//  Created by toby on 04/08/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "OrderViewController.h"
#import "OrderTableViewCell.h"
#import "OrderFooterView.h"
@interface OrderViewController ()<UITableViewDelegate,UITableViewDataSource>



@end

@implementation OrderViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 110;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 50.f;
}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    OrderFooterView *footerView = [[OrderFooterView alloc]init];
    return footerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"OrderTableViewCell" owner:nil options:nil] lastObject];
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
    [self.phippyNavigationController standardNavigationBarView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
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
