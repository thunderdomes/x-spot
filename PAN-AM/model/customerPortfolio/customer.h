//
//  netraMX.h
//  PAM-Guide
//
//  Created by Arie on 6/24/13.
//  Copyright (c) 2013 Dave Harry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface customer : NSObject
@property(nonatomic,strong) NSString *BirthDate;
@property(nonatomic,strong) NSString *CustomerName;
@property(nonatomic,strong) NSString *CustomerNo;
@property(nonatomic,strong) NSString *Fund;
@property(nonatomic,strong) NSString *LastTransDate;
@property(nonatomic,strong) NSString *TotalAmountNonUSD;
@property(nonatomic,strong) NSString *TotalAmountUSD;

-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
