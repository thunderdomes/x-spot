//
//  calendarPic.h
//  PAN-AM
//
//  Created by Arie on 7/20/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSLCalendarView.h"
@interface calendarPic : UIViewController<DSLCalendarViewDelegate>
{
 DSLCalendarView *calendarView;
	NSString *dateStart;
	NSString *dateEnd;
}
@end
