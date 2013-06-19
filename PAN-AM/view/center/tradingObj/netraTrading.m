//
//  netraTrading.m
//  PAN-AM
//
//  Created by Arie on 6/19/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "netraTrading.h"

@implementation netraTrading
@synthesize AUMAmount=_AUMAmount;
@synthesize FiveY=_FiveY;
@synthesize NABDate=_NABDate;
@synthesize NABValue=_NABValue;
@synthesize OneD=_OneD;
@synthesize OneDV=_OneDV;
@synthesize OneM=_OneM;

@synthesize OneMV=_OneMV;
@synthesize OneW=_OneW;
@synthesize OneWV=_OneWV;
@synthesize OneY=_OneY;
@synthesize OneYV=_OneYV;
@synthesize ProductID=_ProductID;
@synthesize ProductName=_ProductName;

@synthesize Star=_Star;
@synthesize StarDate=_StarDate;
@synthesize ThreeM=_ThreeM;
@synthesize ThreeY=_ThreeY;
@synthesize ThreeYV=_ThreeYV;
@synthesize YTD=_YTD;

-(id)initWithDictionary:(NSDictionary *)dictionary{
	self=[super init];
	if(self){
		//format navBval
		NSString *a=[[dictionary objectForKey:@"NABValue"]stringValue];
		NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setGroupingSeparator:@","];
        [numberFormatter setGroupingSize:3];
        [numberFormatter setUsesGroupingSeparator:YES];
        [numberFormatter setDecimalSeparator:@"."];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [numberFormatter setMaximumFractionDigits:2];
        NSNumber *number = [numberFormatter numberFromString:a];
        NSString *theString = [numberFormatter stringFromNumber:number];
        NSString *newStringValue = [theString
                                    stringByReplacingOccurrencesOfString:@"," withString:@"x"];
        newStringValue = [newStringValue
                          stringByReplacingOccurrencesOfString:@"." withString:@","];
        newStringValue = [newStringValue
                          stringByReplacingOccurrencesOfString:@"x" withString:@"."];
		self.NABValue=newStringValue;
		self.ProductName=[dictionary objectForKey:@"ProductName"];
		
		self.OneD=[NSString stringWithFormat:@"%0.2f%%", [[dictionary objectForKey:@"OneD"] floatValue]];
		
		self.Star=[dictionary objectForKey:@"Star"];
	}
	return self;
}
@end
