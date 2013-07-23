//
//  detailsFee.h
//  PAN-AM
//
//  Created by Arie on 7/20/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailsFee : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
	UITableView *detail_fee;
	NSMutableArray *details_array;
}
@end
