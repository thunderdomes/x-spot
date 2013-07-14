//
//  netraAppDelegate.m
//  PAN-AM
//
//  Created by Arie on 6/18/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "netraAppDelegate.h"
#import "netraViewController.h"
#import "netraViewControllerRight.h"
#import "netraLeftViewController.h"
//#import "netraBerkalaViewController.h"
//#import "netraHasilInvestasiViewController.h"
//#import "netraKebutuhanViewController.h"
#import "ProductPrima.h"
#import "ProductMaksima.h"
#import "ProductSyariah.h"
#import "ProductBersamaPlus.h"
#import "ProductBersama.h"
#import "ProductUnggulan.h"
#import "ProductSyariahBerimbang.h"
#import "ProductUSD.h"
#import "ProductPrioritas.h"
#import "ProductUtamaPlus2.h"
#import "ProductGebyarIndonesia2.h"
#import "ProductDanaLikuid.h"

#import "KalkulatorHasilInvestasiBerkala.h"
#import "KalkulatorHasilInvestasi.h"
#import "KalkulatorInvestasiBerkala.h"
#import "KalkulatorKebutuhanInvestasi.h"
@implementation netraAppDelegate

- (void)dealloc
{
	[_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[common setSessionId:@""];
[MagicalRecord setupCoreDataStackWithStoreNamed:@"netra.sqlite"];
	[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(setCenter:)
												name:@"dealNotification"
											  object:nil];
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
	self.viewController = [[JASidePanelController alloc] init];
    self.viewController.shouldDelegateAutorotateToVisiblePanel = NO;
	[self setCenter:nil];
	self.viewController.rightPanel = [[netraViewControllerRight alloc] init];
	self.viewController.leftPanel = [[netraLeftViewController alloc] init];
    // Override point for customization after application launch.
	self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)setCenter:(NSNotification *)notification{
	
	NSMutableArray *dict = (NSMutableArray*)notification.object;
	if(notification==nil){
		//	self.mainViewController.centerPanel =nil;
		self.viewController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[[netraViewController alloc] init]];;
		self.lastController=@"netraViewController";
	}
	
	else if([[dict objectAtIndex:0] isEqualToString:self.lastController]){
		
	}
	else if([[dict objectAtIndex:0] isEqualToString:@"- Panin Dana Maksima -"]){
		self.viewController.centerPanel = [[ProductMaksima alloc]init];
	}
    else if([[dict objectAtIndex:0] isEqualToString:@"- Panin Dana Prima -"]){
		self.viewController.centerPanel = [[ProductPrima alloc]init];
	}
    else if([[dict objectAtIndex:0] isEqualToString:@"- Panin Dana Syariah Saham -"]){
		self.viewController.centerPanel = [[ProductSyariah alloc]init];
	}
    else if([[dict objectAtIndex:0] isEqualToString:@"- Panin Dana Bersama Plus -"]){
		self.viewController.centerPanel = [[ProductBersamaPlus alloc]init];
	}
    else if([[dict objectAtIndex:0] isEqualToString:@"- Panin Dana Bersama -"]){
		self.viewController.centerPanel = [[ProductBersama alloc]init];
	}
    else if([[dict objectAtIndex:0] isEqualToString:@"- Panin Dana Unggulan -"]){
		self.viewController.centerPanel = [[ProductUnggulan alloc]init];
	}
    else if([[dict objectAtIndex:0] isEqualToString:@"- Panin Dana Syariah Berimbang -"]){
		self.viewController.centerPanel = [[ProductSyariahBerimbang alloc]init];
	}
    else if([[dict objectAtIndex:0] isEqualToString:@"- Panin Dana USD -"]){
		self.viewController.centerPanel = [[ProductUSD alloc]init];
	}
    else if([[dict objectAtIndex:0] isEqualToString:@"- Panin Dana Prioritas -"]){
		self.viewController.centerPanel = [[ProductPrioritas alloc]init];
	}
    else if([[dict objectAtIndex:0] isEqualToString:@"- Panin Dana Utama Plus 2 -"]){
		self.viewController.centerPanel = [[ProductUtamaPlus2 alloc]init];
        
	}else if([[dict objectAtIndex:0] isEqualToString:@"- Panin Gebyar Indonesia II -"]){
		self.viewController.centerPanel = [[ProductGebyarIndonesia2 alloc]init];
	}
    else if([[dict objectAtIndex:0] isEqualToString:@"- Panin Dana Likuid -"]){
		self.viewController.centerPanel = [[ProductDanaLikuid alloc]init];
	}
    else if([[dict objectAtIndex:0] isEqualToString:@"- Hasil Investasi -"]){
		self.viewController.centerPanel = [[KalkulatorHasilInvestasiBerkala alloc]init];
	}
    else if([[dict objectAtIndex:0] isEqualToString:@"- Kebutuhan Investasi -"]){
		self.viewController.centerPanel = [[KalkulatorKebutuhanInvestasi alloc]init];
	}
    else if([[dict objectAtIndex:0] isEqualToString:@"- Hasil Investasi Berkala -"]){
		self.viewController.centerPanel = [[KalkulatorHasilInvestasi alloc]init];
	}
    else if([[dict objectAtIndex:0] isEqualToString:@"- Kebutuhan Investasi Berkala -"]){
		self.viewController.centerPanel = [[KalkulatorInvestasiBerkala alloc]init];
	}
	else{
		
		self.viewController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[[NSClassFromString([dict objectAtIndex:0]) alloc] init]];
		self.lastController=[dict objectAtIndex:0];
		
	}

}
- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	[MagicalRecord cleanUp];
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
