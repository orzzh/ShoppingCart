//
//  ShopHeadView.m
//  BuyCar
//
//  Created by 张子豪 on 2019/1/26.
//  Copyright © 2019 张子豪. All rights reserved.
//

#import "ShopHeadView.h"

@implementation ShopHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.selectBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 15, 20, 20)];
        [self.selectBtn setImage:[UIImage imageNamed:@"select_norm"] forState:UIControlStateNormal];
        [self.selectBtn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateSelected];
        
        self.shopImageView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 10, 30, 30)];
        self.shopImageView.backgroundColor = [UIColor redColor];
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 0, self.frame.size.width - 80, self.frame.size.height)];
        self.titleLabel.text = @"商店名";
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = [UIColor blackColor];
        
        [self addSubview:self.selectBtn];
        [self addSubview:self.titleLabel];
        [self addSubview:self.shopImageView];
        
    }
    return self;
}

@end
