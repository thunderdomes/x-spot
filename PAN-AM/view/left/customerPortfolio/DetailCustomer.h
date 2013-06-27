//
//  DetailCustomer.h
//  PAN-AM
//
//  Created by Arie on 6/27/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailCustomer : UIViewController
{
	UILabel *Name;
	UILabel *Money;
	UILabel *CIFx;
	UILabel *LastTrans;
	
}
@property(nonatomic,strong) NSString *CIF;


@end
