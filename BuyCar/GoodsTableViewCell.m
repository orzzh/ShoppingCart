//
//  GoodsTableViewCell.m
//  BuyCar
//
//  Created by 张子豪 on 2019/1/26.
//  Copyright © 2019 张子豪. All rights reserved.
//

#import "GoodsTableViewCell.h"

@implementation GoodsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(GoodModel *)model
{
    _model = model;
    
    self.goodName.text = model.goodName;
    self.goodPrice.text = model.goodPrice;
    self.numLabel.text = [NSString stringWithFormat:@"%zd",model.goodNum];
    self.selectBtn.selected = model.goodSelect;
}

- (IBAction)desAction:(id)sender {
    if ([self.delegate  respondsToSelector:@selector(goodsCell:decGoodAtSection:row:)]) {
        [self.delegate goodsCell:self decGoodAtSection:0 row:0];
    }
}
- (IBAction)addAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(goodsCell:addGoodAtSection:row:)]) {
        [self.delegate goodsCell:self addGoodAtSection:0 row:0];
    }
}
- (IBAction)selectAction:(id)sender {
    if ( [self.delegate respondsToSelector:@selector(goodsCell:selectAllAtSection:)]) {
        [self.delegate goodsCell:self selectAtSection:0 row:0];
    }
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
