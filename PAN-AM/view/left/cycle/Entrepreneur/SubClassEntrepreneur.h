//
//  SubClassHajj.h
//  PAM-Guide
//
//  Created by Dave Harry on 6/7/13.
//  Copyright (c) 2013 Dave Harry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Form.h"

@interface SubClassEntrepreneur : UIViewController
{
    UIViewController *subv;
    Form *Form;

}

@property(nonatomic,strong) IBOutlet UIScrollView *txtscroll;

@end
