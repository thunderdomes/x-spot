//
//  msfObject.m
//  PAN-AM
//
//  Created by Arie on 7/21/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "msfObject.h"

@implementation msfObject
-(id)initWithDictionary:(NSDictionary *)dictionary{
	self=[super init];
	if(self){
        
		//self.BirthDate=[dictionary objectForKey:@"BirthDate"];
        self.VoucherSts =[dictionary objectForKey:@"VoucherSts"];
		self.TransDate =[dictionary objectForKey:@"TransDate"];
		self.Customer=[dictionary objectForKey:@"Customer"];
		self.NetAmount=[dictionary objectForKey:@"NetAmount"];
		self.SellingFeePercent=[dictionary objectForKey:@"SellingFeePercent"];
		self.SellingFeeAmount=[dictionary objectForKey:@"SellingFeeAmount"];
        
        
	}
    
	return self;
}

@end
