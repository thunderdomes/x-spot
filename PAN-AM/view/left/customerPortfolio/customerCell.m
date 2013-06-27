//
//  customerCell.m
//  PAN-AM
//
//  Created by Arie on 6/27/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "customerCell.h"

@implementation customerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		self.nama=[[UILabel alloc]initWithFrame:CGRectMake(10, 6, 300, 20)];
		self.nama.backgroundColor=[UIColor clearColor];
		self.nama.textColor=[UIColor colorWithRed:0 green:0.486 blue:0.557 alpha:1];
		self.nama.lineBreakMode = NSLineBreakByClipping;
		self.nama.numberOfLines = 1;
		self.nama.font=[UIFont fontWithName:@"AvenirNext-Medium" size:15];
		
		self.balance=[[UILabel alloc]initWithFrame:CGRectMake(10, 20, 300, 50)];
		self.balance.backgroundColor=[UIColor clearColor];
		self.balance.textColor=[UIColor colorWithRed:0.004 green:0.369 blue:0.424 alpha:1];
		self.balance.lineBreakMode = NSLineBreakByWordWrapping;
		self.balance.numberOfLines = 2;
		self.balance.font=[UIFont fontWithName:@"AvenirNext-Medium" size:13];
		
		[self.contentView addSubview:self.nama];
		[self.contentView addSubview:self.balance];
		
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
