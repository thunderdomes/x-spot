//
//  netraNewsObject.m
//  PAN-AM
//
//  Created by Arie on 6/19/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "netraNewsObject.h"

@implementation netraNewsObject
@synthesize author=_author;
@synthesize fileName=_fileName;
@synthesize modifiedDate=_modifiedDate;
@synthesize newsID=_newsID;
@synthesize newsLink=_newsLink;
@synthesize shortDesc=_shortDesc;
@synthesize title=_title;

-(id)initWithDictionary:(NSDictionary *)dictionary{
	self=[super init];
	if(self){
		self.author=[dictionary objectForKey:@"author"];
		self.fileName=[dictionary objectForKey:@"fileName"];
		self.modifiedDate=[dictionary objectForKey:@"modifiedDate"];
		self.newsID=[dictionary objectForKey:@"newsID"];
		self.newsLink=[dictionary objectForKey:@"newsLink"];
		self.shortDesc=[dictionary objectForKey:@"shortDesc"];
		self.title=[dictionary objectForKey:@"title"];
	}
	return self;
}

@end
