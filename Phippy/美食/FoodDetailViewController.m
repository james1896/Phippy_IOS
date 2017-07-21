//
//  FoodDetailViewController.m
//  Phippy
//
//  Created by toby on 12/07/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "FoodDetailViewController.h"
#import "PhippyHeaderView.h"
#import "FoodDetailCollectionViewCell.h"


#import "PHIRequest.h"
@interface FoodDetailViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIActionSheetDelegate>

@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation FoodDetailViewController

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    //    FoodTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"FoodTableViewCell" owner:nil options:nil]lastObject];
//    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
//    return cell;
//}

- (UICollectionViewFlowLayout *)flowLayout{
    if(!_flowLayout){
        _flowLayout = [UICollectionViewFlowLayout new];
        //  collectionView的item大小
        _flowLayout.itemSize = CGSizeMake((SCREEN_WIDTH-1)/2, 150);
        
        //  collectionView的item行间距
        _flowLayout.minimumLineSpacing = 1;
        
        //  collectionView的item列间距
        _flowLayout.minimumInteritemSpacing = 1;
        
        //  collectionView的sectionHeaderView大小
//        _flowLayout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 41);
    }
    return _flowLayout;
}

- (UICollectionView *)collectionView{
    if(!_collectionView){
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT) collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        //  注册item
        [_collectionView registerNib:[UINib nibWithNibName:@"FoodDetailCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"FoodDetailCollectionViewCell"];
        //  注册sectionHeaderView
        //    [collectionView registerClass:[XSectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerview"];

        //注册商家headerview
        [_collectionView registerNib:[UINib nibWithNibName:@"MerchantLogoReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MerchantLogoReusableView"];

    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.phippyNavigationController addBackButton];
    [self.phippyNavigationController addRightButtonWithTilte:@"联系商家" image:nil targat:self action:@selector(contactMerchant)];
    [self.view addSubview:self.collectionView];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [PHIRequest goodsWithParameters:@{@"store_id":@"1001"} success:^(NSURLSessionDataTask *task, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

- (void)contactMerchant{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"亲！phippy下单系统正在测试中，敬请期待哦，么么哒" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"微信: weixin1111111111",@"电话:09162151896", nil];
    //actionSheet样式
    sheet.actionSheetStyle = UIActionSheetStyleDefault;
    //显示
    [sheet showInView:self.view];
    sheet.delegate = self;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
       //微信联系
        
        
        //    7-04 更新微信相关：
        //    weixin://dl/scan 扫一扫
        //    weixin://dl/feedback 反馈
        //    weixin://dl/moments 朋友圈
        //    weixin://dl/settings 设置
        //    weixin://dl/notifications 消息通知设置
        //    weixin://dl/chat 聊天设置
        //    weixin://dl/general 通用设置
        //    weixin://dl/officialaccounts 公众号
        //    weixin://dl/games 游戏
        //    weixin://dl/help 帮助
        //    weixin://dl/feedback 反馈
        //    weixin://dl/profile 个人信息
        //    weixin://dl/features 功能插件
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"weixin://dl/chat"] options:@{} completionHandler:nil];
        
    }else if (buttonIndex == 1){
       //电话联系
        NSMutableString* str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",@"18888888888"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        
    }
}

//  collectionView段数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}
//  collectionView每段的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return 15;
}
//  collectionView的item
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //  获取自定义的cell
    FoodDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FoodDetailCollectionViewCell" forIndexPath:indexPath];
    
 
    return cell;
}

//这个方法是返回 Header的大小 size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.collectionView.frame.size.width, 150);
}

//这个也是最重要的方法 获取Header的 方法。
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headerView = nil;
    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
        if(indexPath.section == 0){
            headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MerchantLogoReusableView" forIndexPath:indexPath];
        }
    }
    
    return headerView;
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
