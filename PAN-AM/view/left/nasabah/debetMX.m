//
//  netraMX.m
//  PAM-Guide
//
//  Created by Arie on 6/24/13.
//  Copyright (c) 2013 Dave Harry. All rights reserved.
//

#import "debetMX.h"

@implementation debetMX

-(id)initWithDictionary:(NSDictionary *)dictionary{
	self=[super init];
	if(self){
        
		//self.BirthDate=[dictionary objectForKey:@"BirthDate"];
		self.FundName =[dictionary objectForKey:@"FundName"];
		self.EveryDate=[dictionary objectForKey:@"EveryDate"];
		self.StartMonth=[dictionary objectForKey:@"StartMonth"];
		self.StartYear=[dictionary objectForKey:@"StartYear"];
		self.EndMonth=[dictionary objectForKey:@"EndMonth"];
		self.EndYear=[dictionary objectForKey:@"EndYear"];
		self.Nominal=[dictionary objectForKey:@"Nominal"];
        self.Fee=[dictionary objectForKey:@"Fee"];
        self.unitBalance=[dictionary objectForKey:@"unitBalance"];
        self.BankName=[dictionary objectForKey:@"BankName"];
        self.ProductName=[dictionary objectForKey:@"ProductName"];
	}
    
	return self;
}

@end
