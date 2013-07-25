//
//  csDetailViewController.h
//  PAN-AM
//
//  Created by Arie on 7/22/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface csDetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
	UITableView *detail;
	NSMutableArray *data;
	UILabel *gt_total_unit;
	UILabel *gt_nilai_rata;
	
	UILabel * Dfundname;
	UILabel * Dunit;
	UILabel * DaverageNAv;
	UILabel * DclosingNAV;
	UILabel * DfundValue;
	UILabel * DmarketValue;
	UILabel * DgainOrLost;
	UILabel * DgainOrLostPercentage;
	
	UILabel *gDfundValue;
	UILabel *gDmarketValue;
	UILabel *gDainOrLostPercentage;
	
	UILabel *gtDfundValue;
	UILabel *gtDmarketValue;
	UILabel *gtDainOrLostPercentage;
	UILabel *gtDgainOrLost;
	
	
}
@end
