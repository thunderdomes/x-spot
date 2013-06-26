//
//  customerPortfolio.h
//  PAN-AM
//
//  Created by Arie on 6/27/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customerPortfolio : UIViewController
{
	UITableView *customer;
	NSMutableArray *fetchData;
	NSMutableArray *filteredData;
	UIView *wrapper;
	UIView *nasabah;
	UILabel *nasabah_atas;
	UILabel *nasabah_total;
	
	UILabel *investment_atas;
	UILabel *investment_total;
	
	UIView *investment;
	float total_investment;
}
@end
