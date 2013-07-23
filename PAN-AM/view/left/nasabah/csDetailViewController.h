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
}
@end
