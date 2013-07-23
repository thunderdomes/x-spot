//
//  netraMX.h
//  PAM-Guide
//
//  Created by Arie on 6/24/13.
//  Copyright (c) 2013 Dave Harry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface saldoMX : NSObject

@property (nonatomic, retain) NSString * fundname;
@property (nonatomic, retain) NSString * unit;
@property (nonatomic, retain) NSString * averageNAv;
@property (nonatomic, retain) NSString * closingNAV;
@property (nonatomic, retain) NSString * fundValue;
@property (nonatomic, retain) NSString * marketValue;
@property (nonatomic, retain) NSString * gainOrLost;
@property (nonatomic, retain) NSString * gainOrLostPercentage;
@property (nonatomic, retain) NSString * custodianID;
@property (nonatomic, retain) NSString * Currency;
@property (nonatomic, retain) NSString * CurrencyIDR;



-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
