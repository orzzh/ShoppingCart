//
//  GoodsTableViewCell.h
//  BuyCar
//
//  Created by 张子豪 on 2019/1/26.
//  Copyright © 2019 张子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellDelegate.h"
#import "GoodModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GoodsTableViewCell : UITableViewCell

@property (nonatomic, weak) id<CellDelegate> delegate;
@property (nonatomic, strong) GoodModel *model;
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@property (weak, nonatomic) IBOutlet UIImageView *goodImage;
@property (weak, nonatomic) IBOutlet UITextView *goodName;
@property (weak, nonatomic) IBOutlet UILabel *goodPrice;
@property (weak, nonatomic) IBOutlet UIButton *decBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;

@end

NS_ASSUME_NONNULL_END
