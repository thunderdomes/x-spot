//
//  Mitra.h
//  PAN-AM
//
//  Created by Arie on 6/27/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Mitra : NSManagedObject

@property (nonatomic, retain) NSString * birthDate;
@property (nonatomic, retain) NSString * customerName;
@property (nonatomic, retain) NSString * customerNo;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * fund;
@property (nonatomic, retain) NSString * lastTransDate;
@property (nonatomic, retain) NSString * totalAmountNonUSD;
@property (nonatomic, retain) NSString * totalAmountUSD;

@end
