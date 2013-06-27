//
//  common.m
//  PAN-AM
//
//  Created by Arie on 6/27/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "common.h"

@implementation common
@synthesize sessionString;
static common *sharedObject;
NSString *newsUrl = @"http://www.panin-am.co.id:800/jsonviewnews.aspx";
NSString *tradeUrl=@"http://panin-am.co.id:800/json.aspx";
+ (common*)sharedInstance
{
    if (sharedObject == nil) {
        sharedObject = [[super allocWithZone:NULL] init];
    }
    return sharedObject;
}
+(NSString *) getSessionActive {
    // Ensure we are using the shared instance
    common *shared = [common sharedInstance];
    return shared.sessionString;
}
+(void) setSessionId:(NSString *)session {
    // Ensure we are using the shared instance
    common *shared = [common sharedInstance];
    shared.sessionString = session;
}
@end
