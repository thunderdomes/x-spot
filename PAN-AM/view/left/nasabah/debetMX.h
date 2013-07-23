//
//  netraMX.h
//  PAM-Guide
//
//  Created by Arie on 6/24/13.
//  Copyright (c) 2013 Dave Harry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface debetMX : NSObject

@property (nonatomic, retain) NSString * FundName;
@property (nonatomic, retain) NSString * EveryDate;
@property (nonatomic, retain) NSString * StartMonth;
@property (nonatomic, retain) NSString * StartYear;
@property (nonatomic, retain) NSString * EndMonth;
@property (nonatomic, retain) NSString * EndYear;
@property (nonatomic, retain) NSString * Nominal;
@property (nonatomic, retain) NSString * Fee;
@property (nonatomic, retain) NSString * unitBalance;
@property (nonatomic, retain) NSString * BankName;
@property (nonatomic, retain) NSString * ProductName;

-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
