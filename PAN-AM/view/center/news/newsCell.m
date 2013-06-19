//
//  newsCell.m
//  PAN-AM
//
//  Created by Arie on 6/19/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "newsCell.h"

@implementation newsCell
@synthesize title=_title;
@synthesize excerpt=_excerpt;
@synthesize date=_date;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		_title=[[UILabel alloc]initWithFrame:CGRectMake(10, 6, 300, 20)];
		_title.backgroundColor=[UIColor clearColor];
		_title.textColor=[UIColor colorWithRed:0 green:0.486 blue:0.557 alpha:1];
		_title.lineBreakMode = NSLineBreakByClipping;
		_title.numberOfLines = 1;
		_title.font=[UIFont fontWithName:@"AvenirNext-Bold" size:15];
		
		
		_excerpt=[[UILabel alloc]initWithFrame:CGRectMake(10, 20, 300, 50)];
		_excerpt.backgroundColor=[UIColor clearColor];
		_excerpt.textColor=[UIColor colorWithRed:0.004 green:0.369 blue:0.424 alpha:1];
		_excerpt.lineBreakMode = NSLineBreakByWordWrapping;
		_excerpt.numberOfLines = 2;
		_excerpt.font=[UIFont fontWithName:@"AvenirNext-Medium" size:13];
		
		_date=[[UILabel alloc]initWithFrame:CGRectMake(10, 50, 300, 50)];
		_date.backgroundColor=[UIColor clearColor];
		_date.font=[UIFont fontWithName:@"AvenirNext-Bold" size:12];
		_date.textColor=[UIColor colorWithRed:0.608 green:0 blue:0 alpha:1];
		
		[self.contentView addSubview:_title];
		[self.contentView addSubview:_excerpt];
		[self.contentView addSubview:_date];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
