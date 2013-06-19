//
//  rightCell.m
//  PAN-AM
//
//  Created by Arie on 6/19/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "rightCell.h"

@implementation rightCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		self.product=[[UILabel alloc]initWithFrame:CGRectMake(80, 5, 130, 40)];
		self.product.backgroundColor=[UIColor clearColor];
		self.product.numberOfLines=2;
		self.product.lineBreakMode=NSLineBreakByCharWrapping;
		self.product.textColor=[UIColor colorWithRed:0.624 green:0.71 blue:0.722 alpha:1];
		self.product.font=[UIFont fontWithName:@"AvenirNext-Medium" size:13];
		[self.contentView addSubview:self.product];
		
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
