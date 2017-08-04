//
//  OrderViewController.m
//  Phippy
//
//  Created by toby on 04/08/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "OrderViewController.h"

@interface OrderViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tabView;
@property (strong, nonatomic) IBOutlet UIView *yiyudingView;
@property (strong, nonatomic) IBOutlet UIView *peisongzhongView;
@property (strong, nonatomic) IBOutlet UIView *yiwanchengView;


@end

@implementation OrderViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.yiyudingView addTapGestureRecognizerWithTarget:self action:@selector(yiyudingView)];
    [self.peisongzhongView addTapGestureRecognizerWithTarget:self action:@selector(peisongzhongView)];
    [self.view addTapGestureRecognizerWithTarget:self action:@selector(yiwanchengView)];
    
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
