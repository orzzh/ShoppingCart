//
//  GoodModel.h
//  BuyCar
//
//  Created by 张子豪 on 2019/1/26.
//  Copyright © 2019 张子豪. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface GoodModel : NSObject
@property(nonatomic,strong) NSString *goodName;
@property(nonatomic,strong) NSString *goodPrice;
@property(nonatomic,strong) NSString *goodImageUrl;
@property(nonatomic,assign) NSInteger goodNum;
//status
@property(nonatomic,assign) BOOL goodSelect;
@end


@interface ShopModel : NSObject
@property(nonatomic,strong) NSString *shopName;
@property(nonatomic,strong) NSString *shopImageUrl;
@property(nonatomic,strong) NSMutableArray<GoodModel *> *goods;
//status
@property(nonatomic,assign) BOOL shopSelectAll;

@end

NS_ASSUME_NONNULL_END
