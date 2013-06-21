//
//  netraGLobalLoginViewController.h
//  PAN-AM
//
//  Created by Arie on 6/21/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface netraGLobalLoginViewController : UIViewController<UITextFieldDelegate>
{
	UILabel *Title;
	UITextField *username;
	UITextField *password;
}
@property (nonatomic,strong) NSString *Status;
@end
