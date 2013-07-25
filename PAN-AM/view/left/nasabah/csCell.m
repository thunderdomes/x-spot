//
//  csCell.m
//  PAN-AM
//
//  Created by Arie on 7/22/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "csCell.h"

@implementation csCell
/*
 @property (nonatomic, retain) UILabel * fundname;
 @property (nonatomic, retain) UILabel * unit;
 @property (nonatomic, retain) UILabel * averageNAv;
 @property (nonatomic, retain) UILabel * closingNAV;
 @property (nonatomic, retain) UILabel * fundValue;
 @property (nonatomic, retain) UILabel * marketValue;
 @property (nonatomic, retain) UILabel * gainOrLost;
 @property (nonatomic, retain) UILabel * gainOrLostPercentage;
 @property (nonatomic, retain) UILabel * custodianID;
 @property (nonatomic, retain) UILabel * Currency;
 @property (nonatomic, retain) UILabel * CurrencyIDR;
 */
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		self.fundname=[[UILabel alloc]initWithFrame:CGRectMake(0, 5, 320, 22)];
		self.fundname.textAlignment=NSTextAlignmentCenter;
		self.fundname.font=[UIFont fontWithName:@"Avenir-Medium" size:14];
		self.fundname.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		self.fundname.backgroundColor=[UIColor clearColor];
        self.fundname.textAlignment=NSTextAlignmentCenter;
		
		self.unit=[[UILabel alloc]initWithFrame:CGRectMake(0, 30, 90, 31)];
		self.unit.textAlignment=NSTextAlignmentCenter;
		self.unit.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		self.unit.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		self.unit.backgroundColor=[UIColor clearColor];
        self.unit.textAlignment=NSTextAlignmentCenter;
		
		self.averageNAv=[[UILabel alloc]initWithFrame:CGRectMake(107, 30, 90, 31)];
		self.averageNAv.textAlignment=NSTextAlignmentCenter;
		self.averageNAv.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		self.averageNAv.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		self.averageNAv.backgroundColor=[UIColor clearColor];
        self.averageNAv.textAlignment=NSTextAlignmentCenter;
		
		self.closingNAV=[[UILabel alloc]initWithFrame:CGRectMake(204, 30, 90, 31)];
		self.closingNAV.textAlignment=NSTextAlignmentCenter;
		self.closingNAV.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		self.closingNAV.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		self.closingNAV.backgroundColor=[UIColor clearColor];
        self.closingNAV.textAlignment=NSTextAlignmentCenter;
		
		/////
		self.fundValue=[[UILabel alloc]initWithFrame:CGRectMake(0, 60, 90, 31)];
		self.fundValue.textAlignment=NSTextAlignmentCenter;
		self.fundValue.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		self.fundValue.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		self.fundValue.backgroundColor=[UIColor clearColor];
        self.fundValue.textAlignment=NSTextAlignmentCenter;
		
		self.marketValue=[[UILabel alloc]initWithFrame:CGRectMake(107, 60, 90, 31)];
		self.marketValue.textAlignment=NSTextAlignmentCenter;
		self.marketValue.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		self.marketValue.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		self.marketValue.backgroundColor=[UIColor clearColor];
        self.marketValue.textAlignment=NSTextAlignmentCenter;
		
		self.gainOrLost=[[UILabel alloc]initWithFrame:CGRectMake(204, 55, 90, 31)];
		self.gainOrLost.textAlignment=NSTextAlignmentCenter;
		self.gainOrLost.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		self.gainOrLost.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		self.gainOrLost.backgroundColor=[UIColor clearColor];
        self.gainOrLost.textAlignment=NSTextAlignmentCenter;
		
		self.gainOrLostPercentage=[[UILabel alloc]initWithFrame:CGRectMake(204, 70, 90, 31)];
		self.gainOrLostPercentage.textAlignment=NSTextAlignmentCenter;
		self.gainOrLostPercentage.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		self.gainOrLostPercentage.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		self.gainOrLostPercentage.backgroundColor=[UIColor clearColor];
        self.gainOrLostPercentage.textAlignment=NSTextAlignmentCenter;

		

		[self.contentView addSubview:self.fundname];
		[self.contentView addSubview:self.unit];
		[self.contentView addSubview:self.closingNAV];
		[self.contentView addSubview:self.averageNAv];
		[self.contentView addSubview:self.fundValue];
		[self.contentView addSubview:self.marketValue];
		[self.contentView addSubview:self.gainOrLost];
		[self.contentView addSubview:self.gainOrLostPercentage];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
