//
//  autodebetCel.m
//  PAN-AM
//
//  Created by Arie on 7/23/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "autodebetCel.h"

@implementation autodebetCel

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		
		self.fundnameLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, 320, 22)];
		self.fundnameLabel.textAlignment=NSTextAlignmentCenter;
		self.fundnameLabel.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		self.fundnameLabel.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		self.fundnameLabel.backgroundColor=[UIColor clearColor];
        self.fundnameLabel.textAlignment=NSTextAlignmentCenter;
		
		
		
		self.everydateLabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 30, 20, 44)];
		self.everydateLabel.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		self.everydateLabel.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		self.everydateLabel.backgroundColor=[UIColor clearColor];
		self.everydateLabel.textAlignment=NSTextAlignmentLeft;
        
        self.startmonthLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, 30, 30, 44)];
		self.startmonthLabel.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		self.startmonthLabel.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		self.startmonthLabel.backgroundColor=[UIColor clearColor];
		self.startmonthLabel.lineBreakMode=NSLineBreakByCharWrapping;
		self.startmonthLabel.textAlignment=NSTextAlignmentLeft;
        
        self.startyearLabel=[[UILabel alloc]initWithFrame:CGRectMake(35, 30, 50, 44)];
		self.startyearLabel.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		self.startyearLabel.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		self.startyearLabel.backgroundColor=[UIColor clearColor];
		self.startyearLabel.lineBreakMode=NSLineBreakByCharWrapping;
		self.startyearLabel.textAlignment=NSTextAlignmentLeft;
        self.startyearLabel.numberOfLines = 3;
		
		
		
		self.everydateLabel1=[[UILabel alloc]initWithFrame:CGRectMake(65, 30, 20, 44)];
		self.everydateLabel1.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		self.everydateLabel1.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		self.everydateLabel1.backgroundColor=[UIColor clearColor];
		self.everydateLabel1.lineBreakMode=NSLineBreakByCharWrapping;
		self.everydateLabel1.textAlignment=NSTextAlignmentCenter;
        
        self.endmonthLabel=[[UILabel alloc]initWithFrame:CGRectMake(85, 30, 30, 44)];
		self.endmonthLabel.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		self.endmonthLabel.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		self.endmonthLabel.backgroundColor=[UIColor clearColor];
		self.endmonthLabel.lineBreakMode=NSLineBreakByCharWrapping;
		self.endmonthLabel.textAlignment=NSTextAlignmentLeft;
        
        self.endyearLabel=[[UILabel alloc]initWithFrame:CGRectMake(110, 30, 170, 44)];
		self.endyearLabel.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		self.endyearLabel.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		self.endyearLabel.backgroundColor=[UIColor clearColor];
		self.endyearLabel.lineBreakMode=NSLineBreakByCharWrapping;
		self.endyearLabel.textAlignment=NSTextAlignmentLeft;
		
		
		
		self.feeLabel=[[UILabel alloc]initWithFrame:CGRectMake(140, 30, 40, 44)];
		self.feeLabel.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		self.feeLabel.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		self.feeLabel.backgroundColor=[UIColor clearColor];
		self.feeLabel.lineBreakMode=NSLineBreakByCharWrapping;
		self.feeLabel.textAlignment=NSTextAlignmentCenter;
        
		self.productnameLabel=[[UILabel alloc]initWithFrame:CGRectMake(190, 30, 140, 44)];
		self.productnameLabel.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		self.productnameLabel.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		self.productnameLabel.backgroundColor=[UIColor clearColor];
		self.productnameLabel.lineBreakMode=NSLineBreakByCharWrapping;
		self.productnameLabel.textAlignment=NSTextAlignmentCenter;
		
        
		
        
        self.nominalLabel=[[UILabel alloc]initWithFrame:CGRectMake(150, 60, 170, 44)];
		self.nominalLabel.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		self.nominalLabel.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		self.nominalLabel.backgroundColor=[UIColor clearColor];
		self.nominalLabel.lineBreakMode=NSLineBreakByCharWrapping;
		self.nominalLabel.textAlignment=NSTextAlignmentCenter;
        
        self.bankNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(130, 60, 170, 44)];
		self.bankNameLabel.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		self.bankNameLabel.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		self.bankNameLabel.backgroundColor=[UIColor clearColor];
		self.bankNameLabel.lineBreakMode=NSLineBreakByCharWrapping;
		self.bankNameLabel.textAlignment=NSTextAlignmentLeft;
        
       
        //self.productnameLabel.numberOfLines = 3;
        
        
        
        self.unitbalanceLabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 60, 30, 44)];
		self.unitbalanceLabel.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		self.unitbalanceLabel.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		self.unitbalanceLabel.backgroundColor=[UIColor clearColor];
		self.unitbalanceLabel.lineBreakMode=NSLineBreakByCharWrapping;
		self.unitbalanceLabel.textAlignment=NSTextAlignmentRight;
        
		
		
		
        [self.contentView addSubview:self.fundnameLabel];
		[self.contentView addSubview:self.everydateLabel];
		[self.contentView addSubview:self.everydateLabel1];
		[self.contentView addSubview:self.feeLabel];
        [self.contentView addSubview:self.startmonthLabel];
        [self.contentView addSubview:self.startyearLabel];
        [self.contentView addSubview:self.endmonthLabel];
        [self.contentView addSubview:self.endyearLabel];
        [self.contentView addSubview:self.nominalLabel];
        [self.contentView addSubview:self.bankNameLabel];
        [self.contentView addSubview:self.productnameLabel];
        [self.contentView addSubview:self.unitbalanceLabel];
		
		self.contentView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"pam-iphone-nasabah-autodebet-content-320x104"]];
    }    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
