//
//  feeMarkettingViewController.h
//  PAN-AM
//
//  Created by Arie on 7/20/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "calendarPic.h"
@interface feeMarkettingViewController : UIViewController
{
	UIView *pilihCal;
	UIView *pilihCal2;
	UIView *divider;
	UIView *divider2;
	UIButton *cari;
	UILabel *tanggal1;
	UILabel *tanggal2;
	calendarPic *calwin;
	
}
@property(strong,nonatomic) NSString *tanggal_1;
@property(strong,nonatomic) NSString *tanggal_2;
@end
