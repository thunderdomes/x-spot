//
//  msfObject.h
//  PAN-AM
//
//  Created by Arie on 7/21/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface msfObject : NSObject
@property (nonatomic, retain) NSString * VoucherSts;
@property (nonatomic, retain) NSString * TransDate;
@property (nonatomic, retain) NSString * Customer;
@property (nonatomic, retain) NSString * NetAmount;
@property (nonatomic, retain) NSString * SellingFeePercent;
@property (nonatomic, retain) NSString * SellingFeeAmount;

-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
