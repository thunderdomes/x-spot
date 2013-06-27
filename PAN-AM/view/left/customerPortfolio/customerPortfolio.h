//
//  customerPortfolio.h
//  PAN-AM
//
//  Created by Arie on 6/27/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customerPortfolio : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
	UITableView *customer;
	NSMutableArray *fetchData;
	NSMutableArray *filteredData;
	UIView *wrapper;
	
	UIView *wrapper_atas;
	UIView *nasabah;
	UILabel *nasabah_atas;
	UILabel *nasabah_total;
	
	UILabel *investment_atas;
	UILabel *investment_bawah;
	UILabel *investment_total;
	UIView *searchbarContainer;
	UIView *paddingView;
	UIView *investment;
	UITextField *searchForm;
	float total_investment;
}
@end
