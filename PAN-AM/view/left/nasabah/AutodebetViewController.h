//
//  AutodebetViewController.h
//  PAN-AM
//
//  Created by Arie on 7/23/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutodebetViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
	NSMutableDictionary *observers;
    UITableView *netra;
}
@property (strong,nonatomic) NSMutableArray *netrax;
@end
