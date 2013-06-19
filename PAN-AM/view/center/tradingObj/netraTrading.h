//
//  netraTrading.h
//  PAN-AM
//
//  Created by Arie on 6/19/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface netraTrading : NSObject

@property(nonatomic,strong) NSString *AUMAmount;
@property(nonatomic,strong) NSString *FiveY;
@property(nonatomic,strong) NSString *NABDate;
@property(nonatomic,strong) NSString *NABValue;
@property(nonatomic,strong) NSString *OneD;
@property(nonatomic,strong) NSString *OneDV;
@property(nonatomic,strong) NSString *OneM;

@property(nonatomic,strong) NSString *OneMV;
@property(nonatomic,strong) NSString *OneW;
@property(nonatomic,strong) NSString *OneWV;
@property(nonatomic,strong) NSString *OneY;
@property(nonatomic,strong) NSString *OneYV;
@property(nonatomic,strong) NSString *ProductID;
@property(nonatomic,strong) NSString *ProductName;

@property(nonatomic,strong) NSString *Star;
@property(nonatomic,strong) NSString *StarDate;
@property(nonatomic,strong) NSString *ThreeM;
@property(nonatomic,strong) NSString *ThreeY;
@property(nonatomic,strong) NSString *ThreeYV;
@property(nonatomic,strong) NSString *YTD;


-(id)initWithDictionary:(NSDictionary *)dictionary;
@end
