//
//  msCell.m
//  PAN-AM
//
//  Created by Arie on 7/21/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "msCell.h"

@implementation msCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		self.nasabahName=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, 300, 20)];
		self.nasabahName.backgroundColor=[UIColor clearColor];
		self.nasabahName.font=[UIFont fontWithName:@"AvenirNext-DemiBold" size:9];
		self.nasabahName.textAlignment=NSTextAlignmentCenter;
		self.nasabahName.textColor=[UIColor colorWithRed:0 green:0.486 blue:0.557 alpha:1];
		
		self.type=[[UILabel alloc]initWithFrame:CGRectMake(5, 33, 20, 20)];
		self.type.backgroundColor=[UIColor clearColor];
		self.type.font=[UIFont fontWithName:@"AvenirNext-DemiBold" size:9];
		self.type.textAlignment=NSTextAlignmentCenter;
		self.type.textColor=[UIColor colorWithRed:0 green:0.486 blue:0.557 alpha:1];
		
		self.tanggal=[[UILabel alloc]initWithFrame:CGRectMake(35, 33, 70, 20)];
		self.tanggal.backgroundColor=[UIColor clearColor];
		self.tanggal.font=[UIFont fontWithName:@"AvenirNext-DemiBold" size:9];
		self.tanggal.textAlignment=NSTextAlignmentLeft;
		self.tanggal.textColor=[UIColor colorWithRed:0 green:0.486 blue:0.557 alpha:1];
		
		self.jumlah=[[UILabel alloc]initWithFrame:CGRectMake(95, 33, 80, 20)];
		self.jumlah.backgroundColor=[UIColor clearColor];
		self.jumlah.font=[UIFont fontWithName:@"AvenirNext-DemiBold" size:11];
		self.jumlah.textAlignment=NSTextAlignmentCenter;
		self.jumlah.textColor=[UIColor colorWithRed:0 green:0.486 blue:0.557 alpha:1];
		
		self.fee=[[UILabel alloc]initWithFrame:CGRectMake(210, 33, 80, 20)];
		self.fee.backgroundColor=[UIColor clearColor];
		self.fee.font=[UIFont fontWithName:@"AvenirNext-DemiBold" size:11];
		self.fee.textAlignment=NSTextAlignmentLeft;
		self.fee.textColor=[UIColor colorWithRed:0 green:0.486 blue:0.557 alpha:1];
		
		self.rp=[[UILabel alloc]initWithFrame:CGRectMake(270, 33, 80, 20)];
		self.rp.backgroundColor=[UIColor clearColor];
		self.rp.font=[UIFont fontWithName:@"AvenirNext-DemiBold" size:11];
		self.rp.textAlignment=NSTextAlignmentLeft;
		self.rp.textColor=[UIColor colorWithRed:0 green:0.486 blue:0.557 alpha:1];
		[self.contentView addSubview:self.nasabahName];
		[self.contentView addSubview:self.type];
		[self.contentView addSubview:self.tanggal];
		[self.contentView addSubview:self.jumlah];
		[self.contentView addSubview:self.fee];
		[self.contentView addSubview:self.rp];

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
