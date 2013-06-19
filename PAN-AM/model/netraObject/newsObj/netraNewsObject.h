//
//  netraNewsObject.h
//  PAN-AM
//
//  Created by Arie on 6/19/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface netraNewsObject : NSObject
@property(nonatomic,strong) NSString *author;
@property(nonatomic,strong) NSString *fileName;
@property(nonatomic,strong) NSString *modifiedDate;
@property(nonatomic,strong) NSString *newsID;
@property(nonatomic,strong) NSString *newsLink;
@property(nonatomic,strong) NSString *shortDesc;
@property(nonatomic,strong) NSString *title;

-(id)initWithDictionary:(NSDictionary *)dictionary;
@end
