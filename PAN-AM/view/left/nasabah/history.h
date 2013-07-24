//
//  history.h
//  PAN-AM
//
//  Created by Arie on 7/22/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSegmentedControl.h"
#import "calendarPic.h"
@interface history : UIViewController<UIScrollViewDelegate>
{
	UILabel *pilihjml;
	UIButton *btnJml;
	
	UILabel *pilihPeriod;
	UIButton *btnpilihPeriod;
	calendarPic *calwins;
	UIButton *cari;
	
}
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl4;
@end
