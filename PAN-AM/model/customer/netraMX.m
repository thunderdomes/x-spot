//
//  netraMX.m
//  PAM-Guide
//
//  Created by Arie on 6/24/13.
//  Copyright (c) 2013 Dave Harry. All rights reserved.
//

#import "netraMX.h"

@implementation netraMX
-(id)initWithDictionary:(NSDictionary *)dictionary{
	self=[super init];
	if(self){
		//self.BirthDate=[dictionary objectForKey:@"BirthDate"];
		self.BirthDate=[dictionary objectForKey:@"BirthDate"];
		self.CustomerName=[dictionary objectForKey:@"CustomerName"];
		self.CustomerNo=[dictionary objectForKey:@"CustomerNo"];
		self.Fund=[dictionary objectForKey:@"Fund"];
		self.LastTransDate=[dictionary objectForKey:@"LastTransDate"];
		self.TotalAmountNonUSD=[dictionary objectForKey:@"TotalAmountNonUSD"];
		self.TotalAmountUSD=[dictionary objectForKey:@"TotalAmountUSD"];
	}
	return self;
}

@end
