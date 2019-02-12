//
//  ViewController.m
//  BuyCar
//
//  Created by 张子豪 on 2019/1/26.
//  Copyright © 2019 张子豪. All rights reserved.
//

#import "ViewController.h"
#import "ShopHeadView.h"
#import "GoodsTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,CellDelegate>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) UILabel *totalPrice;
@property(nonatomic,strong) NSMutableArray<ShopModel *> *dataAry;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat bottom = self.view.frame.size.height>=812?34:0;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-50-bottom) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 100;
    self.tableView.sectionHeaderHeight = 50;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"GoodsTableViewCell" bundle:nil] forCellReuseIdentifier:@"GoodsTableViewCell"];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor redColor];
    
    UIView *bottomView = [UIView new];
    bottomView.frame = CGRectMake(0, self.view.frame.size.height - 50 - bottom, self.view.frame.size.width, 50);
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    UILabel *title = [UILabel new];
    title.text = @"合计结算：";
    title.font = [UIFont systemFontOfSize:14];
    title.textColor = [UIColor blackColor];
    title.frame = CGRectMake(10, 0, 90, 50);
    [bottomView addSubview:title];
    
    self.totalPrice = [UILabel new];
    self.totalPrice.text = @"¥ 0";
    self.totalPrice.font = [UIFont systemFontOfSize:14];
    self.totalPrice.textColor =  [UIColor colorWithRed:246/255.0 green:74/255.0 blue:112/255.0 alpha:1];
    self.totalPrice.frame = CGRectMake(80, 0, 150, 50);
    [bottomView addSubview:self.totalPrice];
    
    UIButton *pay = [UIButton new];
    [pay setTitle:@"立即购买" forState:UIControlStateNormal];
    pay.backgroundColor = [UIColor colorWithRed:246/255.0 green:74/255.0 blue:112/255.0 alpha:1];
    [pay setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    pay.frame = CGRectMake(self.view.frame.size.width/2, 0, self.view.frame.size.width/2, 50);
    [bottomView addSubview:pay];
    [pay addTarget:self action:@selector(payAction:) forControlEvents:UIControlEventTouchUpInside];
    
    ShopModel *m = [ShopModel new];
    m.shopName = @"商店1";
    m.shopSelectAll = NO;
    
    GoodModel *good = [GoodModel new];
    good.goodName = @"商品1";
    good.goodSelect = YES;
    good.goodPrice = @"100";
    good.goodNum = 1;
    
    GoodModel *good1 = [GoodModel new];
    good1.goodName = @"商品2";
    good1.goodSelect = NO;
    good1.goodPrice = @"200";
    good1.goodNum = 2;
    
    ShopModel *m1 = [ShopModel new];
    m1.shopName = @"商店1";
    m1.shopSelectAll = NO;
    
    GoodModel *good12 = [GoodModel new];
    good12.goodName = @"商品1";
    good12.goodSelect = NO;
    good12.goodPrice = @"100";
    good12.goodNum = 1;
    
    GoodModel *good11 = [GoodModel new];
    good11.goodName = @"商品2";
    good11.goodSelect = NO;
    good11.goodPrice = @"200";
    good11.goodNum = 2;
    
    GoodModel *good111 = [GoodModel new];
    good111.goodName = @"商品2";
    good111.goodSelect = NO;
    good111.goodPrice = @"200";
    good111.goodNum = 2;
    
    m.goods = [NSMutableArray arrayWithObjects:good,good1,good1, nil];
    m1.goods = [NSMutableArray arrayWithObjects:good12,good11,good111, nil];

    self.dataAry = [NSMutableArray arrayWithObjects:m,m1, nil];;
 
    [self.tableView reloadData];
}

//- (void)checkPrice

//选中所有分组商品
- (void)selectAllGoodsInSection:(UIButton *)sender
{
    ShopModel *model = self.dataAry[sender.tag];
    BOOL curSelect = !model.shopSelectAll;
    model.shopSelectAll = curSelect;
    for (GoodModel *m in model.goods) {
        m.goodSelect = curSelect;
    }
    [self.tableView reloadData];
}

//删除商品
- (void)goodsCell:(GoodsTableViewCell *)cell deleteAtsection:(NSInteger)section row:(NSInteger)row{
    
    
}
//增加商品数量
- (void)goodsCell:(GoodsTableViewCell *)cell addGoodAtSection:(NSInteger)section row:(NSInteger)row{
    NSInteger num = [cell.numLabel.text integerValue];
    NSIndexPath *path = [self.tableView indexPathForCell:cell];
    ShopModel *model = self.dataAry[path.section];
    GoodModel *goodModel = model.goods[path.row];
    goodModel.goodNum = num+1;
    [self.tableView reloadData];
}
//减少商品数量
- (void)goodsCell:(GoodsTableViewCell *)cell decGoodAtSection:(NSInteger)section row:(NSInteger)row{
    NSInteger num = [cell.numLabel.text integerValue];
    if (num <= 1) {
        return;
    }
    NSIndexPath *path = [self.tableView indexPathForCell:cell];
    ShopModel *model = self.dataAry[path.section];
    GoodModel *goodModel = model.goods[path.row];
    goodModel.goodNum = num-1;
    [self.tableView reloadData];
}

//选中商店所有商品
- (void)goodsCell:(GoodsTableViewCell *)cell selectAllAtSection:(NSInteger)section{
    NSIndexPath *path = [self.tableView indexPathForCell:cell];
    ShopModel *model = self.dataAry[path.section];
    BOOL curSelect = !model.shopSelectAll;
    for (GoodModel *m in model.goods) {
        m.goodSelect = curSelect;
    }
    [self.tableView reloadData];
}

//选中某个商品
- (void)goodsCell:(GoodsTableViewCell *)cell selectAtSection:(NSInteger)section row:(NSInteger)row{
    NSIndexPath *path = [self.tableView indexPathForCell:cell];
    ShopModel *model = self.dataAry[path.section];
    GoodModel *goodModel = model.goods[path.row];
    goodModel.goodSelect = !goodModel.goodSelect;
    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    ShopModel *shopModel = self.dataAry[section];
    return shopModel.goods.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataAry.count;
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ShopModel *shopModel = self.dataAry[section];
    ShopHeadView *headView = [[ShopHeadView alloc]initWithFrame:CGRectMake(0, 10, tableView.frame.size.width, 50)];
    headView.titleLabel.text = shopModel.shopName;
    headView.selectBtn.selected = shopModel.shopSelectAll;
    headView.selectBtn.tag = section;
    [headView.selectBtn addTarget:self action:@selector(selectAllGoodsInSection:) forControlEvents:UIControlEventTouchUpInside];
    return headView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShopModel *shopModel = self.dataAry[indexPath.section];
    GoodModel *goodModel = shopModel.goods[indexPath.row];
    GoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GoodsTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    cell.model = goodModel;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
