//
//  common.h
//  PAN-AM
//
//  Created by Arie on 6/27/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface common : NSObject{
    // Instance variables:
    //   - Declare as usual.  The alloc/sharedIntance.
    NSString *sessionString;
}
extern NSString *newsUrl;
extern NSString *tradeUrl;
// Properties as usual
@property (nonatomic, retain) NSString *sessionString;
@property (nonatomic, retain) NSString *dateStart;
@property (nonatomic, retain) NSString *dateEnd;


// Required: A method to retrieve the shared instance
+(common *) sharedInstance;


// Shared Public Methods:
//   - Using static methods for opertations is a nice convenience
//   - Each method should ensure it is using the above sharedInstance
+(NSString *) getSessionActive;
+(NSString *) dateEnd;
+(NSString *) dateStart;

+(void) setSessionId:(NSString *)session;
+(void)setStart:(NSString *)dateS dateE:(NSString *)end;

// Instance Methods: Declare and implement as usual
@end
