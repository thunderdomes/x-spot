//
//  netraAppDelegate.h
//  PAN-AM
//
//  Created by Arie on 6/18/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface netraAppDelegate : UIResponder <UIApplicationDelegate> {
    NSString *customerName;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) JASidePanelController *viewController;
@property (strong, nonatomic) NSString *lastController;
@property (strong, nonatomic) UINavigationBar *navBar;
//dari ipad
@property (strong, nonatomic) NSMutableString *fvalueGlobalString;
@property (strong, nonatomic) NSString *fvalueString;
@property (strong, nonatomic) NSString *customerName;
@property (strong, nonatomic) NSString *linkURL;
@property (strong, nonatomic) NSArray *arrayCustodianID;
@property (strong, nonatomic) NSString *custodianID;
@property (strong, nonatomic) NSString *namaRek;
@property (nonatomic, assign) NSInteger index;


@property (strong, nonatomic) NSString *nasabahText;
@property (strong, nonatomic) NSString *CIFText;
@property (strong, nonatomic) NSString *tgl_lahirText;
@property (strong, nonatomic) NSString *alamatText1;
@property (strong, nonatomic) NSString *alamatText2;
@property (strong, nonatomic) NSString *teleponText1;
@property (strong, nonatomic) NSString *teleponText2;
@property (strong, nonatomic) NSString *emailText;
@property (strong, nonatomic) NSString *expiredText;
@property (strong, nonatomic) NSString *mktkdText;
@property (strong, nonatomic) NSString *mktContactext;
@property (strong, nonatomic) NSString *mktEmailText;
@property (strong, nonatomic) NSString *namaText;
@property (strong, nonatomic) NSString *mktBranchText;

@end
