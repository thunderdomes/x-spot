//
//  csViewController.h
//  PAN-AM
//
//  Created by Arie on 7/22/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "calendarPic.h"
@interface csViewController : UIViewController
{
	UIView *pilihCal;
	UIView *pilihCal2;
	UIView *divider;
	UIView *divider2;
	
	UILabel *tanggal1;
	UILabel *tanggal2;
	calendarPic *calwins;
	UIButton *cari;
	
}
@property(strong,nonatomic) NSString *tanggal_1;
@property(strong,nonatomic) NSString *tanggal_2;
@end

