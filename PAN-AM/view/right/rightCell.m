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
		self.product=[[UILabel alloc]initWithFrame:CGRectMake(80, 5, 130, 36)];
		self.product.backgroundColor=[UIColor clearColor];
		self.product.numberOfLines=2;
		self.product.lineBreakMode=NSLineBreakByCharWrapping;
		self.product.textColor=[UIColor colorWithRed:0.624 green:0.71 blue:0.722 alpha:1];
		self.product.font=[UIFont fontWithName:@"AvenirNext-Medium" size:13];
		
		
		self.precentage=[[UILabel alloc]initWithFrame:CGRectMake(320-90, 10, 80, 15)];
		self.precentage.backgroundColor=[UIColor clearColor];
		self.precentage.textAlignment=NSTextAlignmentRight;
		self.precentage.font=[UIFont fontWithName:@"AvenirNext-Medium" size:16];
		
		self.separators=[[UIView alloc]initWithFrame:CGRectMake(320-80, 30, 70, 1)];
		self.separators.backgroundColor=[UIColor redColor];
		
		self.valueofData=[[UILabel alloc]initWithFrame:CGRectMake(320-90, 35, 80, 15)];
		self.valueofData.backgroundColor=[UIColor clearColor];
		self.valueofData.textColor=[UIColor whiteColor];
		self.valueofData.textAlignment=NSTextAlignmentRight;
		self.valueofData.font=[UIFont fontWithName:@"AvenirNext-Medium" size:16];
		
		self.status=[[UIImageView alloc]initWithFrame:CGRectMake(320-75, 10, 12.5, 10.5)];
		self.status.backgroundColor=[UIColor clearColor];
		
		[self.contentView addSubview:self.precentage];
		[self.contentView addSubview:self.separators];
		[self.contentView addSubview:self.product];
		[self.contentView addSubview:self.valueofData];
		[self.contentView addSubview:self.status];
		

		
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
