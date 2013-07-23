//
//  netraMX.m
//  PAM-Guide
//
//  Created by Arie on 6/24/13.
//  Copyright (c) 2013 Dave Harry. All rights reserved.
//

#import "saldoMX.h"

@implementation saldoMX

-(id)initWithDictionary:(NSDictionary *)dictionary{
	self=[super init];
	if(self){
        
		//self.BirthDate=[dictionary objectForKey:@"BirthDate"];
        self.fundname =[dictionary objectForKey:@"fundName"];
		self.unit =[dictionary objectForKey:@"unit"];
		self.averageNAv=[dictionary objectForKey:@"averageNAv"];
		self.closingNAV=[dictionary objectForKey:@"closingNAV"];
		self.fundValue=[dictionary objectForKey:@"fundValue"];
		self.marketValue=[dictionary objectForKey:@"marketValue"];
		self.gainOrLost=[dictionary objectForKey:@"gainOrLost"];
		self.gainOrLostPercentage=[dictionary objectForKey:@"gainOrLostPercentage"];
        self.Currency = [dictionary objectForKey:@"Currency"];
     
	}
    
	return self;
}

@end
