//
//  CellDelegate.h
//  BuyCar
//
//  Created by 张子豪 on 2019/1/26.
//  Copyright © 2019 张子豪. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class GoodsTableViewCell;
@protocol CellDelegate <NSObject>

//删除商品
- (void)goodsCell:(GoodsTableViewCell *)cell deleteAtsection:(NSInteger)section row:(NSInteger)row;
//增加商品数量
- (void)goodsCell:(GoodsTableViewCell *)cell addGoodAtSection:(NSInteger)section row:(NSInteger)row;
//减少商品数量
- (void)goodsCell:(GoodsTableViewCell *)cell decGoodAtSection:(NSInteger)section row:(NSInteger)row;

//选中商店所有商品
- (void)goodsCell:(GoodsTableViewCell *)cell selectAllAtSection:(NSInteger)section;
//选中某个商品
- (void)goodsCell:(GoodsTableViewCell *)cell selectAtSection:(NSInteger)section row:(NSInteger)row;

@end

NS_ASSUME_NONNULL_END
