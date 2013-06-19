//
//  netraLeftViewController.h
//  PAN-AM
//
//  Created by Arie on 6/18/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface netraLeftViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
	UITableView *netraTable;
	NSMutableArray *netraMutableArray;
}
@property (nonatomic, retain) NSArray *arrayOriginal;
@property (nonatomic, retain) NSMutableArray *arForTable;
@end
